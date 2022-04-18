/*
|--------------------------------------------------------------------------
| core (low-level exports)
|
| To allow external components and widget implementations
|--------------------------------------------------------------------------
*/

export 'src/core/common/enums.dart' show DomTag;

export 'src/core/common/enums.dart' show UpdateType;

export 'src/core/common/constants.dart' show System;

export 'src/widgets/abstract/widget.dart' show WidgetConfiguration;

export 'src/core/common/objects/render_object.dart' show RenderObject;

// services

export 'src/core/services/debug/debug.dart' show Debug;
export 'src/core/services/router/router.dart' show Router;
export 'src/core/services/router/router.dart' show Router;
export 'src/core/services/keygen/keygen.dart' show KeyGen;
export 'src/core/services/scheduler/scheduler.dart' show Scheduler;
export 'src/core/services/services_registry.dart' show ServicesRegistry;