import '/src/core/classes/framework.dart';
import '/src/core/enums.dart';
import '/src/core/structures/build_context.dart';
import '/src/core/structures/widget_object.dart';

abstract class RenderObject<T> {
  late final BuildContext context;
  final BuildableContext buildableContext;
  final DomTag domTag;

  RenderObject({
    required this.buildableContext,
    required this.domTag,
  }) {
    context = BuildContext(
      id: buildableContext.id ?? Framework.generateId(),
      parentId: buildableContext.parentId,
      widgetType: T.toString(),
      widgetDomTag: domTag,
    );
  }

  render(WidgetObject widgetObject);

  void beforeMount() {}

  void afterMount() {}

  void beforeUnMount() {}

  rebuild() {
    // Framework.build(this);
  }
}
