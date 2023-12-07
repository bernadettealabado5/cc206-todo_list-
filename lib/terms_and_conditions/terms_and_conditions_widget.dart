import '/flutter_com/flutter_com_icon_button.dart';
import '/flutter_com/flutter_com_theme.dart';
import '/flutter_com/flutter_com_util.dart';
import '/flutter_com/flutter_com_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsWidgetState createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '08u9eo64' /* Terms and Conditions */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '7egx1m66' /* Please read the following term... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: GradientText(
                      FFLocalizations.of(context).getText(
                        'jx8keqgd' /* 1. Acceptance of Terms */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qkuae9ar' /* By accessing or using our serv... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: GradientText(
                      FFLocalizations.of(context).getText(
                        'kw5kgnlz' /* 2. Intellectual Property */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'brmb0beo' /* All intellectual property righ... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: GradientText(
                      FFLocalizations.of(context).getText(
                        'ywasu191' /* 3. User Conduct */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'tc6zqnnz' /* You agree to use our services ... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: GradientText(
                      FFLocalizations.of(context).getText(
                        'okboopvx' /* 4. Limitation of Liability */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '51zatdxo' /* We are not liable for any dire... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: GradientText(
                      FFLocalizations.of(context).getText(
                        'cm13wl0g' /* 5. Governing Law */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'aolxn2ej' /* These terms and conditions sha... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
