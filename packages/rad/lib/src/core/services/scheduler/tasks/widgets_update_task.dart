import 'package:rad/src/core/common/enums.dart';
import 'package:rad/src/core/common/objects/build_context.dart';
import 'package:rad/src/core/common/types.dart';
import 'package:rad/src/core/services/scheduler/abstract.dart';
import 'package:rad/src/widgets/abstract/widget.dart';

/// A task that updates task under given context.
///
class WidgetsUpdateTask extends SchedulerTask {
  /// Target context.
  ///
  final BuildContext parentContext;

  /// List of widgets to update.
  ///
  final List<Widget> widgets;

  /// Type of update.
  ///
  final UpdateType updateType;

  /// Whether to add child if missing.
  ///
  final bool flagAddIfNotFound;

  WidgetsUpdateTask({
    required this.widgets,
    required this.parentContext,
    required this.updateType,
    this.flagAddIfNotFound = true,
    Callback? afterTaskCallback,
    Callback? beforeTaskCallback,
  }) : super(
          afterTaskCallback: afterTaskCallback,
          beforeTaskCallback: beforeTaskCallback,
        );

  @override
  SchedulerTaskType get taskType => SchedulerTaskType.update;
}