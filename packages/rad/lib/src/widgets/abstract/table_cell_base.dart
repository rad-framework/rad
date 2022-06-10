import 'package:rad/src/core/common/constants.dart';
import 'package:rad/src/core/common/objects/build_context.dart';
import 'package:rad/src/core/common/objects/key.dart';
import 'package:rad/src/core/common/types.dart';
import 'package:rad/src/widgets/abstract/html_widget_base.dart';
import 'package:rad/src/widgets/abstract/widget.dart';
import 'package:rad/src/widgets/html/table_body.dart';
import 'package:rad/src/widgets/html/table_foot.dart';
import 'package:rad/src/widgets/html/table_head.dart';

/// Abstract class for TableCell and TableHeaderCell.
///
abstract class TableCellBase extends HTMLWidgetBase {
  /// This attribute contains a non-negative integer value that indicates for
  /// how many rows the cell extends. Its default value is 1; if its value is
  /// set to 0, it extends until the end of the table section ([TableHead],
  /// [TableBody], [TableFoot], even if implicitly defined), that the cell
  /// belongs to. Values higher than 65534 are clipped down to 65534..
  ///
  final int? rowSpan;

  /// This attribute contains a non-negative integer value that indicates for
  /// how many columns the cell extends. Its default value is 1. Values higher
  /// than 1000 will be considered as incorrect and will be set to the default
  /// value (1).
  ///
  final int? colSpan;

  /// This attribute contains a list of space-separated strings, each
  /// corresponding to the id attribute of the <th> dom nodes that apply to this
  /// dom node.
  ///
  final String? headers;

  const TableCellBase({
    this.rowSpan,
    this.colSpan,
    this.headers,
    Key? key,
    String? id,
    bool? hidden,
    bool? draggable,
    bool? contenteditable,
    int? tabIndex,
    String? title,
    String? style,
    String? classAttribute,
    Map<String, String>? dataAttributes,
    String? onClickAttribute,
    String? innerText,
    Widget? child,
    List<Widget>? children,
    EventCallback? onClick,
  }) : super(
          key: key,
          id: id,
          title: title,
          tabIndex: tabIndex,
          draggable: draggable,
          contenteditable: contenteditable,
          hidden: hidden,
          style: style,
          classAttribute: classAttribute,
          dataAttributes: dataAttributes,
          onClickAttribute: onClickAttribute,
          innerText: innerText,
          child: child,
          children: children,
          onClick: onClick,
        );

  @override
  bool shouldWidgetUpdate(
    covariant oldWidget,
  ) {
    oldWidget as TableCellBase;

    return rowSpan != oldWidget.colSpan ||
        colSpan != oldWidget.rowSpan ||
        headers != oldWidget.headers ||
        super.shouldWidgetUpdate(oldWidget);
  }

  @override
  createRenderObject(context) => _TableCellBaseRenderObject(context);
}

/*
|--------------------------------------------------------------------------
| render object
|--------------------------------------------------------------------------
*/

class _TableCellBaseRenderObject extends MarkUpGlobalRenderObject {
  const _TableCellBaseRenderObject(BuildContext context) : super(context);

  @override
  render({
    required covariant TableCellBase widget,
  }) {
    var domNodeDescription = super.render(
      widget: widget,
    );

    domNodeDescription?.attributes?.addAll(
      _prepareAttributes(
        widget: widget,
        oldWidget: null,
      ),
    );

    return domNodeDescription;
  }

  @override
  update({
    required updateType,
    required covariant TableCellBase oldWidget,
    required covariant TableCellBase newWidget,
  }) {
    var domNodeDescription = super.update(
      updateType: updateType,
      oldWidget: oldWidget,
      newWidget: newWidget,
    );

    domNodeDescription?.attributes?.addAll(
      _prepareAttributes(
        widget: newWidget,
        oldWidget: oldWidget,
      ),
    );

    return domNodeDescription;
  }
}

/*
|--------------------------------------------------------------------------
| props
|--------------------------------------------------------------------------
*/

Map<String, String?> _prepareAttributes({
  required TableCellBase widget,
  required TableCellBase? oldWidget,
}) {
  var attributes = <String, String?>{};

  if (null != widget.headers) {
    attributes[Attributes.headers] = widget.headers;
  } else {
    if (null != oldWidget?.headers) {
      attributes[Attributes.headers] = null;
    }
  }

  if (null != widget.rowSpan) {
    attributes[Attributes.rowSpan] = '${widget.rowSpan}';
  } else {
    if (null != oldWidget?.rowSpan) {
      attributes[Attributes.rowSpan] = null;
    }
  }

  if (null != widget.colSpan) {
    attributes[Attributes.colSpan] = '${widget.colSpan}';
  } else {
    if (null != oldWidget?.colSpan) {
      attributes[Attributes.colSpan] = null;
    }
  }

  return attributes;
}
