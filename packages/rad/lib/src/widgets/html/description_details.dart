// Copyright (c) 2022, Rad developers. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';

import 'package:rad/src/core/common/enums.dart';
import 'package:rad/src/core/common/objects/key.dart';
import 'package:rad/src/core/common/types.dart';
import 'package:rad/src/widgets/abstract/html_widget_base.dart';
import 'package:rad/src/widgets/abstract/widget.dart';

/// The DescriptionDetail widget (HTML's `dd` tag).
///
class DescriptionDetails extends HTMLWidgetBase {
  const DescriptionDetails({
    Key? key,
    String? id,
    String? title,
    String? style,
    String? className,
    int? tabIndex,
    bool? draggable,
    bool? contentEditable,
    bool? hidden,
    String? innerText,
    List<Widget>? children,
    EventCallback? onClick,
    Map<String, String>? additionalAttributes,
  }) : super(
          key: key,
          id: id,
          title: title,
          style: style,
          className: className,
          tabIndex: tabIndex,
          draggable: draggable,
          contentEditable: contentEditable,
          hidden: hidden,
          innerText: innerText,
          children: children,
          onClick: onClick,
          additionalAttributes: additionalAttributes,
        );

  @nonVirtual
  @override
  String get widgetType => 'DescriptionDetails';

  @override
  DomTagType get correspondingTag => DomTagType.descriptionDetails;
}