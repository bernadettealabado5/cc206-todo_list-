<<<<<<< HEAD
import '/flutter_com/flutter_com_icon_button.dart';
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
import '/flutter_com/flutter_com_widgets.dart';
=======
import '../flutter_com/flutter_com_icon_button.dart';
import '../flutter_com/flutter_com_theme.dart';
import '../flutter_com/flutter_com_util.dart';
import '../flutter_com/flutter_com_widgets.dart';
>>>>>>> origin/login-Alabado-Carbonell
import 'about_us_widget.dart' show AboutUsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutUsModel extends FlutterFlowModel<AboutUsWidget> {
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
