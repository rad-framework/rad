import 'package:meta/meta.dart';

import 'package:rad/src/core/common/constants.dart';
import 'package:rad/src/core/common/enums.dart';
import 'package:rad/src/core/common/objects/build_context.dart';
import 'package:rad/src/core/common/objects/key.dart';
import 'package:rad/src/core/common/types.dart';
import 'package:rad/src/widgets/abstract/html_widget_base.dart';
import 'package:rad/src/widgets/abstract/widget.dart';

/// The Image widget (HTML's `img` tag).
///
class Image extends HTMLWidgetBase {
  /// Image src.
  ///
  final String? src;

  /// Alt text for image.
  ///
  final String? alt;

  // size props

  final String? width;
  final String? height;

  const Image({
    this.src,
    this.alt,
    this.width,
    this.height,
    Key? key,
    bool? hidden,
    bool? draggable,
    bool? contenteditable,
    int? tabIndex,
    String? id,
    String? title,
    String? style,
    String? classAttribute,
    Map<String, String>? dataAttributes,
    String? onClickAttribute,
    String? innerText,
    Widget? child,
    List<Widget>? children,
    EventCallback? onClick,
  }) : super(
          key: key,
          id: id,
          title: title,
          tabIndex: tabIndex,
          draggable: draggable,
          contenteditable: contenteditable,
          hidden: hidden,
          style: style,
          classAttribute: classAttribute,
          dataAttributes: dataAttributes,
          onClickAttribute: onClickAttribute,
          innerText: innerText,
          child: child,
          children: children,
          onClick: onClick,
        );

  @nonVirtual
  @override
  String get widgetType => 'Image';

  @override
  DomTagType get correspondingTag => DomTagType.image;

  @override
  createConfiguration() {
    return _ImageConfiguration(
      src: src,
      alt: alt,
      width: width,
      height: height,
      globalConfiguration:
          super.createConfiguration() as HTMLWidgetBaseConfiguration,
    );
  }

  @override
  isConfigurationChanged(covariant _ImageConfiguration oldConfiguration) {
    return src != oldConfiguration.src ||
        alt != oldConfiguration.alt ||
        width != oldConfiguration.width ||
        height != oldConfiguration.height ||
        super.isConfigurationChanged(oldConfiguration.globalConfiguration);
  }

  @override
  createRenderObject(context) => _ImageRenderObject(context);
}

/*
|--------------------------------------------------------------------------
| configuration
|--------------------------------------------------------------------------
*/

class _ImageConfiguration extends WidgetConfiguration {
  final HTMLWidgetBaseConfiguration globalConfiguration;

  final String? src;
  final String? alt;

  final String? width;
  final String? height;

  const _ImageConfiguration({
    this.src,
    this.alt,
    this.width,
    this.height,
    required this.globalConfiguration,
  });
}

/*
|--------------------------------------------------------------------------
| render object
|--------------------------------------------------------------------------
*/

class _ImageRenderObject extends MarkUpGlobalRenderObject {
  const _ImageRenderObject(BuildContext context) : super(context);

  @override
  render({
    required covariant _ImageConfiguration configuration,
  }) {
    var domNodeDescription = super.render(
      configuration: configuration.globalConfiguration,
    );

    domNodeDescription?.attributes?.addAll(
      _prepareAttributes(
        props: configuration,
        oldProps: null,
      ),
    );

    return domNodeDescription;
  }

  @override
  update({
    required updateType,
    required covariant _ImageConfiguration oldConfiguration,
    required covariant _ImageConfiguration newConfiguration,
  }) {
    var domNodeDescription = super.update(
      updateType: updateType,
      oldConfiguration: oldConfiguration.globalConfiguration,
      newConfiguration: newConfiguration.globalConfiguration,
    );

    domNodeDescription?.attributes?.addAll(
      _prepareAttributes(
        props: newConfiguration,
        oldProps: oldConfiguration,
      ),
    );

    return domNodeDescription;
  }
}

/*
|--------------------------------------------------------------------------
| props
|--------------------------------------------------------------------------
*/

Map<String, String?> _prepareAttributes({
  required _ImageConfiguration props,
  required _ImageConfiguration? oldProps,
}) {
  var attributes = <String, String?>{};

  if (null != props.src) {
    attributes[Attributes.src] = props.src;
  } else {
    if (null != oldProps?.src) {
      attributes[Attributes.src] = null;
    }
  }

  if (null != props.alt) {
    attributes[Attributes.alt] = props.alt;
  } else {
    if (null != oldProps?.alt) {
      attributes[Attributes.alt] = null;
    }
  }

  if (null != props.height) {
    attributes[Attributes.height] = props.height;
  } else {
    if (null != oldProps?.height) {
      attributes[Attributes.height] = null;
    }
  }

  if (null != props.width) {
    attributes[Attributes.width] = props.width;
  } else {
    if (null != oldProps?.width) {
      attributes[Attributes.width] = null;
    }
  }

  return attributes;
}