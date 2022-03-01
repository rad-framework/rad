import 'dart:html';

import 'package:rad/src/core/constants.dart';
import 'package:rad/src/core/structures/build_context.dart';
import 'package:rad/src/core/objects/render_object.dart';
import 'package:rad/src/core/structures/widget.dart';
import 'package:rad/src/core/utils.dart';

/// A wrapper for containing everything that can belong to a single widget.
///
/// Before using [htmlElement] make sure to check if element is actually
/// created or not using [isCreated] getter.
///
/// Another getter [isMounted] can be used to check if element is actually
/// mounted inside DOM or not.
///
class WidgetObject {
  final BuildContext context;

  final Widget widget;
  final RenderObject renderObject;
  late final HtmlElement htmlElement;

  var _isMounted = false;
  var _isCreated = false;

  bool get isCreated => _isCreated;
  bool get isMounted => _isMounted;

  WidgetObject({
    required this.widget,
    required this.renderObject,
  }) : context = renderObject.context;

  void createHtmlElement() {
    var tag = Utils.mapDomTag(widget.tag);

    htmlElement = document.createElement(tag) as HtmlElement;

    htmlElement.id = renderObject.context.key;
    htmlElement.dataset[Constants.attrClass] = renderObject.context.widgetType;
    htmlElement.dataset[Constants.attrClass] =
        renderObject.context.widgetClassName;

    _isCreated = true;
  }

  void mount() {
    if (_isMounted) {
      throw "Widget's element already mounted.";
    }

    // we can't use node.parent here cus root widget's parent can be null

    var parentElement = document.getElementById(
      renderObject.context.parent.key,
    );

    if (null == parentElement) {
      throw "Unable to find parent widget of element #${context.key}. Either disposed or something went wrong;";
    }

    parentElement.append(htmlElement);

    _isMounted = true;
  }

  void build() {
    renderObject.render(this);
  }
}
