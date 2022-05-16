// Auto-generated file
//
// Sources of these tests can be found in /test/templates folder

// ignore_for_file: non_constant_identifier_names

part of '_html_tests_index_test.dart';

void html_div_test() {
  group('HTML Division tests:', () {
    RT_AppRunner? app;

    setUp(() {
      app = createTestApp()..start();
    });

    tearDown(() => app!.stop());

    test('should set child widget', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('widget-1'),
            child: Division(
              key: GlobalKey('widget-2'),
            ),
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = element1.childNodes[0] as HtmlElement;

      expect(element1.id, equals('widget-1'));
      expect(element2.id, equals('widget-2'));
    });

    test('should set children widgets', () {
      app!.framework.buildChildren(
        widgets: [
          Division(key: GlobalKey('widget-1'), children: [
            Division(
              key: GlobalKey('widget-2'),
            ),
            Division(
              key: GlobalKey('widget-3'),
            ),
          ]),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = element1.childNodes[0] as HtmlElement;
      var element3 = element1.childNodes[1] as HtmlElement;

      expect(element1.id, equals('widget-1'));
      expect(element2.id, equals('widget-2'));
      expect(element3.id, equals('widget-3'));
    });

    test('should set classes', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: Key('widget-1'),
            classAttribute: 'some class',
          ),
          Division(
            key: Key('widget-2'),
            classAttribute: 'some "messy" class',
          ),
          Division(
            key: Key('widget-3'),
            classAttribute: "some 'messy' class",
          ),
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

    test('should set contenteditable', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: Key('widget-1'),
            contenteditable: false,
          ),
          Division(
            key: Key('widget-2'),
            contenteditable: true,
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;

      expect(element1.getAttribute('contenteditable'), equals('false'));
      expect(element2.getAttribute('contenteditable'), equals('true'));
    });

    test('should set draggable', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: Key('widget-1'),
            draggable: false,
          ),
          Division(
            key: Key('widget-2'),
            draggable: true,
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;

      expect(element1.getAttribute('draggable'), equals('false'));
      expect(element2.getAttribute('draggable'), equals('true'));
    });

    test('should set hidden', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: Key('widget-1'),
            hidden: false,
          ),
          Division(
            key: Key('widget-2'),
            hidden: true,
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;

      expect(element1.hidden, equals(false));
      expect(element2.hidden, equals(true));
    });

    test('should set inner text', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('widget-1'),
            innerText: 'hello world',
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;

      // we are using innerHtml as inner text is not accessible
      // or returns empty string for some node(e.g progress)

      expect(element1.innerHtml, equals('hello world'));
    });

    test('should set onClick', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: Key('widget-1'),
            onClick: 'some onClick',
          ),
          Division(
            key: Key('widget-2'),
            onClick: 'some "messy" onClick',
          ),
          Division(
            key: Key('widget-3'),
            onClick: "some 'messy' onClick",
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

    test('should set onclick event listener', () {
      var testStack = RT_TestStack();

      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            onClickEventListener: (event) => testStack.push('clicked'),
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;

      element1
        ..click()
        ..click();

      expect(testStack.popFromStart(), equals('clicked'));
      expect(testStack.popFromStart(), equals('clicked'));
      expect(testStack.canPop(), equals(false));
    });

    test('should set style', () {
      app!.framework.buildChildren(
        widgets: [
          Division(key: Key('widget-1'), style: 'some style'),
          Division(key: Key('widget-2'), style: 'some "messy" style'),
          Division(key: Key('widget-3'), style: "some 'messy' style"),
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

    test('should set tab index', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: Key('widget-1'),
            tabIndex: 1,
          ),
          Division(
            key: Key('widget-2'),
            tabIndex: 2,
          ),
          Division(
            key: Key('widget-3'),
            tabIndex: 3,
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;
      var element3 = RT_TestBed.rootElement.childNodes[2] as HtmlElement;

      expect(element1.getAttribute('tabindex'), equals('1'));
      expect(element2.getAttribute('tabindex'), equals('2'));
      expect(element3.getAttribute('tabindex'), equals('3'));
    });

    test('should set title', () {
      app!.framework.buildChildren(
        widgets: [
          Division(key: Key('widget-1'), title: 'some title'),
          Division(key: Key('widget-2'), title: 'some "messy" title'),
          Division(key: Key('widget-3'), title: "some 'messy' title"),
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

    test('should set correct types and markup', () {
      app!.framework.buildChildren(
        widgets: [
          Division(key: GlobalKey('some-global-key')),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      expect(
        RT_TestBed.rootElement.innerHtml,
        startsWith(
          '<div id="some-global-key" '
          'data-${Constants.attrWidgetType}="$Division" '
          'data-${Constants.attrRuntimeType}="$Division">',
          // Better to check leading part only(without closing tag)
          // Because some tags(e.g img) might don't have a closing tag
          // '</div>',
        ),
      );
    });

    test('should set data attributes', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            dataAttributes: {
              'something': 'something okay',
              'another': 'another okay',
            },
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;

      expect(element1.dataset['something'], equals('something okay'));
      expect(element1.dataset['another'], equals('another okay'));
    });

    test('should remove obsolute and add new data attributes on update', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            dataAttributes: {
              'something': 'something okay',
            },
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      app!.framework.updateChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            dataAttributes: {
              'something-new': 'something new',
            },
          ),
        ],
        updateType: UpdateType.undefined,
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;

      expect(element1.dataset['something'], equals(null));
      expect(element1.dataset['something-new'], equals('something new'));
    });

    test('should not override system reserved data attributes on build', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            dataAttributes: {
              'something': 'something okay',
              Constants.attrWidgetType: "must ignore",
              Constants.attrRuntimeType: "must ignore",
              Constants.attrStateType: "must ignore",
              Constants.attrRouteName: "must ignore",
              Constants.attrRoutePath: "must ignore",
            },
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;

      expect(element1.dataset['something'], equals('something okay'));

      expect(element1.dataset[Constants.attrWidgetType], equals("$Division"));
      expect(element1.dataset[Constants.attrRuntimeType], equals("$Division"));
      expect(element1.dataset[Constants.attrStateType], equals(null));
      expect(element1.dataset[Constants.attrRouteName], equals(null));
      expect(element1.dataset[Constants.attrRoutePath], equals(null));
    });

    test('should not remove system reserved data attributes on update', () {
      app!.framework.buildChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            dataAttributes: {
              'something': 'something okay',
              Constants.attrWidgetType: "must ignore",
              Constants.attrRuntimeType: "must ignore",
              Constants.attrStateType: "must ignore",
              Constants.attrRouteName: "must ignore",
              Constants.attrRoutePath: "must ignore",
            },
          ),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      app!.framework.updateChildren(
        widgets: [
          Division(
            key: GlobalKey('some-global-key'),
            dataAttributes: {
              'something': 'something new',
              'something-diff': 'something diff',
              Constants.attrWidgetType: "must ignore",
              Constants.attrRuntimeType: "must ignore",
              Constants.attrStateType: "must ignore",
              Constants.attrRouteName: "must ignore",
              Constants.attrRoutePath: "must ignore",
            },
          ),
        ],
        updateType: UpdateType.undefined,
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;

      expect(element1.dataset['something'], equals('something new'));
      expect(element1.dataset['something-diff'], equals('something diff'));
      expect(element1.dataset[Constants.attrWidgetType], equals("$Division"));
      expect(element1.dataset[Constants.attrRuntimeType], equals("$Division"));
      expect(element1.dataset[Constants.attrStateType], equals(null));
      expect(element1.dataset[Constants.attrRouteName], equals(null));
      expect(element1.dataset[Constants.attrRoutePath], equals(null));
    });

    test('should set key', () {
      app!.framework.buildChildren(
        widgets: [
          Division(key: Key('some-key')),
          Division(key: LocalKey('some-local-key')),
          Division(key: GlobalKey('some-global-key')),
        ],
        parentContext: RT_TestBed.rootContext,
      );

      var element1 = RT_TestBed.rootElement.childNodes[0] as HtmlElement;
      var element2 = RT_TestBed.rootElement.childNodes[1] as HtmlElement;
      var element3 = RT_TestBed.rootElement.childNodes[2] as HtmlElement;

      expect(element1.id, endsWith('some-key'));
      expect(element2.id, endsWith('some-local-key'));
      expect(element3.id, equals('some-global-key'));
    });
  });
}