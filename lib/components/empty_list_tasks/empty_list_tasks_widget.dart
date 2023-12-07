import '/components/create_task_new/create_task_new_widget.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
import '/flutter_com/flutter_com_widgets.dart';
=======
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_util.dart';
import '../../flutter_com/flutter_com_widgets.dart';
>>>>>>> origin/login-Alabado-Carbonell
=======
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_util.dart';
import '../../flutter_com/flutter_com_widgets.dart';
=======
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
import '/flutter_com/flutter_com_widgets.dart';
>>>>>>> main
>>>>>>> main
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_tasks_model.dart';
export 'empty_list_tasks_model.dart';

class EmptyListTasksWidget extends StatefulWidget {
  const EmptyListTasksWidget({Key? key}) : super(key: key);

  @override
  _EmptyListTasksWidgetState createState() => _EmptyListTasksWidgetState();
}

class _EmptyListTasksWidgetState extends State<EmptyListTasksWidget> {
  late EmptyListTasksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListTasksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Image.asset(
                'assets/images/uiList_Empty@3x.png',
                width: 230.0,
                height: 150.0,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'c1jwirb4' /* You don't have any tasks */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'hyev6h6g' /* Create tasks by tapping the bu... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Color(0x230E151B),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: Container(
                        height: double.infinity,
                        child: CreateTaskNewWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              text: FFLocalizations.of(context).getText(
                'ljvtfzwa' /* Create Task */,
              ),
              options: FFButtonOptions(
                width: 121.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
