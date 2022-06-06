import 'dart:html';

import 'package:meta/meta.dart';

import 'package:rad/src/core/common/constants.dart';
import 'package:rad/src/core/common/enums.dart';
import 'package:rad/src/core/common/functions.dart';
import 'package:rad/src/core/common/objects/build_context.dart';
import 'package:rad/src/core/common/objects/dom_node_description.dart';
import 'package:rad/src/core/common/objects/key.dart';
import 'package:rad/src/core/common/objects/render_object.dart';
import 'package:rad/src/core/common/types.dart';
import 'package:rad/src/core/services/scheduler/tasks/widgets_build_task.dart';
import 'package:rad/src/core/services/scheduler/tasks/widgets_update_task.dart';
import 'package:rad/src/core/services/services.dart';
import 'package:rad/src/core/services/services_registry.dart';
import 'package:rad/src/core/services/services_resolver.dart';
import 'package:rad/src/widgets/abstract/widget.dart';
import 'package:rad/src/widgets/html/division.dart';

/// Creates a scrollable, linear array of widgets from an explicit [List].
///
class ListView extends Widget {
  /// The style attribute for inline CSS.
  ///
  final String? style;

  /// The classes attribute specifies one or more class names for dom node.
  ///
  final String? classAttribute;

  /// Scroll direction of ListView.
  ///
  final Axis scrollDirection;

  /// Child widgets(will be built all at once).
  ///
  final List<Widget> children;

  /// Type of list view layout.
  ///
  final LayoutType layoutType;

  const ListView({
    Key? key,
    this.style,
    this.classAttribute,
    this.layoutType = LayoutType.contain,
    this.scrollDirection = Axis.vertical,
    required this.children,
  })  : isListViewBuilder = false,
        itemCount = null,
        itemBuilder = null,
        super(key: key);

  /// Whether list is a Lazy builder.
  ///
  final bool isListViewBuilder;

  final int? itemCount;

  final IndexedWidgetBuilder? itemBuilder;

  /// Creates a scrollable, linear array of widgets that are created on demand.
  ///
  /// This constructor is appropriate for list views with a large (or infinite)
  /// number of children.
  ///
  const ListView.builder({
    Key? key,
    this.style,
    this.classAttribute,
    this.layoutType = LayoutType.contain,
    this.scrollDirection = Axis.vertical,
    this.itemCount,
    required this.itemBuilder,
  })  : isListViewBuilder = true,
        children = const <Widget>[],
        super(key: key);

  @override
  List<Widget> get widgetChildren => children;

  @nonVirtual
  @override
  String get widgetType => 'ListView';

  @nonVirtual
  @override
  DomTagType get correspondingTag => DomTagType.division;

  @nonVirtual
  @override
  createConfiguration() {
    var configuration = _ListViewConfiguration(
      style: style,
      layoutType: layoutType,
      classAttribute: classAttribute,
      scrollDirection: scrollDirection,
    );

    if (isListViewBuilder) {
      return _ListViewBuilderConfiguration(
        itemCount: itemCount,
        itemBuilder: itemBuilder!,
        baseConfiguration: configuration,
      );
    }

    return configuration;
  }

  @nonVirtual
  @override
  isConfigurationChanged(oldConfiguration) {
    if (isListViewBuilder) {
      return true;
    }

    oldConfiguration as _ListViewConfiguration;

    return style != oldConfiguration.style ||
        layoutType != oldConfiguration.layoutType ||
        classAttribute != oldConfiguration.classAttribute ||
        scrollDirection != oldConfiguration.scrollDirection;
  }

  @nonVirtual
  @override
  createRenderObject(context) {
    if (isListViewBuilder) {
      return ListViewBuilderRenderObject(
        context: context,
        state: _ListViewBuilderState(context),
      );
    }

    return ListViewRenderObject(context);
  }
}

/*
|--------------------------------------------------------------------------
| configuration
|--------------------------------------------------------------------------
*/

class _ListViewConfiguration extends WidgetConfiguration {
  final String? style;
  final String? classAttribute;

  final LayoutType layoutType;
  final Axis scrollDirection;

  const _ListViewConfiguration({
    this.style,
    this.classAttribute,
    required this.layoutType,
    required this.scrollDirection,
  });
}

/*
|--------------------------------------------------------------------------
| configuration for builder version
|--------------------------------------------------------------------------
*/

class _ListViewBuilderConfiguration extends WidgetConfiguration {
  final _ListViewConfiguration baseConfiguration;

  final int? itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const _ListViewBuilderConfiguration({
    this.itemCount,
    required this.itemBuilder,
    required this.baseConfiguration,
  });
}

/*
|--------------------------------------------------------------------------
| render object
|--------------------------------------------------------------------------
*/

class ListViewRenderObject extends RenderObject {
  const ListViewRenderObject(BuildContext context) : super(context);

  @override
  render({
    required covariant _ListViewConfiguration configuration,
  }) {
    return DomNodeDescription(
      attributes: _prepareAttributes(
        props: configuration,
        oldProps: null,
      ),
    );
  }

  @override
  update({
    required updateType,
    required covariant _ListViewConfiguration oldConfiguration,
    required covariant _ListViewConfiguration newConfiguration,
  }) {
    return DomNodeDescription(
      attributes: _prepareAttributes(
        props: newConfiguration,
        oldProps: oldConfiguration,
      ),
    );
  }
}

/*
|--------------------------------------------------------------------------
| render object for builder version
|--------------------------------------------------------------------------
*/

class ListViewBuilderRenderObject extends RenderObject {
  final _ListViewBuilderState state;

  const ListViewBuilderRenderObject({
    required this.state,
    required BuildContext context,
  }) : super(context);

  @override
  render({
    required covariant _ListViewBuilderConfiguration configuration,
  }) {
    var baseConfiguration = configuration.baseConfiguration;
    var layoutType = baseConfiguration.layoutType;

    state
      ..frameworkBindLayoutType(layoutType)
      ..frameworkUpdateConfigurationBinding(configuration);

    return DomNodeDescription(
      attributes: _prepareAttributes(
        props: baseConfiguration,
        oldProps: null,
      ),
    );
  }

  @override
  afterMount() {
    var services = ServicesRegistry.instance.getServices(context);
    var domNode = services.walker.getWidgetObject(context)!.domNode;

    if (null == domNode) {
      services.debug.exception(Constants.coreError);
    } else {
      state
        ..frameworkUpdateDomNodeBinding(domNode)
        ..frameworkRender();
    }
  }

  @override
  update({
    required updateType,
    required covariant _ListViewBuilderConfiguration oldConfiguration,
    required covariant _ListViewBuilderConfiguration newConfiguration,
  }) {
    var newBaseConfig = newConfiguration.baseConfiguration;
    var oldBaseConfig = oldConfiguration.baseConfiguration;

    state
      ..frameworkUpdateConfigurationBinding(newConfiguration)
      ..frameworkUpdate(updateType);

    if (newBaseConfig.style != oldBaseConfig.style ||
        newBaseConfig.classAttribute != oldBaseConfig.classAttribute ||
        newBaseConfig.scrollDirection != oldBaseConfig.scrollDirection) {
      return DomNodeDescription(
        attributes: _prepareAttributes(
          props: newBaseConfig,
          oldProps: oldBaseConfig,
        ),
      );
    }

    return null;
  }

  @override
  beforeUnMount() => state.frameworkDispose();
}

/*
|--------------------------------------------------------------------------
| list view builder state
|--------------------------------------------------------------------------
*/

class _ListViewBuilderState with ServicesResolver {
  /*
  |--------------------------------------------------------------------------
  | internal state
  |--------------------------------------------------------------------------
  */

  final BuildContext context;

  int _renderableUptoIndex = 3;

  HtmlElement? _observerTarget;

  IntersectionObserver? _observer;

  /// Resolve services reference.
  ///
  Services get services => resolveServices(context);

  /*
  |--------------------------------------------------------------------------
  | constructor
  |--------------------------------------------------------------------------
  */

  _ListViewBuilderState(this.context);

  /*
  |--------------------------------------------------------------------------
  | getters
  |--------------------------------------------------------------------------
  */

  Element? _domNode;
  Element get domNode => _domNode!;

  LayoutType _layoutType = LayoutType.contain;

  _ListViewBuilderConfiguration? _configuration;
  _ListViewBuilderConfiguration get configuration => _configuration!;

  int get renderUptoIndex {
    var itemCount = configuration.itemCount;

    if (null != itemCount && _renderableUptoIndex > itemCount) {
      return itemCount;
    }

    return _renderableUptoIndex;
  }

  /*
  |--------------------------------------------------------------------------
  | intersection utils
  |--------------------------------------------------------------------------
  */

  void _initObserver() {
    var options = LayoutType.contain == _layoutType
        ? {
            'root': domNode,
          }
        : <dynamic, dynamic>{};

    _observer = IntersectionObserver(_intersectionHandler, options);
  }

  void _intersectionHandler(
    List<dynamic> entries,
    IntersectionObserver observer,
  ) {
    for (final entry in entries) {
      entry as IntersectionObserverEntry;

      if (entry.isIntersecting ?? false) {
        var currentIndex = _renderableUptoIndex;

        _renderableUptoIndex += 3;

        var itemsToGenerate = renderUptoIndex - currentIndex;

        if (itemsToGenerate > 0) {
          services.scheduler.addTask(
            WidgetsBuildTask(
              parentContext: context,
              mountAtIndex: null,
              flagCleanParentContents: false,
              widgets: List.generate(
                itemsToGenerate,
                (i) => Division(
                  key: Key('lv_item_${i + currentIndex}_${context.key.value}'),
                  classAttribute: Constants.classListViewItemContainer,
                  child: configuration.itemBuilder(context, i + currentIndex),
                ),
              ),
              afterTaskCallback: _updateObserverTarget,
            ),
          );
        }
      }
    }
  }

  void _updateObserverTarget() {
    // remove previous

    if (null != _observerTarget) {
      _observer?.unobserve(_observerTarget!);

      _observerTarget = null;
    }

    Element? lastItemContainer;

    var childLength = domNode.children.length;

    if (childLength > 3) {
      lastItemContainer = domNode.children[childLength - 3];
    } else {
      lastItemContainer = childLength > 0 ? domNode.children.last : null;
    }

    if (null != lastItemContainer) {
      Element? child;

      if (lastItemContainer.children.isNotEmpty) {
        child = lastItemContainer.children.first;

        _observer?.observe(child);

        _observerTarget = child as HtmlElement;
      }
    }
  }

  /*
  |--------------------------------------------------------------------------
  | internals
  |--------------------------------------------------------------------------
  */

  void frameworkBindLayoutType(LayoutType layoutType) {
    _layoutType = layoutType;
  }

  void frameworkRender() {
    _initObserver();

    services.scheduler.addTask(
      WidgetsBuildTask(
        parentContext: context,
        widgets: List.generate(
          renderUptoIndex,
          (i) => Division(
            key: Key('lv_item_${i}_${context.key.value}'),
            classAttribute: Constants.classListViewItemContainer,
            child: configuration.itemBuilder(context, i),
          ),
        ),
        afterTaskCallback: _updateObserverTarget,
      ),
    );
  }

  void frameworkUpdate(UpdateType updateType) {
    services.scheduler.addTask(
      WidgetsUpdateTask(
        parentContext: context,
        updateType: updateType,
        widgets: List.generate(
          renderUptoIndex,
          (i) => Division(
            key: Key('lv_item_${i}_${context.key.value}'),
            classAttribute: Constants.classListViewItemContainer,
            child: configuration.itemBuilder(context, i),
          ),
        ),
        afterTaskCallback: _updateObserverTarget,
      ),
    );
  }

  void frameworkUpdateConfigurationBinding(
    _ListViewBuilderConfiguration configuration,
  ) {
    _configuration = configuration;
  }

  void frameworkUpdateDomNodeBinding(Element domNode) {
    _domNode = domNode;
  }

  void frameworkDispose() {
    if (null != _observerTarget) {
      _observer?.unobserve(_observerTarget!);
    }

    _observer?.disconnect();
  }
}

/*
|--------------------------------------------------------------------------
| props
|--------------------------------------------------------------------------
*/

Map<String, String?> _prepareAttributes({
  required _ListViewConfiguration props,
  required _ListViewConfiguration? oldProps,
}) {
  var attributes = <String, String?>{};

  var classAttribute = fnCommonPrepareClassAttribute(
        classAttribute: '${props.classAttribute}',
        oldClassAttribute: null, // not required, new attribute is always set
      ) ??
      '';

  classAttribute += ' ${Constants.classListView}';

  if (LayoutType.contain == props.layoutType) {
    classAttribute += ' ${Constants.classListViewContained}';
  }

  if (LayoutType.expand == props.layoutType) {
    classAttribute += ' ${Constants.classListViewExpanded}';
  }

  if (Axis.horizontal == props.scrollDirection) {
    classAttribute += ' ${Constants.classListViewHorizontal}';
  }

  if (Axis.vertical == props.scrollDirection) {
    classAttribute += ' ${Constants.classListViewVeritcal}';
  }

  attributes[Attributes.classAttribute] = classAttribute;

  return attributes;
}
