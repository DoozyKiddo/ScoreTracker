// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScoreStruct> _$scoreStructSerializer = new _$ScoreStructSerializer();

class _$ScoreStructSerializer implements StructuredSerializer<ScoreStruct> {
  @override
  final Iterable<Type> types = const [ScoreStruct, _$ScoreStruct];
  @override
  final String wireName = 'ScoreStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScoreStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.person;
    if (value != null) {
      result
        ..add('person')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scoreNumber;
    if (value != null) {
      result
        ..add('score_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ScoreStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScoreStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'person':
          result.person = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'score_number':
          result.scoreNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$ScoreStruct extends ScoreStruct {
  @override
  final String? person;
  @override
  final int? scoreNumber;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ScoreStruct([void Function(ScoreStructBuilder)? updates]) =>
      (new ScoreStructBuilder()..update(updates))._build();

  _$ScoreStruct._(
      {this.person, this.scoreNumber, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ScoreStruct', 'firestoreUtilData');
  }

  @override
  ScoreStruct rebuild(void Function(ScoreStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScoreStructBuilder toBuilder() => new ScoreStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScoreStruct &&
        person == other.person &&
        scoreNumber == other.scoreNumber &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, person.hashCode);
    _$hash = $jc(_$hash, scoreNumber.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScoreStruct')
          ..add('person', person)
          ..add('scoreNumber', scoreNumber)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ScoreStructBuilder implements Builder<ScoreStruct, ScoreStructBuilder> {
  _$ScoreStruct? _$v;

  String? _person;
  String? get person => _$this._person;
  set person(String? person) => _$this._person = person;

  int? _scoreNumber;
  int? get scoreNumber => _$this._scoreNumber;
  set scoreNumber(int? scoreNumber) => _$this._scoreNumber = scoreNumber;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ScoreStructBuilder() {
    ScoreStruct._initializeBuilder(this);
  }

  ScoreStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _person = $v.person;
      _scoreNumber = $v.scoreNumber;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScoreStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScoreStruct;
  }

  @override
  void update(void Function(ScoreStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScoreStruct build() => _build();

  _$ScoreStruct _build() {
    final _$result = _$v ??
        new _$ScoreStruct._(
            person: person,
            scoreNumber: scoreNumber,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ScoreStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
