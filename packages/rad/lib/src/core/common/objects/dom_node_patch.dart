import 'package:meta/meta.dart';

/// Description patch for a dom node in DOM.
///
@immutable
class DomNodePatch {
  /// Dataset patch.
  ///
  /// {data key: null/non-null value}
  ///
  /// If value for an data entry is null, framework will remove that data entry
  /// from dom else it'll add/update it.
  ///
  final Map<String, String?>? dataset;

  /// {attribute name: null/non-null value}
  ///
  /// If value for an attribute is null, framework will remove that attribute
  /// from dom else it'll add/update it.
  ///
  final Map<String, String?>? attributes;

  /// Text contents to apply on DOM node.
  ///
  final String? textContents;

  /// Raw HTML contents(unsafe) to apply on DOM node.
  ///
  final String? rawContents;

  const DomNodePatch({
    this.dataset,
    this.attributes,
    this.textContents,
    this.rawContents,
  });
}