import 'package:rad/src/core/enums.dart';
import 'package:rad/src/core/scheduler/abstract.dart';

/// A task that tells listener that scheduler state has changed.
/// For example, probably new tasks are added to queue and if listner
/// wants to restart processing tasks then it can.
///
class StimulateListenerTask extends SchedulerTask {
  @override
  get taskType => SchedulerTaskType.stimulateListener;
}