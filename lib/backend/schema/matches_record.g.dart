// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchesRecord> _$matchesRecordSerializer =
    new _$MatchesRecordSerializer();

class _$MatchesRecordSerializer implements StructuredSerializer<MatchesRecord> {
  @override
  final Iterable<Type> types = const [MatchesRecord, _$MatchesRecord];
  @override
  final String wireName = 'MatchesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MatchesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.user1;
    if (value != null) {
      result
        ..add('user1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.user2;
    if (value != null) {
      result
        ..add('user2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.scheduledTime;
    if (value != null) {
      result
        ..add('scheduled_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.noOfPeriods;
    if (value != null) {
      result
        ..add('no_of_periods')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.score1;
    if (value != null) {
      result
        ..add('score1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.score2;
    if (value != null) {
      result
        ..add('score2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weapon;
    if (value != null) {
      result
        ..add('weapon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.fencers;
    if (value != null) {
      result
        ..add('fencers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  MatchesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user1':
          result.user1 = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'user2':
          result.user2 = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'scheduled_time':
          result.scheduledTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'no_of_periods':
          result.noOfPeriods = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'score1':
          result.score1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'score2':
          result.score2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'weapon':
          result.weapon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'fencers':
          result.fencers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$MatchesRecord extends MatchesRecord {
  @override
  final DocumentReference<Object> user1;
  @override
  final DocumentReference<Object> user2;
  @override
  final DateTime scheduledTime;
  @override
  final int noOfPeriods;
  @override
  final int score1;
  @override
  final int score2;
  @override
  final String weapon;
  @override
  final LatLng location;
  @override
  final BuiltList<DocumentReference<Object>> fencers;
  @override
  final DocumentReference<Object> reference;

  factory _$MatchesRecord([void Function(MatchesRecordBuilder) updates]) =>
      (new MatchesRecordBuilder()..update(updates))._build();

  _$MatchesRecord._(
      {this.user1,
      this.user2,
      this.scheduledTime,
      this.noOfPeriods,
      this.score1,
      this.score2,
      this.weapon,
      this.location,
      this.fencers,
      this.reference})
      : super._();

  @override
  MatchesRecord rebuild(void Function(MatchesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchesRecordBuilder toBuilder() => new MatchesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchesRecord &&
        user1 == other.user1 &&
        user2 == other.user2 &&
        scheduledTime == other.scheduledTime &&
        noOfPeriods == other.noOfPeriods &&
        score1 == other.score1 &&
        score2 == other.score2 &&
        weapon == other.weapon &&
        location == other.location &&
        fencers == other.fencers &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, user1.hashCode), user2.hashCode),
                                    scheduledTime.hashCode),
                                noOfPeriods.hashCode),
                            score1.hashCode),
                        score2.hashCode),
                    weapon.hashCode),
                location.hashCode),
            fencers.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchesRecord')
          ..add('user1', user1)
          ..add('user2', user2)
          ..add('scheduledTime', scheduledTime)
          ..add('noOfPeriods', noOfPeriods)
          ..add('score1', score1)
          ..add('score2', score2)
          ..add('weapon', weapon)
          ..add('location', location)
          ..add('fencers', fencers)
          ..add('reference', reference))
        .toString();
  }
}

class MatchesRecordBuilder
    implements Builder<MatchesRecord, MatchesRecordBuilder> {
  _$MatchesRecord _$v;

  DocumentReference<Object> _user1;
  DocumentReference<Object> get user1 => _$this._user1;
  set user1(DocumentReference<Object> user1) => _$this._user1 = user1;

  DocumentReference<Object> _user2;
  DocumentReference<Object> get user2 => _$this._user2;
  set user2(DocumentReference<Object> user2) => _$this._user2 = user2;

  DateTime _scheduledTime;
  DateTime get scheduledTime => _$this._scheduledTime;
  set scheduledTime(DateTime scheduledTime) =>
      _$this._scheduledTime = scheduledTime;

  int _noOfPeriods;
  int get noOfPeriods => _$this._noOfPeriods;
  set noOfPeriods(int noOfPeriods) => _$this._noOfPeriods = noOfPeriods;

  int _score1;
  int get score1 => _$this._score1;
  set score1(int score1) => _$this._score1 = score1;

  int _score2;
  int get score2 => _$this._score2;
  set score2(int score2) => _$this._score2 = score2;

  String _weapon;
  String get weapon => _$this._weapon;
  set weapon(String weapon) => _$this._weapon = weapon;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  ListBuilder<DocumentReference<Object>> _fencers;
  ListBuilder<DocumentReference<Object>> get fencers =>
      _$this._fencers ??= new ListBuilder<DocumentReference<Object>>();
  set fencers(ListBuilder<DocumentReference<Object>> fencers) =>
      _$this._fencers = fencers;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MatchesRecordBuilder() {
    MatchesRecord._initializeBuilder(this);
  }

  MatchesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1 = $v.user1;
      _user2 = $v.user2;
      _scheduledTime = $v.scheduledTime;
      _noOfPeriods = $v.noOfPeriods;
      _score1 = $v.score1;
      _score2 = $v.score2;
      _weapon = $v.weapon;
      _location = $v.location;
      _fencers = $v.fencers?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchesRecord;
  }

  @override
  void update(void Function(MatchesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchesRecord build() => _build();

  _$MatchesRecord _build() {
    _$MatchesRecord _$result;
    try {
      _$result = _$v ??
          new _$MatchesRecord._(
              user1: user1,
              user2: user2,
              scheduledTime: scheduledTime,
              noOfPeriods: noOfPeriods,
              score1: score1,
              score2: score2,
              weapon: weapon,
              location: location,
              fencers: _fencers?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fencers';
        _fencers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MatchesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
