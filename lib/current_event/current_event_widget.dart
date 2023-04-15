import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'current_event_model.dart';
export 'current_event_model.dart';

class CurrentEventWidget extends StatefulWidget {
  const CurrentEventWidget({
    Key? key,
    this.title,
    this.people,
    this.status,
    this.scores,
    this.eventReference,
    this.finish,
    this.noPeople,
  }) : super(key: key);

  final String? title;
  final List<String>? people;
  final String? status;
  final dynamic scores;
  final DocumentReference? eventReference;
  final dynamic finish;
  final bool? noPeople;

  @override
  _CurrentEventWidgetState createState() => _CurrentEventWidgetState();
}

class _CurrentEventWidgetState extends State<CurrentEventWidget> {
  late CurrentEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentEventModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'People',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    if (widget.status != 'Done')
                      Builder(
                        builder: (context) {
                          final peopleList = widget.people?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: peopleList.length,
                            itemBuilder: (context, peopleListIndex) {
                              final peopleListItem =
                                  peopleList[peopleListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: InkWell(
                                  onTap: () async {
                                    final eventsUpdateData = {
                                      'people': FieldValue.arrayRemove(
                                          [peopleListItem]),
                                    };
                                    await widget.eventReference!
                                        .update(eventsUpdateData);
                                    _model.newPeople = await actions.removeItem(
                                      widget.people!.toList(),
                                      peopleListItem,
                                    );
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'CurrentEvent',
                                      queryParams: {
                                        'title': serializeParam(
                                          widget.title,
                                          ParamType.String,
                                        ),
                                        'people': serializeParam(
                                          _model.newPeople,
                                          ParamType.String,
                                          true,
                                        ),
                                        'status': serializeParam(
                                          widget.status,
                                          ParamType.String,
                                        ),
                                        'scores': serializeParam(
                                          widget.scores,
                                          ParamType.JSON,
                                        ),
                                        'eventReference': serializeParam(
                                          widget.eventReference,
                                          ParamType.DocumentReference,
                                        ),
                                        'finish': serializeParam(
                                          widget.finish,
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: ListTile(
                                        title: Text(
                                          peopleListItem,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        trailing: Icon(
                                          Icons.close,
                                          color: Color(0xFF303030),
                                          size: 20.0,
                                        ),
                                        tileColor: Color(0xFFF5F5F5),
                                        dense: false,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if (widget.status != 'Done')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (widget.people?.length != 0) {
                              _model.finishReal = await actions.createFinishMap(
                                widget.people!.toList(),
                              );
                              _model.scoresReal = await actions.createScoreMap(
                                widget.people!.toList(),
                              );

                              context.pushNamed(
                                'ScoreCounter',
                                queryParams: {
                                  'people': serializeParam(
                                    widget.people,
                                    ParamType.String,
                                    true,
                                  ),
                                  'eventReference': serializeParam(
                                    widget.eventReference,
                                    ParamType.DocumentReference,
                                  ),
                                  'scores': serializeParam(
                                    _model.scoresReal,
                                    ParamType.JSON,
                                  ),
                                  'finish': serializeParam(
                                    _model.finishReal,
                                    ParamType.JSON,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              context.pushNamed(
                                'CurrentEvent',
                                queryParams: {
                                  'title': serializeParam(
                                    widget.title,
                                    ParamType.String,
                                  ),
                                  'people': serializeParam(
                                    widget.people,
                                    ParamType.String,
                                    true,
                                  ),
                                  'status': serializeParam(
                                    widget.status,
                                    ParamType.String,
                                  ),
                                  'eventReference': serializeParam(
                                    widget.eventReference,
                                    ParamType.DocumentReference,
                                  ),
                                  'noPeople': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            setState(() {});
                          },
                          text: 'Start',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    if (widget.status != 'Done')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'AddPeopleToEvent',
                              queryParams: {
                                'title': serializeParam(
                                  widget.title,
                                  ParamType.String,
                                ),
                                'event': serializeParam(
                                  widget.eventReference,
                                  ParamType.DocumentReference,
                                ),
                                'personIsAdded': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Add People',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.eventReference!.delete();

                          context.goNamed('HomePage');
                        },
                        text: 'Delete Event',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: 'Back',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
