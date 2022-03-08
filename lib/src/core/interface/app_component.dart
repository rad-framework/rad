import 'package:rad/rad.dart';
import 'package:rad/src/core/classes/framework.dart';

/// Interface for external components.
///
abstract class AppComponent {
  /// Name of the component.
  ///
  String get name;

  /// Auther name.
  ///
  String get author;

  /// Component version.
  ///
  String get version;
}

/// App components.
///
class AppComponents {
  final List<StyleComponent>? styleComponents;

  AppComponents({this.styleComponents});

  load() {
    var styleComponents = this.styleComponents;

    if (null != styleComponents && styleComponents.isNotEmpty) {
      for (var styleComponent in styleComponents) {
        Framework.addGlobalStyles(
          styleComponent.styleSheetContents,
          "From ${styleComponent.name} (v ${styleComponent.version}). Author: ${styleComponent.author}",
        );
      }
    }
  }
}