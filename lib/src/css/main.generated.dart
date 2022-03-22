// ignore_for_file: non_constant_identifier_names

// auto-generated. please don't edit this file

import 'package:rad/src/widgets/route.dart';
import 'package:rad/src/widgets/navigator.dart';
import 'package:rad/src/widgets/inherited_widget.dart';
import 'package:rad/src/widgets/stateful_widget.dart';
import 'package:rad/src/widgets/stateless_widget.dart';
import 'package:rad/src/widgets/list_view.dart';

final GEN_STYLES_MAIN_CSS = ""
    " /** "
    "    * widgets without styles "
    "    */ "
    "  "
    " [data-wcontype=\"$Route\"], "
    " [data-wcontype=\"$Navigator\"], "
    " [data-wcontype=\"$InheritedWidget\"], "
    " [data-wcontype=\"$StatefulWidget\"], "
    " [data-wcontype=\"$StatelessWidget\"], "
    " .rad-list-view-item-container { "
    "     /*  "
    "      "
    "     It's important to have each element present inside DOM because "
    "     Rad uses DOM as Element tree. Since these widgets shouldn't have "
    "     any impact on styles, we are using display: contents here. "
    "  "
    "     Note: contents is not widely supported by the browsers. If Browser  "
    "     support ever becomes a problem, we can introduce a Element tree to  "
    "     fix this problem.  "
    "     */ "
    "     display: contents; "
    " } "
    "  "
    "  "
    " /** "
    "    * ListView occupies available space. "
    "    */ "
    "  "
    " [data-wcontype=\"$ListView\"] { "
    "     width: 100%; "
    "     height: 100%; "
    "     display: flex; "
    " } "
    "  "
    " [data-wcontype=\"$ListView\"]>*, "
    " .rad-list-view-item-container>* { "
    "     flex-grow: 0; "
    "     flex-shrink: 0; "
    " } "
    "  "
    "  "
    " /** "
    "    * system "
    "    */ "
    "  "
    " .rad-hidden { "
    "     display: none!important; "
    "     visibility: hidden!important; "
    " } ";
