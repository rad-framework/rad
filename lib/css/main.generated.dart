// ignore_for_file: constant_identifier_names

// auto-generated. please don't edit this file

const GEN_STYLES_MAIN_CSS = ""
    " html, "
    " body { "
    "     width: 100%; "
    "     height: 100%; "
    "     white-space: nowrap; "
    " } "
    "  "
    "  "
    " /** "
    "    * default text style "
    "    */ "
    "  "
    " [data-wtype=\"Text\"] { "
    "     width: auto; "
    "     white-space: normal; "
    "     word-wrap: break-word; "
    " } "
    "  "
    "  "
    " /** "
    "    * widgets without scrolls "
    "    * i.e widget's inner content will not be scrollable "
    "    */ "
    "  "
    " [data-wtype=\"Container\"], "
    " [data-wtype=\"Stack\"], "
    " [data-wtype=\"Align\"], "
    " [data-wtype=\"Positioned\"] { "
    "     display: block; "
    "     overflow: hidden; "
    " } "
    "  "
    "  "
    " /** "
    "    * widgets that should take as much space as possible "
    "    */ "
    "  "
    " [data-wtype=\"Stack\"], "
    " [data-wtype=\"Container\"], "
    " [data-wtype=\"OverlayEntry\"], "
    "  "
    " /*  "
    "  below widgets are not stylable. only way to "
    "  limit their bounds is to wrap them in a stylable "
    "  widget such as container. "
    " */ "
    "  "
    " [data-wtype=\"StatefulWidget\"], "
    " [data-wtype=\"StatelessWidget\"], "
    " [data-wtype=\"GestureDetector\"], "
    "  "
    " /*  "
    "  target is not a widget it refers to the div where app is mounted "
    " */ "
    "  "
    " [data-wtype=\"Target\"] { "
    "     width: 100%; "
    "     height: 100%; "
    "     display: block; "
    " } "
    "  "
    "  "
    " /** "
    "    * widgets which that childs to overlay on each other "
    "    */ "
    "  "
    " [data-wtype=\"Stack\"] { "
    "     position: relative; "
    " } "
    "  "
    "  "
    " /** "
    "    * widgets with absolute position "
    "    */ "
    "  "
    " [data-wtype=\"Align\"], "
    " [data-wtype=\"OverlayEntry\"], "
    " [data-wtype=\"Stack\"]>div, "
    " [data-wtype=\"Stack\"]>span { "
    "     position: absolute; "
    " } "
    "  "
    "  "
    " /** "
    "    * Align "
    "    */ "
    "  "
    " .trad-align-top-right { "
    "     top: 0; "
    "     right: 0; "
    " } "
    "  "
    " .trad-align-top-left { "
    "     top: 0; "
    "     left: 0; "
    " } "
    "  "
    " .trad-align-bottom-right { "
    "     bottom: 0; "
    "     right: 0; "
    " } "
    "  "
    " .trad-align-bottom-left { "
    "     bottom: 0; "
    "     left: 0; "
    " } ";
