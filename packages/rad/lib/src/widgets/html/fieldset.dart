// Copyright (c) 2022, Rad developers. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:rad/src/core/common/constants.dart';
import 'package:rad/src/core/common/enums.dart';
import 'package:rad/src/core/common/objects/key.dart';
import 'package:rad/src/core/common/types.dart';
import 'package:rad/src/widgets/abstract/html_widget_base.dart';
import 'package:rad/src/widgets/abstract/widget.dart';

/// The FieldSet widget (HTML's `fieldset` tag).
///
/// Group several controls as well as labels (<label>) within a web form.
///
class FieldSet extends HTMLWidgetBase {
  /// The name associated with the group.
  ///
  final String? name;

  /// This attribute takes the value of the id attribute of a form element
  /// you want the fieldset to be part of, even if it is not inside the form.
  /// Please note that usage of this is confusing — if you want the input
  /// elements inside the fieldset to be associated with the form, you need
  /// to use the form attribute directly on those elements.
  ///
  final String? form;

  /// Whether field set is disabled.
  ///
  final bool? disabled;

  const FieldSet({
    this.name,
    this.form,
    this.disabled,
    Key? key,
    NullableElementCallback? ref,
    String? id,
    String? title,
    String? style,
    String? className,
    bool? hidden,
    String? innerText,
    Widget? child,
    List<Widget>? children,
    EventCallback? onClick,
    Map<String, String>? additionalAttributes,
  }) : super(
          key: key,
          ref: ref,
          id: id,
          title: title,
          style: style,
          className: className,
          hidden: hidden,
          innerText: innerText,
          child: child,
          children: children,
          onClick: onClick,
          additionalAttributes: additionalAttributes,
        );

  @override
  DomTagType get correspondingTag => DomTagType.fieldSet;

  @override
  bool shouldUpdateWidget(covariant FieldSet oldWidget) {
    return name != oldWidget.name ||
        form != oldWidget.form ||
        disabled != oldWidget.disabled ||
        super.shouldUpdateWidget(oldWidget);
  }

  @override
  createRenderElement(parent) => FieldSetRenderElement(this, parent);
}

/*
|--------------------------------------------------------------------------
| render element
|--------------------------------------------------------------------------
*/

/// Field set render element.
///
class FieldSetRenderElement extends HTMLRenderElementBase {
  FieldSetRenderElement(super.widget, super.parent);

  @override
  render({
    required covariant FieldSet widget,
  }) {
    var domNodePatch = super.render(
      widget: widget,
    );

    _extendAttributes(
      widget: widget,
      oldWidget: null,
      attributes: domNodePatch.attributes,
    );

    return domNodePatch;
  }

  @override
  update({
    required updateType,
    required covariant FieldSet oldWidget,
    required covariant FieldSet newWidget,
  }) {
    var domNodePatch = super.update(
      updateType: updateType,
      oldWidget: oldWidget,
      newWidget: newWidget,
    );

    _extendAttributes(
      widget: newWidget,
      oldWidget: oldWidget,
      attributes: domNodePatch.attributes,
    );

    return domNodePatch;
  }
}

/*
|--------------------------------------------------------------------------
| patch
|--------------------------------------------------------------------------
*/

void _extendAttributes({
  required FieldSet widget,
  required FieldSet? oldWidget,
  required Map<String, String?> attributes,
}) {
  if (widget.name != oldWidget?.name) {
    attributes[Attributes.name] = widget.name;
  }

  if (widget.form != oldWidget?.form) {
    attributes[Attributes.form] = widget.form;
  }

  if (widget.disabled != oldWidget?.disabled) {
    if (null == widget.disabled || false == widget.disabled) {
      attributes[Attributes.disabled] = null;
    } else {
      attributes[Attributes.disabled] = 'true';
    }
  }
}
