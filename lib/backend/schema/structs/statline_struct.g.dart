// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statline_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StatlineStruct> _$statlineStructSerializer =
    new _$StatlineStructSerializer();

class _$StatlineStructSerializer
    implements StructuredSerializer<StatlineStruct> {
  @override
  final Iterable<Type> types = const [StatlineStruct, _$StatlineStruct];
  @override
  final String wireName = 'StatlineStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, StatlineStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.label;
    if (value != null) {
      result
        ..add('Label')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.leftStat;
    if (value != null) {
      result
        ..add('LeftStat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rightStat;
    if (value != null) {
      result
        ..add('RightStat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  StatlineStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatlineStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'LeftStat':
          result.leftStat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'RightStat':
          result.rightStat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$StatlineStruct extends StatlineStruct {
  @override
  final String? label;
  @override
  final double? leftStat;
  @override
  final double? rightStat;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$StatlineStruct([void Function(StatlineStructBuilder)? updates]) =>
      (new StatlineStructBuilder()..update(updates))._build();

  _$StatlineStruct._(
      {this.label,
      this.leftStat,
      this.rightStat,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'StatlineStruct', 'firestoreUtilData');
  }

  @override
  StatlineStruct rebuild(void Function(StatlineStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatlineStructBuilder toBuilder() =>
      new StatlineStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatlineStruct &&
        label == other.label &&
        leftStat == other.leftStat &&
        rightStat == other.rightStat &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, label.hashCode), leftStat.hashCode), rightStat.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatlineStruct')
          ..add('label', label)
          ..add('leftStat', leftStat)
          ..add('rightStat', rightStat)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class StatlineStructBuilder
    implements Builder<StatlineStruct, StatlineStructBuilder> {
  _$StatlineStruct? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  double? _leftStat;
  double? get leftStat => _$this._leftStat;
  set leftStat(double? leftStat) => _$this._leftStat = leftStat;

  double? _rightStat;
  double? get rightStat => _$this._rightStat;
  set rightStat(double? rightStat) => _$this._rightStat = rightStat;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  StatlineStructBuilder() {
    StatlineStruct._initializeBuilder(this);
  }

  StatlineStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _leftStat = $v.leftStat;
      _rightStat = $v.rightStat;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatlineStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatlineStruct;
  }

  @override
  void update(void Function(StatlineStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatlineStruct build() => _build();

  _$StatlineStruct _build() {
    final _$result = _$v ??
        new _$StatlineStruct._(
            label: label,
            leftStat: leftStat,
            rightStat: rightStat,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'StatlineStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
