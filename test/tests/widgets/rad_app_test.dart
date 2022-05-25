// ignore_for_file: camel_case_types

import '../../test_imports.dart';

void main() {
  group('RadApp widget tests:', () {
    RT_AppRunner? app;

    setUp(() {
      app = createTestApp()..start();
    });

    tearDown(() => app!.stop());

    test('should render child', () async {
      await app!.buildChildren(
        widgets: [
          RadApp(child: Text('contents')),
        ],
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('contents'));
    });

    test('should update child', () async {
      await app!.buildChildren(
        widgets: [
          RadApp(child: Text('contents')),
        ],
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('contents'));

      await app!.updateChildren(
        widgets: [
          RadApp(child: Text('updated contents')),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('updated contents'));
    });

    test(
      'should act as normal widget(multiple instance for example)',
      () async {
        await app!.buildChildren(
          widgets: [
            RadApp(child: Text('1')),
            RadApp(child: Text('2')),
            RadApp(child: Text('3')),
            RadApp(child: Text('4')),
          ],
          parentContext: app!.appContext,
        );

        expect(RT_TestBed.rootElement, RT_hasContents('1|2|3|4'));

        await app!.updateChildren(
          widgets: [
            RadApp(child: Text('4')),
            RadApp(child: Text('3')),
            RadApp(child: Text('2')),
            RadApp(child: Text('1')),
          ],
          updateType: UpdateType.setState,
          parentContext: app!.appContext,
        );

        expect(RT_TestBed.rootElement, RT_hasContents('4|3|2|1'));

        await app!.updateChildren(
          widgets: [
            RadApp(child: Text('1')),
          ],
          updateType: UpdateType.setState,
          parentContext: app!.appContext,
        );

        expect(RT_TestBed.rootElement, RT_hasContents('1'));
      },
    );
  });
}