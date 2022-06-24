import 'package:meta/meta.dart';

import 'package:rad/src/core/common/abstract/render_element.dart';

/// Base class for render elements that are watching their position in the tree.
///
/// Watchful elements differs from other render elements in that framework
/// consider them alive in tree and framework will let them know when it
/// mounts or un-mounts them from tree so that these elements can take
/// appropriate actions.
///
abstract class WatchfulRenderElement extends RenderElement {
  WatchfulRenderElement(super.widget, super.parent);

  /*
  |--------------------------------------------------------------------------
  | mount status of current element
  |--------------------------------------------------------------------------
  */

  @nonVirtual
  bool get isMounted => _isMounted;
  bool _isMounted = false;

  /*
  |--------------------------------------------------------------------------
  | lifecycle hooks
  |--------------------------------------------------------------------------
  */

  /// Init hook.
  ///
  /// This hook gets before rendring widget on the screen, happens exactly one
  /// time during lifetime of an element.
  ///
  void init() {}

  /// After mount hook.
  ///
  /// This hook gets called after widget is mounted on the screen, happens
  /// exactly one time during lifetime of an element.
  ///
  void afterMount() {}

  /// After unMount hook.
  ///
  /// This hook gets called after widget has been removed from the screen,
  /// happens exactly one time during lifetime of an element.
  ///
  void afterUnMount() {}

  /*
  |--------------------------------------------------------------------------
  | framework reserved | lifecycle api
  |--------------------------------------------------------------------------
  */

  @nonVirtual
  void frameworkInit() {
    init();
  }

  @nonVirtual
  void frameworkAfterMount() {
    _isMounted = true;

    afterMount();
  }

  @nonVirtual
  void frameworkAfterUnMount() {
    _isMounted = false;

    afterUnMount();
  }
}