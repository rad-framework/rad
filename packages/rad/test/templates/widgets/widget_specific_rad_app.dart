test('RadApp widget - widgetType override test', () {
  var widget = RadApp(child: Text(''));

  expect(widget.widgetType,  equals('$RadApp'));
});