// ignore_for_file: directives_ordering

/*
|--------------------------------------------------------------------------
| main
|--------------------------------------------------------------------------
*/

/// Rad's Main library.
///
/// This library contain general widgets and functions.
///
library rad;

export 'src/core/common/types.dart';
export 'src/core/common/enums.dart';
export 'src/core/run_app.dart' show runApp, AppRunner;
export 'src/widgets/abstract/widget.dart' show Widget;
export 'src/core/common/objects/key.dart' show Key, LocalKey, GlobalKey;
export 'src/core/services/events/emitted_event.dart' show EmittedEvent;
export 'src/core/common/objects/build_context.dart' show BuildContext;
export 'src/core/common/objects/options/debug_options.dart' show DebugOptions;
export 'src/core/common/objects/options/router_options.dart' show RouterOptions;

/*
|--------------------------------------------------------------------------
| widgets
|--------------------------------------------------------------------------
*/

// main

export 'src/widgets/rad_app.dart' show RadApp;
export 'src/widgets/inherited_widget.dart' show InheritedWidget;
export 'src/widgets/stateful_widget.dart' show StatefulWidget, State;
export 'src/widgets/stateless_widget.dart' show StatelessWidget;

export 'src/widgets/list_view.dart' show ListView;
export 'src/widgets/raw_markup.dart' show RawMarkUp;
export 'src/widgets/event_detector.dart' show EventDetector;
export 'src/widgets/gesture_detector.dart' show GestureDetector;

// navigator

export 'src/widgets/route.dart' show Route;
export 'src/widgets/async_route.dart' show AsyncRoute; // mb, move to wi*_async
export 'src/widgets/navigator.dart' show Navigator, NavigatorState;

// Additional widgets.

export 'src/widgets/additional/text.dart' show Text;