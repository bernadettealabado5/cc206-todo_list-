import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
<<<<<<< HEAD
import '/flutter_com/flutter_com_icon_button.dart';
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
import '/flutter_com/flutter_com_widgets.dart';
=======
import '../../flutter_com/flutter_com_icon_button.dart';
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_util.dart';
import '../../flutter_com/flutter_com_widgets.dart';
>>>>>>> origin/login-Alabado-Carbonell
import 'h_change_password_widget.dart' show HChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HChangePasswordModel extends FlutterFlowModel<HChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1v3141eb' /* Please fill in a new password.... */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
