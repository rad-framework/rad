import 'package:rad/src/core/enums.dart';
import 'package:rad/src/widgets/abstract/widget.dart';
import 'package:rad/src/widgets/abstract/markup_tag.dart';

class Span extends MarkUpTag {
  Span({
    String? key,
    String? title,
    String? classes,
    int? tabIndex,
    bool? draggable,
    bool? contenteditable,
    Map<String, String>? dataset,
    bool? hidden,
    List<Widget>? children,
  }) : super(
          key: key,
          title: title,
          classes: classes,
          tabIndex: tabIndex,
          draggable: draggable,
          contenteditable: contenteditable,
          dataset: dataset,
          hidden: hidden,
          children: children,
        );

  @override
  DomTag get tag => DomTag.span;

  @override
  String get type => "$Span";
}