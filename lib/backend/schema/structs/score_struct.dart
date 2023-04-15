import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'score_struct.g.dart';

abstract class ScoreStruct implements Built<ScoreStruct, ScoreStructBuilder> {
  static Serializer<ScoreStruct> get serializer => _$scoreStructSerializer;

  String? get person;

  @BuiltValueField(wireName: 'score_number')
  int? get scoreNumber;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ScoreStructBuilder builder) => builder
    ..person = ''
    ..scoreNumber = 0
    ..firestoreUtilData = FirestoreUtilData();

  ScoreStruct._();
  factory ScoreStruct([void Function(ScoreStructBuilder) updates]) =
      _$ScoreStruct;
}

ScoreStruct createScoreStruct({
  String? person,
  int? scoreNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScoreStruct(
      (s) => s
        ..person = person
        ..scoreNumber = scoreNumber
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ScoreStruct? updateScoreStruct(
  ScoreStruct? score, {
  bool clearUnsetFields = true,
}) =>
    score != null
        ? (score.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addScoreStructData(
  Map<String, dynamic> firestoreData,
  ScoreStruct? score,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (score == null) {
    return;
  }
  if (score.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && score.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scoreData = getScoreFirestoreData(score, forFieldValue);
  final nestedData = scoreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = score.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getScoreFirestoreData(
  ScoreStruct? score, [
  bool forFieldValue = false,
]) {
  if (score == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(ScoreStruct.serializer, score);

  // Add any Firestore field values
  score.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScoreListFirestoreData(
  List<ScoreStruct>? scores,
) =>
    scores?.map((s) => getScoreFirestoreData(s, true)).toList() ?? [];
