// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eloFA;
    if (value != null) {
      result
        ..add('elo_FA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloFY;
    if (value != null) {
      result
        ..add('elo_FY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloEA;
    if (value != null) {
      result
        ..add('elo_EA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloEY;
    if (value != null) {
      result
        ..add('elo_EY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloSA;
    if (value != null) {
      result
        ..add('elo_SA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloSY;
    if (value != null) {
      result
        ..add('elo_SY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloNA;
    if (value != null) {
      result
        ..add('elo_NA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloNY;
    if (value != null) {
      result
        ..add('elo_NY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isYouth;
    if (value != null) {
      result
        ..add('isYouth')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.existingUser;
    if (value != null) {
      result
        ..add('existingUser')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dob;
    if (value != null) {
      result
        ..add('dob')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.homecountry;
    if (value != null) {
      result
        ..add('homecountry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numRankedFA;
    if (value != null) {
      result
        ..add('numRankedFA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedFY;
    if (value != null) {
      result
        ..add('numRankedFY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedEA;
    if (value != null) {
      result
        ..add('numRankedEA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedEY;
    if (value != null) {
      result
        ..add('numRankedEY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedSA;
    if (value != null) {
      result
        ..add('numRankedSA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedSY;
    if (value != null) {
      result
        ..add('numRankedSY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedNA;
    if (value != null) {
      result
        ..add('numRankedNA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRankedNY;
    if (value != null) {
      result
        ..add('numRankedNY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rankingsPage;
    if (value != null) {
      result
        ..add('rankingsPage')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'elo_FA':
          result.eloFA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_FY':
          result.eloFY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_EA':
          result.eloEA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_EY':
          result.eloEY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_SA':
          result.eloSA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_SY':
          result.eloSY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_NA':
          result.eloNA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_NY':
          result.eloNY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isYouth':
          result.isYouth = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'existingUser':
          result.existingUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'homecountry':
          result.homecountry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numRankedFA':
          result.numRankedFA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedFY':
          result.numRankedFY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedEA':
          result.numRankedEA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedEY':
          result.numRankedEY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedSA':
          result.numRankedSA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedSY':
          result.numRankedSY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedNA':
          result.numRankedNA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRankedNY':
          result.numRankedNY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rankingsPage':
          result.rankingsPage = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final int? eloFA;
  @override
  final int? eloFY;
  @override
  final int? eloEA;
  @override
  final int? eloEY;
  @override
  final int? eloSA;
  @override
  final int? eloSY;
  @override
  final int? eloNA;
  @override
  final int? eloNY;
  @override
  final bool? isYouth;
  @override
  final bool? existingUser;
  @override
  final DateTime? dob;
  @override
  final String? homecountry;
  @override
  final int? numRankedFA;
  @override
  final int? numRankedFY;
  @override
  final int? numRankedEA;
  @override
  final int? numRankedEY;
  @override
  final int? numRankedSA;
  @override
  final int? numRankedSY;
  @override
  final int? numRankedNA;
  @override
  final int? numRankedNY;
  @override
  final DocumentReference<Object?>? rankingsPage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.eloFA,
      this.eloFY,
      this.eloEA,
      this.eloEY,
      this.eloSA,
      this.eloSY,
      this.eloNA,
      this.eloNY,
      this.isYouth,
      this.existingUser,
      this.dob,
      this.homecountry,
      this.numRankedFA,
      this.numRankedFY,
      this.numRankedEA,
      this.numRankedEY,
      this.numRankedSA,
      this.numRankedSY,
      this.numRankedNA,
      this.numRankedNY,
      this.rankingsPage,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        eloFA == other.eloFA &&
        eloFY == other.eloFY &&
        eloEA == other.eloEA &&
        eloEY == other.eloEY &&
        eloSA == other.eloSA &&
        eloSY == other.eloSY &&
        eloNA == other.eloNA &&
        eloNY == other.eloNY &&
        isYouth == other.isYouth &&
        existingUser == other.existingUser &&
        dob == other.dob &&
        homecountry == other.homecountry &&
        numRankedFA == other.numRankedFA &&
        numRankedFY == other.numRankedFY &&
        numRankedEA == other.numRankedEA &&
        numRankedEY == other.numRankedEY &&
        numRankedSA == other.numRankedSA &&
        numRankedSY == other.numRankedSY &&
        numRankedNA == other.numRankedNA &&
        numRankedNY == other.numRankedNY &&
        rankingsPage == other.rankingsPage &&
        ffRef == other.ffRef;
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode), phoneNumber.hashCode), eloFA.hashCode), eloFY.hashCode), eloEA.hashCode),
                                                                                eloEY.hashCode),
                                                                            eloSA.hashCode),
                                                                        eloSY.hashCode),
                                                                    eloNA.hashCode),
                                                                eloNY.hashCode),
                                                            isYouth.hashCode),
                                                        existingUser.hashCode),
                                                    dob.hashCode),
                                                homecountry.hashCode),
                                            numRankedFA.hashCode),
                                        numRankedFY.hashCode),
                                    numRankedEA.hashCode),
                                numRankedEY.hashCode),
                            numRankedSA.hashCode),
                        numRankedSY.hashCode),
                    numRankedNA.hashCode),
                numRankedNY.hashCode),
            rankingsPage.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('eloFA', eloFA)
          ..add('eloFY', eloFY)
          ..add('eloEA', eloEA)
          ..add('eloEY', eloEY)
          ..add('eloSA', eloSA)
          ..add('eloSY', eloSY)
          ..add('eloNA', eloNA)
          ..add('eloNY', eloNY)
          ..add('isYouth', isYouth)
          ..add('existingUser', existingUser)
          ..add('dob', dob)
          ..add('homecountry', homecountry)
          ..add('numRankedFA', numRankedFA)
          ..add('numRankedFY', numRankedFY)
          ..add('numRankedEA', numRankedEA)
          ..add('numRankedEY', numRankedEY)
          ..add('numRankedSA', numRankedSA)
          ..add('numRankedSY', numRankedSY)
          ..add('numRankedNA', numRankedNA)
          ..add('numRankedNY', numRankedNY)
          ..add('rankingsPage', rankingsPage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  int? _eloFA;
  int? get eloFA => _$this._eloFA;
  set eloFA(int? eloFA) => _$this._eloFA = eloFA;

  int? _eloFY;
  int? get eloFY => _$this._eloFY;
  set eloFY(int? eloFY) => _$this._eloFY = eloFY;

  int? _eloEA;
  int? get eloEA => _$this._eloEA;
  set eloEA(int? eloEA) => _$this._eloEA = eloEA;

  int? _eloEY;
  int? get eloEY => _$this._eloEY;
  set eloEY(int? eloEY) => _$this._eloEY = eloEY;

  int? _eloSA;
  int? get eloSA => _$this._eloSA;
  set eloSA(int? eloSA) => _$this._eloSA = eloSA;

  int? _eloSY;
  int? get eloSY => _$this._eloSY;
  set eloSY(int? eloSY) => _$this._eloSY = eloSY;

  int? _eloNA;
  int? get eloNA => _$this._eloNA;
  set eloNA(int? eloNA) => _$this._eloNA = eloNA;

  int? _eloNY;
  int? get eloNY => _$this._eloNY;
  set eloNY(int? eloNY) => _$this._eloNY = eloNY;

  bool? _isYouth;
  bool? get isYouth => _$this._isYouth;
  set isYouth(bool? isYouth) => _$this._isYouth = isYouth;

  bool? _existingUser;
  bool? get existingUser => _$this._existingUser;
  set existingUser(bool? existingUser) => _$this._existingUser = existingUser;

  DateTime? _dob;
  DateTime? get dob => _$this._dob;
  set dob(DateTime? dob) => _$this._dob = dob;

  String? _homecountry;
  String? get homecountry => _$this._homecountry;
  set homecountry(String? homecountry) => _$this._homecountry = homecountry;

  int? _numRankedFA;
  int? get numRankedFA => _$this._numRankedFA;
  set numRankedFA(int? numRankedFA) => _$this._numRankedFA = numRankedFA;

  int? _numRankedFY;
  int? get numRankedFY => _$this._numRankedFY;
  set numRankedFY(int? numRankedFY) => _$this._numRankedFY = numRankedFY;

  int? _numRankedEA;
  int? get numRankedEA => _$this._numRankedEA;
  set numRankedEA(int? numRankedEA) => _$this._numRankedEA = numRankedEA;

  int? _numRankedEY;
  int? get numRankedEY => _$this._numRankedEY;
  set numRankedEY(int? numRankedEY) => _$this._numRankedEY = numRankedEY;

  int? _numRankedSA;
  int? get numRankedSA => _$this._numRankedSA;
  set numRankedSA(int? numRankedSA) => _$this._numRankedSA = numRankedSA;

  int? _numRankedSY;
  int? get numRankedSY => _$this._numRankedSY;
  set numRankedSY(int? numRankedSY) => _$this._numRankedSY = numRankedSY;

  int? _numRankedNA;
  int? get numRankedNA => _$this._numRankedNA;
  set numRankedNA(int? numRankedNA) => _$this._numRankedNA = numRankedNA;

  int? _numRankedNY;
  int? get numRankedNY => _$this._numRankedNY;
  set numRankedNY(int? numRankedNY) => _$this._numRankedNY = numRankedNY;

  DocumentReference<Object?>? _rankingsPage;
  DocumentReference<Object?>? get rankingsPage => _$this._rankingsPage;
  set rankingsPage(DocumentReference<Object?>? rankingsPage) =>
      _$this._rankingsPage = rankingsPage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _eloFA = $v.eloFA;
      _eloFY = $v.eloFY;
      _eloEA = $v.eloEA;
      _eloEY = $v.eloEY;
      _eloSA = $v.eloSA;
      _eloSY = $v.eloSY;
      _eloNA = $v.eloNA;
      _eloNY = $v.eloNY;
      _isYouth = $v.isYouth;
      _existingUser = $v.existingUser;
      _dob = $v.dob;
      _homecountry = $v.homecountry;
      _numRankedFA = $v.numRankedFA;
      _numRankedFY = $v.numRankedFY;
      _numRankedEA = $v.numRankedEA;
      _numRankedEY = $v.numRankedEY;
      _numRankedSA = $v.numRankedSA;
      _numRankedSY = $v.numRankedSY;
      _numRankedNA = $v.numRankedNA;
      _numRankedNY = $v.numRankedNY;
      _rankingsPage = $v.rankingsPage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            eloFA: eloFA,
            eloFY: eloFY,
            eloEA: eloEA,
            eloEY: eloEY,
            eloSA: eloSA,
            eloSY: eloSY,
            eloNA: eloNA,
            eloNY: eloNY,
            isYouth: isYouth,
            existingUser: existingUser,
            dob: dob,
            homecountry: homecountry,
            numRankedFA: numRankedFA,
            numRankedFY: numRankedFY,
            numRankedEA: numRankedEA,
            numRankedEY: numRankedEY,
            numRankedSA: numRankedSA,
            numRankedSY: numRankedSY,
            numRankedNA: numRankedNA,
            numRankedNY: numRankedNY,
            rankingsPage: rankingsPage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
