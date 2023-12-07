import '../flutter_com/flutter_com_icon_button.dart';
import '../flutter_com/flutter_com_theme.dart';
import '../flutter_com/flutter_com_util.dart';
import '../flutter_com/flutter_com_widgets.dart';
import 'our_values_widget.dart' show OurValuesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OurValuesModel extends FlutterFlowModel<OurValuesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
