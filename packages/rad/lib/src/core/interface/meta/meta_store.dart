// Copyright (c) 2022, Rad developers. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';

import 'package:meta/meta.dart';

import 'package:rad/src/core/common/constants.dart';
import 'package:rad/src/core/common/objects/meta_information.dart';

/// Meta information store.
///
@internal
class MetaStore {
  /// Inserted meta tags.
  ///
  final _metaDomNodes = <String, Element>{};

  /// Add meta information to document.
  ///
  /// If meta information is already present with same meta id, then it'll
  /// update the existing meta information tag.
  ///
  void setMetaInformation(MetaInformation information) {
    _applyInformation(
      domNode: _getMetaElement(information),
      information: information,
    );
  }

  /// Remove meta information from page.
  ///
  void unsetMetaInformation(String informationId) {
    var domNode = _metaDomNodes.remove(informationId);

    domNode?.remove();
  }

  /// Clear all information tags.
  ///
  void unsetAll() {
    for (final informationId in [..._metaDomNodes.keys]) {
      unsetMetaInformation(informationId);
    }
  }

  MetaElement _getMetaElement(MetaInformation information) {
    var domNode = _metaDomNodes[information.informationId];

    if (null == domNode) {
      domNode = document.createElement('meta');

      _metaDomNodes[information.informationId] = domNode;
    } else {
      // clean information from existing tag

      for (final attributeName in [...domNode.attributes.keys]) {
        domNode.removeAttribute(attributeName);
      }
    }

    return domNode as MetaElement;
  }

  void _applyInformation({
    required MetaElement domNode,
    required MetaInformation information,
  }) {
    information.additionalAttributes?.forEach((key, value) {
      domNode.setAttribute(key, value);
    });

    if (null != information.name) {
      domNode.setAttribute(Attributes.name, information.name!);
    }

    if (null != information.content) {
      domNode.setAttribute(Attributes.content, information.content!);
    }

    if (null != information.httpEquiv) {
      domNode.setAttribute(Attributes.httpEquiv, information.httpEquiv!);
    }

    if (null != information.charset) {
      domNode.setAttribute(Attributes.charset, information.charset!);
    }

    if (null != document.head) {
      document.head!.append(domNode);
    } else {
      document.body?.append(domNode);
    }
  }
}
