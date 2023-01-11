// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClubsRecord> _$clubsRecordSerializer = new _$ClubsRecordSerializer();

class _$ClubsRecordSerializer implements StructuredSerializer<ClubsRecord> {
  @override
  final Iterable<Type> types = const [ClubsRecord, _$ClubsRecord];
  @override
  final String wireName = 'ClubsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ClubsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.foundingDate;
    if (value != null) {
      result
        ..add('founding_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.coach1;
    if (value != null) {
      result
        ..add('coach1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.coach2;
    if (value != null) {
      result
        ..add('coach2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ClubsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClubsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'founding_date':
          result.foundingDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'coach1':
          result.coach1 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'coach2':
          result.coach2 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ClubsRecord extends ClubsRecord {
  @override
  final String? name;
  @override
  final LatLng? location;
  @override
  final DateTime? foundingDate;
  @override
  final DocumentReference<Object?>? coach1;
  @override
  final DocumentReference<Object?>? coach2;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ClubsRecord([void Function(ClubsRecordBuilder)? updates]) =>
      (new ClubsRecordBuilder()..update(updates))._build();

  _$ClubsRecord._(
      {this.name,
      this.location,
      this.foundingDate,
      this.coach1,
      this.coach2,
      this.ffRef})
      : super._();

  @override
  ClubsRecord rebuild(void Function(ClubsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubsRecordBuilder toBuilder() => new ClubsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubsRecord &&
        name == other.name &&
        location == other.location &&
        foundingDate == other.foundingDate &&
        coach1 == other.coach1 &&
        coach2 == other.coach2 &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), location.hashCode),
                    foundingDate.hashCode),
                coach1.hashCode),
            coach2.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubsRecord')
          ..add('name', name)
          ..add('location', location)
          ..add('foundingDate', foundingDate)
          ..add('coach1', coach1)
          ..add('coach2', coach2)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ClubsRecordBuilder implements Builder<ClubsRecord, ClubsRecordBuilder> {
  _$ClubsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DateTime? _foundingDate;
  DateTime? get foundingDate => _$this._foundingDate;
  set foundingDate(DateTime? foundingDate) =>
      _$this._foundingDate = foundingDate;

  DocumentReference<Object?>? _coach1;
  DocumentReference<Object?>? get coach1 => _$this._coach1;
  set coach1(DocumentReference<Object?>? coach1) => _$this._coach1 = coach1;

  DocumentReference<Object?>? _coach2;
  DocumentReference<Object?>? get coach2 => _$this._coach2;
  set coach2(DocumentReference<Object?>? coach2) => _$this._coach2 = coach2;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ClubsRecordBuilder() {
    ClubsRecord._initializeBuilder(this);
  }

  ClubsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _foundingDate = $v.foundingDate;
      _coach1 = $v.coach1;
      _coach2 = $v.coach2;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClubsRecord;
  }

  @override
  void update(void Function(ClubsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubsRecord build() => _build();

  _$ClubsRecord _build() {
    final _$result = _$v ??
        new _$ClubsRecord._(
            name: name,
            location: location,
            foundingDate: foundingDate,
            coach1: coach1,
            coach2: coach2,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
