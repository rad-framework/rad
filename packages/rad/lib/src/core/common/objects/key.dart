// Copyright (c) 2022, the Rad developers. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';

import 'package:rad/src/core/common/abstract/render_element.dart';
import 'package:rad/src/core/services/walker/walker_service.dart';
import 'package:rad/src/widgets/abstract/widget.dart';

/// A [Key] is an identifier for [Widget]s.
///
/// Keys must be unique amongst the [Widget]s with the same parent. In contrast,
/// [GlobalKey] must be unique within a single app instance.
///
@immutable
class Key {
  /// Value that was used while creating the key.
  ///
  /// @nodoc
  @internal
  String get frameworkValue => _value;
  final String _value;

  /// Create key.
  ///
  const Key(this._value);

  @override
  operator ==(Object other) {
    return other is Key && other._value == _value;
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => 'key($_value)';
}

/// A key that is unique within a single app instance.
///
/// Widgets with global keys are registered in walker service and global key
/// can be used to find [RenderElement] associated with widget using
/// [WalkerService.getRenderElementAssociatedWithGlobalKey].
///
///
/// Note that this is the only difference between a normal Key and a GlobalKey.
/// For exampple, A widget with key equals to `Key('s')` will match with a
/// widget that has key equals to `GlobalKey('s')` and can be used to update
/// the other widget.
///
class GlobalKey extends Key {
  /// Creates a global key.
  ///
  const GlobalKey(super.value);
}
