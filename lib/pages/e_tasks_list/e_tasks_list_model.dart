import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_task_new/create_task_new_widget.dart';
import '/components/empty_list_tasks/empty_list_tasks_widget.dart';
import '/components/welcome_message/welcome_message_widget.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import '../../flutter_com/flutter_com_animations.dart';
import '../../flutter_com/flutter_com_icon_button.dart';
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_toggle_icon.dart';
import '../../flutter_com/flutter_com_util.dart';
import '../../flutter_com/flutter_com_widgets.dart';
=======
>>>>>>> main
import '/flutter_com/flutter_com_animations.dart';
import '/flutter_com/flutter_com_icon_button.dart';
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_toggle_icon.dart';
import '/flutter_com/flutter_com_util.dart';
import '/flutter_com/flutter_com_widgets.dart';
<<<<<<< HEAD
=======
import '../../flutter_com/flutter_com_animations.dart';
import '../../flutter_com/flutter_com_icon_button.dart';
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_toggle_icon.dart';
import '../../flutter_com/flutter_com_util.dart';
import '../../flutter_com/flutter_com_widgets.dart';
>>>>>>> origin/login-Alabado-Carbonell
=======
>>>>>>> main
>>>>>>> main
import 'e_tasks_list_widget.dart' show ETasksListWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ETasksListModel extends FlutterFlowModel<ETasksListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for welcomeMessage component.
  late WelcomeMessageModel welcomeMessageModel;
  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    welcomeMessageModel = createModel(context, () => WelcomeMessageModel());
  }

  void dispose() {
    welcomeMessageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
