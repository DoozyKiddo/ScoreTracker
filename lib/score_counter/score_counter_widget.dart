import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'score_counter_model.dart';
export 'score_counter_model.dart';

class ScoreCounterWidget extends StatefulWidget {
  const ScoreCounterWidget({
    Key? key,
    this.people,
    this.scores,
    this.eventReference,
    this.finish,
  }) : super(key: key);

  final List<String>? people;
  final dynamic scores;
  final DocumentReference? eventReference;
  final dynamic finish;

  @override
  _ScoreCounterWidgetState createState() => _ScoreCounterWidgetState();
}

class _ScoreCounterWidgetState extends State<ScoreCounterWidget> {
  late ScoreCounterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScoreCounterModel());
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
            'Scores',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    final people = widget.people?.toList() ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: people.length,
                      itemBuilder: (context, peopleIndex) {
                        final peopleItem = people[peopleIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: InkWell(
                            onTap: () async {
                              context.goNamed('ScoreCounterIndividual');
                            },
                            child: Container(
                              width: 100.0,
                              height: MediaQuery.of(context).size.height * 0.17,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: ListTile(
                                      title: Text(
                                        peopleItem,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                      subtitle: Text(
                                        functions
                                            .getScore(
                                                widget.scores!, peopleItem)
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  if (functions.isFinished(
                                      widget.finish!, peopleItem))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'ScoreCounterIndividual',
                                                queryParams: {
                                                  'person': serializeParam(
                                                    peopleItem,
                                                    ParamType.String,
                                                  ),
                                                  'scores': serializeParam(
                                                    widget.scores,
                                                    ParamType.JSON,
                                                  ),
                                                  'finish': serializeParam(
                                                    widget.finish,
                                                    ParamType.JSON,
                                                  ),
                                                  'eventReference':
                                                      serializeParam(
                                                    widget.eventReference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'people': serializeParam(
                                                    widget.people,
                                                    ParamType.String,
                                                    true,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Edit',
                                            icon: Icon(
                                              Icons.edit,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final eventsUpdateData = {
                                                'score_list':
                                                    FieldValue.arrayUnion([
                                                  getScoreFirestoreData(
                                                    createScoreStruct(
                                                      person: peopleItem,
                                                      scoreNumber:
                                                          valueOrDefault<int>(
                                                        functions.getScore(
                                                            widget.scores!,
                                                            peopleItem),
                                                        0,
                                                      ),
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              };
                                              await widget.eventReference!
                                                  .update(eventsUpdateData);
                                              _model.finishUpdated =
                                                  await actions.setFinish(
                                                widget.finish!,
                                                peopleItem,
                                              );

                                              context.goNamed(
                                                'ScoreCounter',
                                                queryParams: {
                                                  'people': serializeParam(
                                                    widget.people,
                                                    ParamType.String,
                                                    true,
                                                  ),
                                                  'scores': serializeParam(
                                                    widget.scores,
                                                    ParamType.JSON,
                                                  ),
                                                  'eventReference':
                                                      serializeParam(
                                                    widget.eventReference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'finish': serializeParam(
                                                    _model.finishUpdated,
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              setState(() {});
                                            },
                                            text: 'Confirm',
                                            icon: Icon(
                                              Icons.check,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final eventsUpdateData = createEventsRecordData(
                      status: 'Done',
                    );
                    await widget.eventReference!.update(eventsUpdateData);

                    context.goNamed('HomePage');
                  },
                  text: 'Finish',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
