// Auto-generated file
//
// Sources of these tests can be found in /test/templates folder

// ignore_for_file: non_constant_identifier_names

part of '../_index_widgets_tests.dart';

void widget_stateful_widget_test() {
  group('Widget specific tests for StatefulWidget widget:', () {
    RT_AppRunner? app;

    setUp(() {
      app = createTestApp()..start();
    });

    tearDown(() => app!.stop());

    test('Stateful widget - widgetType override test', () {
      var widget = RT_StatefulTestWidget();

      expect(widget.widgetType, '$StatefulWidget');
    });

    test('Stateful widget - description test', () async {
      var pap = app!;

      await pap.buildChildren(
        widgets: [
          RT_StatefulTestWidget(
            key: GlobalKey('widget'),
          ),
        ],
        parentContext: pap.appContext,
      );

      var element = pap.elementByGlobalKey('widget');

      expect(
        element.dataset[Constants.attrWidgetType],
        equals('$StatefulWidget'),
      );
    });
  });
}