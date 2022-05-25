// ignore_for_file: camel_case_types

import '../../test_imports.dart';

void main() {
  group('Text widget tests:', () {
    RT_AppRunner? app;

    setUp(() {
      app = createTestApp()..start();
    });

    tearDown(() => app!.stop());

    test('should render text', () async {
      await app!.buildChildren(
        widgets: [
          Text('some text', key: GlobalKey('widget')),
        ],
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('some text'));
    });

    test('should update text', () async {
      await app!.buildChildren(
        widgets: [
          Text('some text', key: GlobalKey('widget')),
        ],
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('some text'));

      await app!.updateChildren(
        widgets: [
          Text('updated text', key: GlobalKey('widget')),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('updated text'));
    });

    test('should add/remove text', () async {
      await app!.buildChildren(
        widgets: [
          Text('', key: GlobalKey('widget')),
        ],
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents(''));

      await app!.updateChildren(
        widgets: [
          Text('added text', key: GlobalKey('widget')),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents('added text'));

      await app!.updateChildren(
        widgets: [
          Text('', key: GlobalKey('widget')),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      expect(RT_TestBed.rootElement, RT_hasContents(''));
    });

    // from templates

    test('should set key', () async {
      await app!.buildChildren(
        widgets: [
          Text('', key: Key('some-key')),
          Text('', key: LocalKey('some-local-key')),
          Text('', key: GlobalKey('some-global-key')),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var wO1 = app!.widgetObjectByKey('some-key', RT_TestBed.rootContext);
      var wO2 = app!.widgetObjectByLocalKey('some-local-key');
      var wO3 = app!.widgetObjectByGlobalKey('some-global-key');

      expect(wO1.context.key.value, endsWith('some-key'));
      expect(wO2.context.key.value, endsWith('some-local-key'));
      expect(wO3.context.key.value, equals('some-global-key'));
    });

    test('should set title', () async {
      await app!.buildChildren(
        widgets: [
          Text('', key: Key('widget-1'), title: 'some title'),
          Text('', key: Key('widget-2'), title: 'some "messy" title'),
          Text('', key: Key('widget-3'), title: "some 'messy' title"),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;
      var element3 = RT_TestBed.rootElement.childNodes[2] as HtmlElement;

      expect(element1.getAttribute('title'), equals('some title'));
      expect(element2.getAttribute('title'), equals('some "messy" title'));
      expect(element3.getAttribute('title'), equals("some 'messy' title"));
    });

    test('should set style', () async {
      await app!.buildChildren(
        widgets: [
          Text('', key: Key('widget-1'), style: 'some style'),
          Text('', key: Key('widget-2'), style: 'some "messy" style'),
          Text('', key: Key('widget-3'), style: "some 'messy' style"),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;
      var element3 = RT_TestBed.rootElement.childNodes[2] as HtmlElement;

      expect(element1.getAttribute('style'), equals('some style'));
      expect(element2.getAttribute('style'), equals('some "messy" style'));
      expect(element3.getAttribute('style'), equals("some 'messy' style"));
    });

    test('should set classes', () async {
      await app!.buildChildren(
        widgets: [
          Text('', classAttribute: 'some class'),
          Text('', classAttribute: 'some "messy" class'),
          Text('', classAttribute: "some 'messy' class"),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;
      var element3 = RT_TestBed.rootElement.childNodes[2] as HtmlElement;

      expect(element1.getAttribute('class'), equals('some class'));
      expect(element2.getAttribute('class'), equals('some "messy" class'));
      expect(element3.getAttribute('class'), equals("some 'messy' class"));
    });

    test('should set attribute "hidden" only if its true', () async {
      await app!.buildChildren(
        widgets: [
          Text('', key: GlobalKey('el-1'), hidden: false),
          Text('', key: GlobalKey('el-2'), hidden: null),
          Text('', key: GlobalKey('el-3'), hidden: true),
        ],
        parentContext: app!.appContext,
      );

      var element1 = app!.elementByGlobalKey('el-1');
      var element2 = app!.elementByGlobalKey('el-2');
      var element3 = app!.elementByGlobalKey('el-3');

      expect(element1.getAttribute('hidden'), equals(null));
      expect(element2.getAttribute('hidden'), equals(null));
      expect(element3.getAttribute('hidden'), equals('true'));
    });

    test('should clear attribute "hidden" if updated value is not true',
        () async {
      await app!.buildChildren(
        widgets: [
          Text('', key: GlobalKey('el-1'), hidden: true),
          Text('', key: GlobalKey('el-2'), hidden: true),
          Text('', key: GlobalKey('el-3'), hidden: true),
          Text('', key: GlobalKey('el-4'), hidden: true),
        ],
        parentContext: app!.appContext,
      );

      await app!.updateChildren(
        widgets: [
          Text('', key: GlobalKey('el-1'), hidden: true),
          Text('', key: GlobalKey('el-2'), hidden: false),
          Text('', key: GlobalKey('el-3'), hidden: null),
          Text('', key: GlobalKey('el-4')),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      var element1 = app!.elementByGlobalKey('el-1');
      var element2 = app!.elementByGlobalKey('el-2');
      var element3 = app!.elementByGlobalKey('el-3');
      var element4 = app!.elementByGlobalKey('el-4');

      expect(element1.getAttribute('hidden'), equals('true'));
      expect(element2.getAttribute('hidden'), equals(null));
      expect(element3.getAttribute('hidden'), equals(null));
      expect(element4.getAttribute('hidden'), equals(null));
    });

    test('should set onClick', () async {
      await app!.buildChildren(
        widgets: [
          Text(
            '',
            key: Key('widget-1'),
            onClickAttribute: 'some onClick',
          ),
          Text(
            '',
            key: Key('widget-2'),
            onClickAttribute: 'some "messy" onClick',
          ),
          Text(
            '',
            key: Key('widget-3'),
            onClickAttribute: "some 'messy' onClick",
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;
      var element3 = RT_TestBed.rootElement.childNodes[2] as HtmlElement;

      expect(
        element1.getAttribute('onclick'),
        equals('some onClick'),
      );

      expect(
        element2.getAttribute('onclick'),
        equals('some "messy" onClick'),
      );

      expect(
        element3.getAttribute('onclick'),
        equals("some 'messy' onClick"),
      );
    });

    test('should set "click" event listener', () async {
      var testStack = RT_TestStack();

      await app!.buildChildren(
        widgets: [
          Text(
            '',
            key: GlobalKey('el-1'),
            onClick: (event) => testStack.push('click-1'),
          ),
          Text(
            '',
            key: GlobalKey('el-2'),
            onClick: (event) => testStack.push('click-2'),
          ),
        ],
        parentContext: app!.appContext,
      );

      app!.elementByGlobalKey('el-1').dispatchEvent(Event('click'));
      app!.elementByGlobalKey('el-2').dispatchEvent(Event('click'));

      await Future.delayed(Duration.zero, () {
        expect(testStack.popFromStart(), equals('click-1'));
        expect(testStack.popFromStart(), equals('click-2'));
        expect(testStack.canPop(), equals(false));
      });
    });

    test('should set "click" event listener only if provided', () async {
      void listener(event) => {};

      await app!.buildChildren(
        widgets: [
          Text('', key: GlobalKey('el-1')),
          Text('', key: GlobalKey('el-2'), onClick: null),
          Text('', key: GlobalKey('el-3'), onClick: listener),
        ],
        parentContext: app!.appContext,
      );

      var listeners1 = app!.widget('el-1').widgetEventListeners;
      var listeners2 = app!.widget('el-2').widgetEventListeners;
      var listeners3 = app!.widget('el-3').widgetEventListeners;

      expect(listeners1[DomEventType.click], equals(null));
      expect(listeners2[DomEventType.click], equals(null));
      expect(listeners3[DomEventType.click], equals(listener));
    });

    test('should clear "click" event listner', () async {
      void listener(event) => {};

      await app!.buildChildren(
        widgets: [
          Text('', key: GlobalKey('el-1')),
          Text('', key: GlobalKey('el-2'), onClick: listener),
        ],
        parentContext: app!.appContext,
      );

      var listeners1 = app!.widget('el-1').widgetEventListeners;
      var listeners2 = app!.widget('el-2').widgetEventListeners;

      expect(listeners1[DomEventType.click], equals(null));
      expect(listeners2[DomEventType.click], equals(listener));

      // update

      await app!.updateChildren(
        widgets: [
          Text('', key: GlobalKey('el-1')),
          Text('', key: GlobalKey('el-2')),
        ],
        updateType: UpdateType.setState,
        parentContext: app!.appContext,
      );

      listeners1 = app!.widget('el-1').widgetEventListeners;
      listeners2 = app!.widget('el-2').widgetEventListeners;

      expect(listeners1[DomEventType.click], equals(null));
      expect(listeners2[DomEventType.click], equals(null));
    });
  });
}