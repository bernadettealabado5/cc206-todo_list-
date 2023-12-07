import '/auth/firebase_auth/auth_util.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
=======
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_util.dart';
>>>>>>> origin/login-Alabado-Carbonell
=======
import '../../flutter_com/flutter_com_theme.dart';
import '../../flutter_com/flutter_com_util.dart';
=======
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
>>>>>>> main
>>>>>>> main
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_message_model.dart';
export 'welcome_message_model.dart';

class WelcomeMessageWidget extends StatefulWidget {
  const WelcomeMessageWidget({Key? key}) : super(key: key);

  @override
  _WelcomeMessageWidgetState createState() => _WelcomeMessageWidgetState();
}

class _WelcomeMessageWidgetState extends State<WelcomeMessageWidget> {
  late WelcomeMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeMessageModel());

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

    return Align(
      alignment: AlignmentDirectional(-1.00, -1.00),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 90.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'w4b722kv' /* Hello,  */,
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            fontFamily: 'Urbanist',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/GSDLogoFinal.png',
                width: 28.0,
                height: 28.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
