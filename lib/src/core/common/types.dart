import 'dart:html';

import 'package:rad/src/core/common/enums.dart';
import 'package:rad/src/core/services/scheduler/abstract.dart';
import 'package:rad/src/core/common/objects/build_context.dart';
import 'package:rad/src/core/common/objects/render_object.dart';
import 'package:rad/src/core/common/objects/widget_object.dart';
import 'package:rad/src/widgets/abstract/widget.dart';
import 'package:rad/src/widgets/list_view.dart';
import 'package:rad/src/widgets/navigator.dart';

typedef SchedulerTaskCallback = void Function(SchedulerTask task);

typedef UpdateTypeCallback = bool Function(UpdateType updateType);

typedef OnTapEventCallback = void Function(Event event);

typedef NavigatorRouteChangeCallback = void Function(String name);

typedef NavigatorStateCallback = void Function(NavigatorState state);

typedef WidgetBuilderCallback = Widget Function(BuildContext context);

/// Signature for a function that creates a widget for a given index, e.g., in a
/// list.
///
/// Used by [ListView.builder].
///
typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

typedef WidgetActionCallback = List<WidgetAction> Function(
  WidgetObject widgetObject,
);

typedef RenderElementCallback = void Function(
  RenderObject renderObject,
  HtmlElement element,
);

typedef EventCallback = void Function(Event event);
typedef ExceptionCallback = void Function(Exception event);