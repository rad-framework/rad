// ignore_for_file: directives_ordering
// ignore_for_file: camel_case_types

/// HTML widgets with short aliases.
///
library widgets_short_tags;

import 'package:rad/src/widgets/html/abbreviation.dart';
import 'package:rad/src/widgets/html/address.dart';
import 'package:rad/src/widgets/html/anchor.dart';
import 'package:rad/src/widgets/html/article.dart';
import 'package:rad/src/widgets/html/aside.dart';
import 'package:rad/src/widgets/html/audio.dart';
import 'package:rad/src/widgets/html/bidirectional_isolate.dart';
import 'package:rad/src/widgets/html/bidirectional_text_override.dart';
import 'package:rad/src/widgets/html/block_quote.dart';
import 'package:rad/src/widgets/html/button.dart';
import 'package:rad/src/widgets/html/canvas.dart';
import 'package:rad/src/widgets/html/citation.dart';
import 'package:rad/src/widgets/html/data.dart';
import 'package:rad/src/widgets/html/data_list.dart';
import 'package:rad/src/widgets/html/definition.dart';
import 'package:rad/src/widgets/html/deleted_text.dart';
import 'package:rad/src/widgets/html/description_details.dart';
import 'package:rad/src/widgets/html/description_list.dart';
import 'package:rad/src/widgets/html/description_term.dart';
import 'package:rad/src/widgets/html/details.dart';
import 'package:rad/src/widgets/html/dialog.dart';
import 'package:rad/src/widgets/html/division.dart';
import 'package:rad/src/widgets/html/embed_external.dart';
import 'package:rad/src/widgets/html/embed_text_track.dart';
import 'package:rad/src/widgets/html/emphasis.dart';
import 'package:rad/src/widgets/html/field_set.dart';
import 'package:rad/src/widgets/html/figure.dart';
import 'package:rad/src/widgets/html/figure_caption.dart';
import 'package:rad/src/widgets/html/footer.dart';
import 'package:rad/src/widgets/html/form.dart';
import 'package:rad/src/widgets/html/header.dart';
import 'package:rad/src/widgets/html/heading_1.dart';
import 'package:rad/src/widgets/html/heading_2.dart';
import 'package:rad/src/widgets/html/heading_3.dart';
import 'package:rad/src/widgets/html/heading_4.dart';
import 'package:rad/src/widgets/html/heading_5.dart';
import 'package:rad/src/widgets/html/heading_6.dart';
import 'package:rad/src/widgets/html/horizontal_rule.dart';
import 'package:rad/src/widgets/html/i_frame.dart';
import 'package:rad/src/widgets/html/idiomatic.dart';
import 'package:rad/src/widgets/html/image.dart';
import 'package:rad/src/widgets/html/image_map.dart';
import 'package:rad/src/widgets/html/image_map_area.dart';
import 'package:rad/src/widgets/html/inline_code.dart';
import 'package:rad/src/widgets/html/inline_quotation.dart';
import 'package:rad/src/widgets/html/input.dart';
import 'package:rad/src/widgets/html/inserted_text.dart';
import 'package:rad/src/widgets/html/keyboard_input.dart';
import 'package:rad/src/widgets/html/label.dart';
import 'package:rad/src/widgets/html/legend.dart';
import 'package:rad/src/widgets/html/line_break.dart';
import 'package:rad/src/widgets/html/line_break_opportunity.dart';
import 'package:rad/src/widgets/html/list_item.dart';
import 'package:rad/src/widgets/html/mark_text.dart';
import 'package:rad/src/widgets/html/media_source.dart';
import 'package:rad/src/widgets/html/menu.dart';
import 'package:rad/src/widgets/html/meter.dart';
import 'package:rad/src/widgets/html/navigation.dart';
import 'package:rad/src/widgets/html/option.dart';
import 'package:rad/src/widgets/html/option_group.dart';
import 'package:rad/src/widgets/html/ordered_list.dart';
import 'package:rad/src/widgets/html/output.dart';
import 'package:rad/src/widgets/html/paragraph.dart';
import 'package:rad/src/widgets/html/picture.dart';
import 'package:rad/src/widgets/html/portal.dart';
import 'package:rad/src/widgets/html/preformatted_text.dart';
import 'package:rad/src/widgets/html/progress.dart';
import 'package:rad/src/widgets/html/ruby_annotation.dart';
import 'package:rad/src/widgets/html/ruby_fallback_parenthesis.dart';
import 'package:rad/src/widgets/html/ruby_text.dart';
import 'package:rad/src/widgets/html/sample_output.dart';
import 'package:rad/src/widgets/html/select.dart';
import 'package:rad/src/widgets/html/small.dart';
import 'package:rad/src/widgets/html/span.dart';
import 'package:rad/src/widgets/html/strike_through.dart';
import 'package:rad/src/widgets/html/strong.dart';
import 'package:rad/src/widgets/html/sub_script.dart';
import 'package:rad/src/widgets/html/summary.dart';
import 'package:rad/src/widgets/html/super_script.dart';
import 'package:rad/src/widgets/html/table.dart';
import 'package:rad/src/widgets/html/table_body.dart';
import 'package:rad/src/widgets/html/table_caption.dart';
import 'package:rad/src/widgets/html/table_column.dart';
import 'package:rad/src/widgets/html/table_column_group.dart';
import 'package:rad/src/widgets/html/table_data_cell.dart';
import 'package:rad/src/widgets/html/table_foot.dart';
import 'package:rad/src/widgets/html/table_head.dart';
import 'package:rad/src/widgets/html/table_header_cell.dart';
import 'package:rad/src/widgets/html/table_row.dart';
import 'package:rad/src/widgets/html/text_area.dart';
import 'package:rad/src/widgets/html/time.dart';
import 'package:rad/src/widgets/html/un_ordered_list.dart';
import 'package:rad/src/widgets/html/variable.dart';
import 'package:rad/src/widgets/html/video.dart';

typedef a = Anchor;
typedef abbr = Abbreviation;
typedef address = Address;
typedef area = ImageMapArea;
typedef article = Article;
typedef aside = Aside;
typedef audio = Audio;
typedef bdi = BidirectionalIsolate;
typedef bdo = BidirectionalTextOverride;
typedef blockquote = BlockQuote;
typedef br = LineBreak;
typedef button = Button;
typedef canvas = Canvas;
typedef caption = TableCaption;
typedef cite = Citation;
typedef code = InlineCode;
typedef col = TableColumn;
typedef colgroup = TableColumnGroup;
typedef data = Data;
typedef datalist = DataList;
typedef dd = DescriptionDetails;
typedef del = DeletedText;
typedef details = Details;
typedef dfn = Definition;
typedef dialog = Dialog;
typedef div = Division;
typedef dl = DescriptionList;
typedef dt = DescriptionTerm;
typedef em = Emphasis;
typedef embed = EmbedExternal;
typedef fieldset = FieldSet;
typedef figcaption = FigureCaption;
typedef figure = Figure;
typedef footer = Footer;
typedef form = Form;
typedef h1 = Heading1;
typedef h2 = Heading2;
typedef h3 = Heading3;
typedef h4 = Heading4;
typedef h5 = Heading5;
typedef h6 = Heading6;
typedef header = Header;
typedef hr = HorizontalRule;
typedef i = Idiomatic;
typedef iframe = IFrame;
typedef img = Image;
typedef input = Input;
typedef ins = InsertedText;
typedef kbd = KeyboardInput;
typedef label = Label;
typedef legend = Legend;
typedef li = ListItem;
typedef map = ImageMap;
typedef mark = MarkText;
typedef menu = Menu;
typedef meter = Meter;
typedef nav = Navigation;
typedef ol = OrderedList;
typedef optgroup = OptionGroup;
typedef option = Option;
typedef output = Output;
typedef p = Paragraph;
typedef picture = Picture;
typedef portal = Portal;
typedef pre = PreformattedText;
typedef progress = Progress;
typedef q = InlineQuotation;
typedef rp = RubyFallbackParenthesis;
typedef rt = RubyText;
typedef ruby = RubyAnnotation;
typedef s = StrikeThrough;
typedef samp = SampleOutput;
typedef select = Select;
typedef small = Small;
typedef source = MediaSource;
typedef span = Span;
typedef strong = Strong;
typedef sub = SubScript;
typedef summary = Summary;
typedef sup = SuperScript;
typedef table = Table;
typedef tbody = TableBody;
typedef td = TableDataCell;
typedef textarea = TextArea;
typedef tfoot = TableFoot;
typedef th = TableHeaderCell;
typedef thead = TableHead;
typedef time = Time;
typedef tr = TableRow;
typedef track = EmbedTextTrack;
typedef ul = UnOrderedList;
typedef vartag = Variable;
typedef video = Video;
typedef wbr = LineBreakOpportunity;
