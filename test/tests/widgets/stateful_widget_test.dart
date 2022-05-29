// ignore_for_file: camel_case_types

import '../../test_imports.dart';

void main() {
  group('State hooks :', () {
    setUp(() {
      ServicesRegistry.instance.unRegisterServices(RT_TestBed.rootContext);
    });

    test('should bind widget before initState, type test', () async {
      runApp(
        app: RT_StatefulTestWidget(
          key: GlobalKey('widget'),
          stateHookInitState: (state) {
            expect(state.widget.runtimeType, equals(RT_StatefulTestWidget));
          },
        ),
        targetId: RT_TestBed.rootKey.value,
      );

      await Future.delayed(Duration.zero);
    });

    test('should bind widget before initState, key test', () async {
      runApp(
        app: RT_StatefulTestWidget(
          key: GlobalKey('widget'),
          stateHookInitState: (state) {
            expect(state.context.key.value, equals('widget'));
          },
        ),
        targetId: RT_TestBed.rootKey.value,
      );

      await Future.delayed(Duration.zero);
    });

    test(
      'should always throw if State.widget is accessed from state constructor',
      () async {
        var app = createTestApp()..start();

        expect(
          () => app.buildChildrenSync(
            widgets: [
              RT_StatefulTestWidget(
                stateHookCreateState: (state) => state.widget,
              ),
            ],
            parentContext: app.appContext,
          ),
          throwsA(
            predicate(
              (e) => '$e'.startsWith(
                'Exception: State.widget instance cannot be accessed in state',
              ),
            ),
          ),
        );

        await Future.delayed(Duration.zero);
      },
    );

    test(
      'should always throw if State.context is accessed from state constructor',
      () async {
        var app = createTestApp()..start();

        expect(
          () => app.buildChildrenSync(
            widgets: [
              RT_StatefulTestWidget(
                stateHookCreateState: (state) => state.context,
              ),
            ],
            parentContext: app.appContext,
          ),
          throwsA(
            predicate(
              (e) => '$e'.startsWith(
                'Exception: State.context instance cannot be accessed in state',
              ),
            ),
          ),
        );

        await Future.delayed(Duration.zero);
      },
    );

    test('should call did change dependencies after initState', () async {
      var testStack = RT_TestStack();

      runApp(
        app: RT_StatefulTestWidget(
          stateEventInitState: () => testStack.push('init state'),
          stateEventDidChangeDependencies: () => testStack.push(
            'did change dependencies',
          ),
        ),
        targetId: RT_TestBed.rootKey.value,
      );

      await Future.delayed(Duration.zero, () {
        expect(testStack.popFromStart(), equals('init state'));
        expect(testStack.popFromStart(), equals('did change dependencies'));
        expect(testStack.canPop(), equals(false));
      });
    });

    test('should call build after did change dependencies', () async {
      var testStack = RT_TestStack();

      runApp(
        app: RT_StatefulTestWidget(
          stateEventInitState: () => testStack.push('init state'),
          stateEventBuild: () => testStack.push('build'),
          stateEventDidChangeDependencies: () => testStack.push(
            'did change dependencies',
          ),
        ),
        targetId: RT_TestBed.rootKey.value,
      );

      await Future.delayed(Duration.zero, () {
        expect(testStack.popFromStart(), equals('init state'));
        expect(testStack.popFromStart(), equals('did change dependencies'));
        expect(testStack.popFromStart(), equals('build'));
        expect(testStack.canPop(), equals(false));
      });
    });

    test('should defer setState called in initState', () async {
      var testStack = RT_TestStack();
      var i = 1;

      runApp(
        app: RT_StatefulTestWidget(
          stateHookInitState: (state) {
            testStack.push('init state');

            // ignore: invalid_use_of_protected_member
            state.setState(() {
              testStack.push('set state');
            });
          },
          stateEventBuild: () => testStack.push('build-${i++}'),
          stateEventDidUpdateWidget: () => testStack.push('did update widget'),
          stateEventDidChangeDependencies: () => testStack.push(
            'did change dependencies',
          ),
        ),
        targetId: RT_TestBed.rootKey.value,
      );

      await Future.delayed(Duration.zero, () {
        expect(testStack.popFromStart(), equals('init state'));
        expect(testStack.popFromStart(), equals('did change dependencies'));
        expect(testStack.popFromStart(), equals('build-1'));
        expect(testStack.popFromStart(), equals('set state'));
        expect(testStack.popFromStart(), equals('build-2'));
        expect(testStack.canPop(), equals(false));
      });
    });

    test('should not call didUpdateWidget for initial build', () async {
      var testStack = RT_TestStack();

      runApp(
        app: RT_StatefulTestWidget(
          stateEventInitState: () => testStack.push('init state'),
          stateEventBuild: () => testStack.push('build'),
          stateEventDidUpdateWidget: () => testStack.push('did update widget'),
          stateEventDidChangeDependencies: () => testStack.push(
            'did change dependencies',
          ),
        ),
        targetId: RT_TestBed.rootKey.value,
      );

      await Future.delayed(Duration.zero, () {
        expect(testStack.popFromStart(), equals('init state'));
        expect(testStack.popFromStart(), equals('did change dependencies'));
        expect(testStack.popFromStart(), equals('build'));
        expect(testStack.canPop(), equals(false));
      });
    });

    test(
      'should call didUpdateWidget with old widget when widget is swapped',
      () async {
        var testStack = RT_TestStack();
        var i = 1;

        var app = createTestApp()..start();

        await app.buildChildren(
          widgets: [
            RT_StatefulTestWidget(
              customHash: 'old',
              stateEventCreateState: () => testStack.push('create state 1a'),
              stateEventInitState: () => testStack.push('init state 1a'),
              stateEventBuild: () => testStack.push('build-${i++} 1a'),
              stateEventDidUpdateWidget: () => testStack.push(
                'did update widget 1a',
              ),
              stateHookDidUpdateWidget: (state, widget) {
                widget as RT_StatefulTestWidget;

                expect(widget.hash, equals('old'));
                expect(state.widget.hash, equals('new'));
              },
              stateEventDidChangeDependencies: () => testStack.push(
                'did change dependencies 1a',
              ),
            ),
          ],
          parentContext: app.appContext,
        );

        await app.updateChildren(
          widgets: [
            RT_StatefulTestWidget(
              customHash: 'new',
              stateEventCreateState: () => testStack.push('create state 1b'),
              stateEventInitState: () => testStack.push('init state 1b'),
              stateEventBuild: () => testStack.push('build-${i++} 1b'),
              stateEventDidUpdateWidget: () => testStack.push(
                'did update widget 1b',
              ),
              stateHookDidUpdateWidget: (state, widget) {
                throw Exception('should never gets called');
              },
              stateEventDidChangeDependencies: () => testStack.push(
                'did change dependencies 1b',
              ),
            ),
          ],
          updateType: UpdateType.undefined,
          parentContext: app.appContext,
        );

        expect(testStack.popFromStart(), equals('create state 1a'));
        expect(testStack.popFromStart(), equals('init state 1a'));
        expect(testStack.popFromStart(), equals('did change dependencies 1a'));
        expect(testStack.popFromStart(), equals('build-1 1a'));
        expect(testStack.popFromStart(), equals('did update widget 1a'));
        expect(testStack.popFromStart(), equals('build-2 1a'));
        expect(testStack.canPop(), equals(false));
      },
    );

    test('should call dispose when widget is removed', () async {
      var testStack = RT_TestStack();

      var app = createTestApp()..start();

      await app.buildChildren(
        widgets: [
          RT_StatefulTestWidget(
            key: GlobalKey('old'),
            stateEventCreateState: () => testStack.push('create state 1a'),
            stateEventInitState: () => testStack.push('init state 1a'),
            stateEventBuild: () => testStack.push('build 1a'),
            stateEventDidUpdateWidget: () => testStack.push(
              'did update widget 1a',
            ),
            stateEventDidChangeDependencies: () => testStack.push(
              'did change dependencies 1a',
            ),
            stateEventDispose: () => testStack.push('dispose 1a'),
          ),
        ],
        parentContext: app.appContext,
      );

      await app.updateChildren(
        widgets: [
          RT_StatefulTestWidget(
            key: GlobalKey('new'),
            stateEventCreateState: () => testStack.push('create state 1b'),
            stateEventInitState: () => testStack.push('init state 1b'),
            stateEventBuild: () => testStack.push('build 1b'),
            stateEventDidUpdateWidget: () => testStack.push(
              'did update widget 1b',
            ),
            stateEventDidChangeDependencies: () => testStack.push(
              'did change dependencies 1b',
            ),
            stateEventDispose: () => testStack.push('dispose 1b'),
          ),
        ],
        updateType: UpdateType.undefined,
        parentContext: app.appContext,
      );

      expect(testStack.popFromStart(), equals('create state 1a'));
      expect(testStack.popFromStart(), equals('init state 1a'));
      expect(testStack.popFromStart(), equals('did change dependencies 1a'));
      expect(testStack.popFromStart(), equals('build 1a'));
      expect(testStack.popFromStart(), equals('dispose 1a'));

      // after dispose

      expect(testStack.popFromStart(), equals('create state 1b'));
      expect(testStack.popFromStart(), equals('init state 1b'));
      expect(testStack.popFromStart(), equals('did change dependencies 1b'));
      expect(testStack.popFromStart(), equals('build 1b'));
      expect(testStack.canPop(), equals(false));
    });

    //
  });

  group('Widget building proccess :', () {
    RT_AppRunner? app;

    setUp(() {
      app = createTestApp()..start();
    });

    tearDown(() => app!.stop());

    test('should build widgets in order', () async {
      var testStack = RT_TestStack();

      await app!.buildChildren(
        widgets: [
          RT_StatefulTestWidget(
            stateEventBuild: () => testStack.push('build-1a'),
          ),
          RT_StatefulTestWidget(
            stateEventBuild: () => testStack.push('build-1b'),
          ),
          RT_StatefulTestWidget(
            stateEventBuild: () => testStack.push('build-1c'),
          ),
        ],
        parentContext: app!.appContext,
      );

      expect(testStack.popFromStart(), equals('build-1a'));
      expect(testStack.popFromStart(), equals('build-1b'));
      expect(testStack.popFromStart(), equals('build-1c'));

      expect(testStack.canPop(), equals(false));
    });

    test('should update widgets in order', () async {
      var testStack = RT_TestStack();

      await app!.buildChildren(
        widgets: [
          RT_StatefulTestWidget(
            stateEventBuild: () => testStack.push('build-a'),
          ),
          RT_StatefulTestWidget(
            stateEventBuild: () => testStack.push('build-b'),
          ),
          RT_StatefulTestWidget(
            stateEventBuild: () => testStack.push('build-c'),
          ),
        ],
        parentContext: app!.appContext,
      );

      await app!.updateChildren(
        widgets: [
          RT_StatefulTestWidget(),
          RT_StatefulTestWidget(),
          RT_StatefulTestWidget(),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      expect(testStack.popFromStart(), equals('build-a'));
      expect(testStack.popFromStart(), equals('build-b'));
      expect(testStack.popFromStart(), equals('build-c'));

      // stateful widgets always call build on previous state object

      expect(testStack.popFromStart(), equals('build-a'));
      expect(testStack.popFromStart(), equals('build-b'));
      expect(testStack.popFromStart(), equals('build-c'));

      expect(testStack.canPop(), equals(false));
    });
  });
}
