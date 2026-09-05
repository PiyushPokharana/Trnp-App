// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CompaniesTable extends Companies
    with TableInfo<$CompaniesTable, Company> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompaniesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _businessTypeMeta =
      const VerificationMeta('businessType');
  @override
  late final GeneratedColumn<String> businessType = GeneratedColumn<String>(
      'business_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _defaultCurrencyMeta =
      const VerificationMeta('defaultCurrency');
  @override
  late final GeneratedColumn<String> defaultCurrency = GeneratedColumn<String>(
      'default_currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('INR'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, businessType, defaultCurrency, isActive, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'companies';
  @override
  VerificationContext validateIntegrity(Insertable<Company> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('business_type')) {
      context.handle(
          _businessTypeMeta,
          businessType.isAcceptableOrUnknown(
              data['business_type']!, _businessTypeMeta));
    } else if (isInserting) {
      context.missing(_businessTypeMeta);
    }
    if (data.containsKey('default_currency')) {
      context.handle(
          _defaultCurrencyMeta,
          defaultCurrency.isAcceptableOrUnknown(
              data['default_currency']!, _defaultCurrencyMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Company(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      businessType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_type'])!,
      defaultCurrency: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}default_currency'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CompaniesTable createAlias(String alias) {
    return $CompaniesTable(attachedDatabase, alias);
  }
}

class Company extends DataClass implements Insertable<Company> {
  final int id;
  final String name;
  final String businessType;
  final String defaultCurrency;
  final bool isActive;
  final DateTime createdAt;
  const Company(
      {required this.id,
      required this.name,
      required this.businessType,
      required this.defaultCurrency,
      required this.isActive,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['business_type'] = Variable<String>(businessType);
    map['default_currency'] = Variable<String>(defaultCurrency);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CompaniesCompanion toCompanion(bool nullToAbsent) {
    return CompaniesCompanion(
      id: Value(id),
      name: Value(name),
      businessType: Value(businessType),
      defaultCurrency: Value(defaultCurrency),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory Company.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Company(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      businessType: serializer.fromJson<String>(json['businessType']),
      defaultCurrency: serializer.fromJson<String>(json['defaultCurrency']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'businessType': serializer.toJson<String>(businessType),
      'defaultCurrency': serializer.toJson<String>(defaultCurrency),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Company copyWith(
          {int? id,
          String? name,
          String? businessType,
          String? defaultCurrency,
          bool? isActive,
          DateTime? createdAt}) =>
      Company(
        id: id ?? this.id,
        name: name ?? this.name,
        businessType: businessType ?? this.businessType,
        defaultCurrency: defaultCurrency ?? this.defaultCurrency,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
      );
  Company copyWithCompanion(CompaniesCompanion data) {
    return Company(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      businessType: data.businessType.present
          ? data.businessType.value
          : this.businessType,
      defaultCurrency: data.defaultCurrency.present
          ? data.defaultCurrency.value
          : this.defaultCurrency,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Company(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessType: $businessType, ')
          ..write('defaultCurrency: $defaultCurrency, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, businessType, defaultCurrency, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          other.id == this.id &&
          other.name == this.name &&
          other.businessType == this.businessType &&
          other.defaultCurrency == this.defaultCurrency &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class CompaniesCompanion extends UpdateCompanion<Company> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> businessType;
  final Value<String> defaultCurrency;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const CompaniesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.businessType = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CompaniesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String businessType,
    this.defaultCurrency = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        businessType = Value(businessType);
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? businessType,
    Expression<String>? defaultCurrency,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (businessType != null) 'business_type': businessType,
      if (defaultCurrency != null) 'default_currency': defaultCurrency,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CompaniesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? businessType,
      Value<String>? defaultCurrency,
      Value<bool>? isActive,
      Value<DateTime>? createdAt}) {
    return CompaniesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      businessType: businessType ?? this.businessType,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (businessType.present) {
      map['business_type'] = Variable<String>(businessType.value);
    }
    if (defaultCurrency.present) {
      map['default_currency'] = Variable<String>(defaultCurrency.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompaniesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessType: $businessType, ')
          ..write('defaultCurrency: $defaultCurrency, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PeopleTable extends People with TableInfo<$PeopleTable, PeopleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeopleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phone, notes, isActive, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'people';
  @override
  VerificationContext validateIntegrity(Insertable<PeopleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeopleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeopleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PeopleTable createAlias(String alias) {
    return $PeopleTable(attachedDatabase, alias);
  }
}

class PeopleData extends DataClass implements Insertable<PeopleData> {
  final int id;
  final String name;
  final String? phone;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  const PeopleData(
      {required this.id,
      required this.name,
      this.phone,
      this.notes,
      required this.isActive,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PeopleCompanion toCompanion(bool nullToAbsent) {
    return PeopleCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory PeopleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeopleData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PeopleData copyWith(
          {int? id,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          DateTime? createdAt}) =>
      PeopleData(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
      );
  PeopleData copyWithCompanion(PeopleCompanion data) {
    return PeopleData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeopleData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, notes, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeopleData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class PeopleCompanion extends UpdateCompanion<PeopleData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const PeopleCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PeopleCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PeopleData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PeopleCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<DateTime>? createdAt}) {
    return PeopleCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeopleCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PersonRolesTable extends PersonRoles
    with TableInfo<$PersonRolesTable, PersonRole> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonRolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, personId, role, companyId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_roles';
  @override
  VerificationContext validateIntegrity(Insertable<PersonRole> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonRole map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonRole(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id']),
    );
  }

  @override
  $PersonRolesTable createAlias(String alias) {
    return $PersonRolesTable(attachedDatabase, alias);
  }
}

class PersonRole extends DataClass implements Insertable<PersonRole> {
  final int id;
  final int personId;
  final String role;
  final int? companyId;
  const PersonRole(
      {required this.id,
      required this.personId,
      required this.role,
      this.companyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    return map;
  }

  PersonRolesCompanion toCompanion(bool nullToAbsent) {
    return PersonRolesCompanion(
      id: Value(id),
      personId: Value(personId),
      role: Value(role),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
    );
  }

  factory PersonRole.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonRole(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      role: serializer.fromJson<String>(json['role']),
      companyId: serializer.fromJson<int?>(json['companyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'role': serializer.toJson<String>(role),
      'companyId': serializer.toJson<int?>(companyId),
    };
  }

  PersonRole copyWith(
          {int? id,
          int? personId,
          String? role,
          Value<int?> companyId = const Value.absent()}) =>
      PersonRole(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        role: role ?? this.role,
        companyId: companyId.present ? companyId.value : this.companyId,
      );
  PersonRole copyWithCompanion(PersonRolesCompanion data) {
    return PersonRole(
      id: data.id.present ? data.id.value : this.id,
      personId: data.personId.present ? data.personId.value : this.personId,
      role: data.role.present ? data.role.value : this.role,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonRole(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('role: $role, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, role, companyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonRole &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.role == this.role &&
          other.companyId == this.companyId);
}

class PersonRolesCompanion extends UpdateCompanion<PersonRole> {
  final Value<int> id;
  final Value<int> personId;
  final Value<String> role;
  final Value<int?> companyId;
  const PersonRolesCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.role = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  PersonRolesCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required String role,
    this.companyId = const Value.absent(),
  })  : personId = Value(personId),
        role = Value(role);
  static Insertable<PersonRole> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? role,
    Expression<int>? companyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (role != null) 'role': role,
      if (companyId != null) 'company_id': companyId,
    });
  }

  PersonRolesCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<String>? role,
      Value<int?>? companyId}) {
    return PersonRolesCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      role: role ?? this.role,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonRolesCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('role: $role, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }
}

class $VehiclesTable extends Vehicles with TableInfo<$VehiclesTable, Vehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  static const VerificationMeta _ownerPersonIdMeta =
      const VerificationMeta('ownerPersonId');
  @override
  late final GeneratedColumn<int> ownerPersonId = GeneratedColumn<int>(
      'owner_person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _regNumberMeta =
      const VerificationMeta('regNumber');
  @override
  late final GeneratedColumn<String> regNumber = GeneratedColumn<String>(
      'reg_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _makeMeta = const VerificationMeta('make');
  @override
  late final GeneratedColumn<String> make = GeneratedColumn<String>(
      'make', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vehicleTypeMeta =
      const VerificationMeta('vehicleType');
  @override
  late final GeneratedColumn<String> vehicleType = GeneratedColumn<String>(
      'vehicle_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _chassisNoMeta =
      const VerificationMeta('chassisNo');
  @override
  late final GeneratedColumn<String> chassisNo = GeneratedColumn<String>(
      'chassis_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _engineNoMeta =
      const VerificationMeta('engineNo');
  @override
  late final GeneratedColumn<String> engineNo = GeneratedColumn<String>(
      'engine_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _businessContextMeta =
      const VerificationMeta('businessContext');
  @override
  late final GeneratedColumn<String> businessContext = GeneratedColumn<String>(
      'business_context', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyId,
        ownerPersonId,
        regNumber,
        make,
        model,
        vehicleType,
        chassisNo,
        engineNo,
        purchaseDate,
        purchasePrice,
        status,
        businessContext,
        notes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles';
  @override
  VerificationContext validateIntegrity(Insertable<Vehicle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('owner_person_id')) {
      context.handle(
          _ownerPersonIdMeta,
          ownerPersonId.isAcceptableOrUnknown(
              data['owner_person_id']!, _ownerPersonIdMeta));
    }
    if (data.containsKey('reg_number')) {
      context.handle(_regNumberMeta,
          regNumber.isAcceptableOrUnknown(data['reg_number']!, _regNumberMeta));
    } else if (isInserting) {
      context.missing(_regNumberMeta);
    }
    if (data.containsKey('make')) {
      context.handle(
          _makeMeta, make.isAcceptableOrUnknown(data['make']!, _makeMeta));
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    }
    if (data.containsKey('vehicle_type')) {
      context.handle(
          _vehicleTypeMeta,
          vehicleType.isAcceptableOrUnknown(
              data['vehicle_type']!, _vehicleTypeMeta));
    }
    if (data.containsKey('chassis_no')) {
      context.handle(_chassisNoMeta,
          chassisNo.isAcceptableOrUnknown(data['chassis_no']!, _chassisNoMeta));
    }
    if (data.containsKey('engine_no')) {
      context.handle(_engineNoMeta,
          engineNo.isAcceptableOrUnknown(data['engine_no']!, _engineNoMeta));
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('business_context')) {
      context.handle(
          _businessContextMeta,
          businessContext.isAcceptableOrUnknown(
              data['business_context']!, _businessContextMeta));
    } else if (isInserting) {
      context.missing(_businessContextMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vehicle(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      ownerPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}owner_person_id']),
      regNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reg_number'])!,
      make: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}make']),
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model']),
      vehicleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vehicle_type']),
      chassisNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chassis_no']),
      engineNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}engine_no']),
      purchaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}purchase_date']),
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_price'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      businessContext: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}business_context'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }
}

class Vehicle extends DataClass implements Insertable<Vehicle> {
  final int id;
  final int companyId;
  final int? ownerPersonId;
  final String regNumber;
  final String? make;
  final String? model;
  final String? vehicleType;
  final String? chassisNo;
  final String? engineNo;
  final DateTime? purchaseDate;
  final double purchasePrice;
  final String status;
  final String businessContext;
  final String? notes;
  final DateTime createdAt;
  const Vehicle(
      {required this.id,
      required this.companyId,
      this.ownerPersonId,
      required this.regNumber,
      this.make,
      this.model,
      this.vehicleType,
      this.chassisNo,
      this.engineNo,
      this.purchaseDate,
      required this.purchasePrice,
      required this.status,
      required this.businessContext,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    if (!nullToAbsent || ownerPersonId != null) {
      map['owner_person_id'] = Variable<int>(ownerPersonId);
    }
    map['reg_number'] = Variable<String>(regNumber);
    if (!nullToAbsent || make != null) {
      map['make'] = Variable<String>(make);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || vehicleType != null) {
      map['vehicle_type'] = Variable<String>(vehicleType);
    }
    if (!nullToAbsent || chassisNo != null) {
      map['chassis_no'] = Variable<String>(chassisNo);
    }
    if (!nullToAbsent || engineNo != null) {
      map['engine_no'] = Variable<String>(engineNo);
    }
    if (!nullToAbsent || purchaseDate != null) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate);
    }
    map['purchase_price'] = Variable<double>(purchasePrice);
    map['status'] = Variable<String>(status);
    map['business_context'] = Variable<String>(businessContext);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VehiclesCompanion toCompanion(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      companyId: Value(companyId),
      ownerPersonId: ownerPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerPersonId),
      regNumber: Value(regNumber),
      make: make == null && nullToAbsent ? const Value.absent() : Value(make),
      model:
          model == null && nullToAbsent ? const Value.absent() : Value(model),
      vehicleType: vehicleType == null && nullToAbsent
          ? const Value.absent()
          : Value(vehicleType),
      chassisNo: chassisNo == null && nullToAbsent
          ? const Value.absent()
          : Value(chassisNo),
      engineNo: engineNo == null && nullToAbsent
          ? const Value.absent()
          : Value(engineNo),
      purchaseDate: purchaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseDate),
      purchasePrice: Value(purchasePrice),
      status: Value(status),
      businessContext: Value(businessContext),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Vehicle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vehicle(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['companyId']),
      ownerPersonId: serializer.fromJson<int?>(json['ownerPersonId']),
      regNumber: serializer.fromJson<String>(json['regNumber']),
      make: serializer.fromJson<String?>(json['make']),
      model: serializer.fromJson<String?>(json['model']),
      vehicleType: serializer.fromJson<String?>(json['vehicleType']),
      chassisNo: serializer.fromJson<String?>(json['chassisNo']),
      engineNo: serializer.fromJson<String?>(json['engineNo']),
      purchaseDate: serializer.fromJson<DateTime?>(json['purchaseDate']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      status: serializer.fromJson<String>(json['status']),
      businessContext: serializer.fromJson<String>(json['businessContext']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int>(companyId),
      'ownerPersonId': serializer.toJson<int?>(ownerPersonId),
      'regNumber': serializer.toJson<String>(regNumber),
      'make': serializer.toJson<String?>(make),
      'model': serializer.toJson<String?>(model),
      'vehicleType': serializer.toJson<String?>(vehicleType),
      'chassisNo': serializer.toJson<String?>(chassisNo),
      'engineNo': serializer.toJson<String?>(engineNo),
      'purchaseDate': serializer.toJson<DateTime?>(purchaseDate),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'status': serializer.toJson<String>(status),
      'businessContext': serializer.toJson<String>(businessContext),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Vehicle copyWith(
          {int? id,
          int? companyId,
          Value<int?> ownerPersonId = const Value.absent(),
          String? regNumber,
          Value<String?> make = const Value.absent(),
          Value<String?> model = const Value.absent(),
          Value<String?> vehicleType = const Value.absent(),
          Value<String?> chassisNo = const Value.absent(),
          Value<String?> engineNo = const Value.absent(),
          Value<DateTime?> purchaseDate = const Value.absent(),
          double? purchasePrice,
          String? status,
          String? businessContext,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      Vehicle(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        ownerPersonId:
            ownerPersonId.present ? ownerPersonId.value : this.ownerPersonId,
        regNumber: regNumber ?? this.regNumber,
        make: make.present ? make.value : this.make,
        model: model.present ? model.value : this.model,
        vehicleType: vehicleType.present ? vehicleType.value : this.vehicleType,
        chassisNo: chassisNo.present ? chassisNo.value : this.chassisNo,
        engineNo: engineNo.present ? engineNo.value : this.engineNo,
        purchaseDate:
            purchaseDate.present ? purchaseDate.value : this.purchaseDate,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        status: status ?? this.status,
        businessContext: businessContext ?? this.businessContext,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  Vehicle copyWithCompanion(VehiclesCompanion data) {
    return Vehicle(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      ownerPersonId: data.ownerPersonId.present
          ? data.ownerPersonId.value
          : this.ownerPersonId,
      regNumber: data.regNumber.present ? data.regNumber.value : this.regNumber,
      make: data.make.present ? data.make.value : this.make,
      model: data.model.present ? data.model.value : this.model,
      vehicleType:
          data.vehicleType.present ? data.vehicleType.value : this.vehicleType,
      chassisNo: data.chassisNo.present ? data.chassisNo.value : this.chassisNo,
      engineNo: data.engineNo.present ? data.engineNo.value : this.engineNo,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      status: data.status.present ? data.status.value : this.status,
      businessContext: data.businessContext.present
          ? data.businessContext.value
          : this.businessContext,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vehicle(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('regNumber: $regNumber, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('vehicleType: $vehicleType, ')
          ..write('chassisNo: $chassisNo, ')
          ..write('engineNo: $engineNo, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('status: $status, ')
          ..write('businessContext: $businessContext, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      companyId,
      ownerPersonId,
      regNumber,
      make,
      model,
      vehicleType,
      chassisNo,
      engineNo,
      purchaseDate,
      purchasePrice,
      status,
      businessContext,
      notes,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vehicle &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.ownerPersonId == this.ownerPersonId &&
          other.regNumber == this.regNumber &&
          other.make == this.make &&
          other.model == this.model &&
          other.vehicleType == this.vehicleType &&
          other.chassisNo == this.chassisNo &&
          other.engineNo == this.engineNo &&
          other.purchaseDate == this.purchaseDate &&
          other.purchasePrice == this.purchasePrice &&
          other.status == this.status &&
          other.businessContext == this.businessContext &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class VehiclesCompanion extends UpdateCompanion<Vehicle> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<int?> ownerPersonId;
  final Value<String> regNumber;
  final Value<String?> make;
  final Value<String?> model;
  final Value<String?> vehicleType;
  final Value<String?> chassisNo;
  final Value<String?> engineNo;
  final Value<DateTime?> purchaseDate;
  final Value<double> purchasePrice;
  final Value<String> status;
  final Value<String> businessContext;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.ownerPersonId = const Value.absent(),
    this.regNumber = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.vehicleType = const Value.absent(),
    this.chassisNo = const Value.absent(),
    this.engineNo = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.status = const Value.absent(),
    this.businessContext = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  VehiclesCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    this.ownerPersonId = const Value.absent(),
    required String regNumber,
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.vehicleType = const Value.absent(),
    this.chassisNo = const Value.absent(),
    this.engineNo = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    required String status,
    required String businessContext,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : companyId = Value(companyId),
        regNumber = Value(regNumber),
        status = Value(status),
        businessContext = Value(businessContext);
  static Insertable<Vehicle> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? ownerPersonId,
    Expression<String>? regNumber,
    Expression<String>? make,
    Expression<String>? model,
    Expression<String>? vehicleType,
    Expression<String>? chassisNo,
    Expression<String>? engineNo,
    Expression<DateTime>? purchaseDate,
    Expression<double>? purchasePrice,
    Expression<String>? status,
    Expression<String>? businessContext,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (ownerPersonId != null) 'owner_person_id': ownerPersonId,
      if (regNumber != null) 'reg_number': regNumber,
      if (make != null) 'make': make,
      if (model != null) 'model': model,
      if (vehicleType != null) 'vehicle_type': vehicleType,
      if (chassisNo != null) 'chassis_no': chassisNo,
      if (engineNo != null) 'engine_no': engineNo,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (status != null) 'status': status,
      if (businessContext != null) 'business_context': businessContext,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  VehiclesCompanion copyWith(
      {Value<int>? id,
      Value<int>? companyId,
      Value<int?>? ownerPersonId,
      Value<String>? regNumber,
      Value<String?>? make,
      Value<String?>? model,
      Value<String?>? vehicleType,
      Value<String?>? chassisNo,
      Value<String?>? engineNo,
      Value<DateTime?>? purchaseDate,
      Value<double>? purchasePrice,
      Value<String>? status,
      Value<String>? businessContext,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return VehiclesCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      ownerPersonId: ownerPersonId ?? this.ownerPersonId,
      regNumber: regNumber ?? this.regNumber,
      make: make ?? this.make,
      model: model ?? this.model,
      vehicleType: vehicleType ?? this.vehicleType,
      chassisNo: chassisNo ?? this.chassisNo,
      engineNo: engineNo ?? this.engineNo,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      status: status ?? this.status,
      businessContext: businessContext ?? this.businessContext,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (ownerPersonId.present) {
      map['owner_person_id'] = Variable<int>(ownerPersonId.value);
    }
    if (regNumber.present) {
      map['reg_number'] = Variable<String>(regNumber.value);
    }
    if (make.present) {
      map['make'] = Variable<String>(make.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (vehicleType.present) {
      map['vehicle_type'] = Variable<String>(vehicleType.value);
    }
    if (chassisNo.present) {
      map['chassis_no'] = Variable<String>(chassisNo.value);
    }
    if (engineNo.present) {
      map['engine_no'] = Variable<String>(engineNo.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (businessContext.present) {
      map['business_context'] = Variable<String>(businessContext.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('regNumber: $regNumber, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('vehicleType: $vehicleType, ')
          ..write('chassisNo: $chassisNo, ')
          ..write('engineNo: $engineNo, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('status: $status, ')
          ..write('businessContext: $businessContext, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $VehicleComponentsTable extends VehicleComponents
    with TableInfo<$VehicleComponentsTable, VehicleComponent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleComponentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
      'vehicle_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES vehicles (id)'));
  static const VerificationMeta _componentTypeMeta =
      const VerificationMeta('componentType');
  @override
  late final GeneratedColumn<String> componentType = GeneratedColumn<String>(
      'component_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Unsold'));
  static const VerificationMeta _saleTransactionIdMeta =
      const VerificationMeta('saleTransactionId');
  @override
  late final GeneratedColumn<int> saleTransactionId = GeneratedColumn<int>(
      'sale_transaction_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, vehicleId, componentType, status, saleTransactionId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_components';
  @override
  VerificationContext validateIntegrity(Insertable<VehicleComponent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('component_type')) {
      context.handle(
          _componentTypeMeta,
          componentType.isAcceptableOrUnknown(
              data['component_type']!, _componentTypeMeta));
    } else if (isInserting) {
      context.missing(_componentTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('sale_transaction_id')) {
      context.handle(
          _saleTransactionIdMeta,
          saleTransactionId.isAcceptableOrUnknown(
              data['sale_transaction_id']!, _saleTransactionIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleComponent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleComponent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vehicle_id'])!,
      componentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}component_type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      saleTransactionId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}sale_transaction_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $VehicleComponentsTable createAlias(String alias) {
    return $VehicleComponentsTable(attachedDatabase, alias);
  }
}

class VehicleComponent extends DataClass
    implements Insertable<VehicleComponent> {
  final int id;
  final int vehicleId;
  final String componentType;
  final String status;
  final int? saleTransactionId;
  final DateTime createdAt;
  const VehicleComponent(
      {required this.id,
      required this.vehicleId,
      required this.componentType,
      required this.status,
      this.saleTransactionId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['component_type'] = Variable<String>(componentType);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || saleTransactionId != null) {
      map['sale_transaction_id'] = Variable<int>(saleTransactionId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VehicleComponentsCompanion toCompanion(bool nullToAbsent) {
    return VehicleComponentsCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      componentType: Value(componentType),
      status: Value(status),
      saleTransactionId: saleTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(saleTransactionId),
      createdAt: Value(createdAt),
    );
  }

  factory VehicleComponent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleComponent(
      id: serializer.fromJson<int>(json['id']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      componentType: serializer.fromJson<String>(json['componentType']),
      status: serializer.fromJson<String>(json['status']),
      saleTransactionId: serializer.fromJson<int?>(json['saleTransactionId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'componentType': serializer.toJson<String>(componentType),
      'status': serializer.toJson<String>(status),
      'saleTransactionId': serializer.toJson<int?>(saleTransactionId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VehicleComponent copyWith(
          {int? id,
          int? vehicleId,
          String? componentType,
          String? status,
          Value<int?> saleTransactionId = const Value.absent(),
          DateTime? createdAt}) =>
      VehicleComponent(
        id: id ?? this.id,
        vehicleId: vehicleId ?? this.vehicleId,
        componentType: componentType ?? this.componentType,
        status: status ?? this.status,
        saleTransactionId: saleTransactionId.present
            ? saleTransactionId.value
            : this.saleTransactionId,
        createdAt: createdAt ?? this.createdAt,
      );
  VehicleComponent copyWithCompanion(VehicleComponentsCompanion data) {
    return VehicleComponent(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      componentType: data.componentType.present
          ? data.componentType.value
          : this.componentType,
      status: data.status.present ? data.status.value : this.status,
      saleTransactionId: data.saleTransactionId.present
          ? data.saleTransactionId.value
          : this.saleTransactionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleComponent(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('componentType: $componentType, ')
          ..write('status: $status, ')
          ..write('saleTransactionId: $saleTransactionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, vehicleId, componentType, status, saleTransactionId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleComponent &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.componentType == this.componentType &&
          other.status == this.status &&
          other.saleTransactionId == this.saleTransactionId &&
          other.createdAt == this.createdAt);
}

class VehicleComponentsCompanion extends UpdateCompanion<VehicleComponent> {
  final Value<int> id;
  final Value<int> vehicleId;
  final Value<String> componentType;
  final Value<String> status;
  final Value<int?> saleTransactionId;
  final Value<DateTime> createdAt;
  const VehicleComponentsCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.componentType = const Value.absent(),
    this.status = const Value.absent(),
    this.saleTransactionId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  VehicleComponentsCompanion.insert({
    this.id = const Value.absent(),
    required int vehicleId,
    required String componentType,
    this.status = const Value.absent(),
    this.saleTransactionId = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : vehicleId = Value(vehicleId),
        componentType = Value(componentType);
  static Insertable<VehicleComponent> custom({
    Expression<int>? id,
    Expression<int>? vehicleId,
    Expression<String>? componentType,
    Expression<String>? status,
    Expression<int>? saleTransactionId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (componentType != null) 'component_type': componentType,
      if (status != null) 'status': status,
      if (saleTransactionId != null) 'sale_transaction_id': saleTransactionId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  VehicleComponentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? vehicleId,
      Value<String>? componentType,
      Value<String>? status,
      Value<int?>? saleTransactionId,
      Value<DateTime>? createdAt}) {
    return VehicleComponentsCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      componentType: componentType ?? this.componentType,
      status: status ?? this.status,
      saleTransactionId: saleTransactionId ?? this.saleTransactionId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (componentType.present) {
      map['component_type'] = Variable<String>(componentType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (saleTransactionId.present) {
      map['sale_transaction_id'] = Variable<int>(saleTransactionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleComponentsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('componentType: $componentType, ')
          ..write('status: $status, ')
          ..write('saleTransactionId: $saleTransactionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionCategoriesTable extends TransactionCategories
    with TableInfo<$TransactionCategoriesTable, TransactionCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 80),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scopeCompanyIdMeta =
      const VerificationMeta('scopeCompanyId');
  @override
  late final GeneratedColumn<int> scopeCompanyId = GeneratedColumn<int>(
      'scope_company_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  static const VerificationMeta _isUserCreatedMeta =
      const VerificationMeta('isUserCreated');
  @override
  late final GeneratedColumn<bool> isUserCreated = GeneratedColumn<bool>(
      'is_user_created', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_user_created" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, direction, scopeCompanyId, isUserCreated, iconName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_categories';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('scope_company_id')) {
      context.handle(
          _scopeCompanyIdMeta,
          scopeCompanyId.isAcceptableOrUnknown(
              data['scope_company_id']!, _scopeCompanyIdMeta));
    }
    if (data.containsKey('is_user_created')) {
      context.handle(
          _isUserCreatedMeta,
          isUserCreated.isAcceptableOrUnknown(
              data['is_user_created']!, _isUserCreatedMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      scopeCompanyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scope_company_id']),
      isUserCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_user_created'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name']),
    );
  }

  @override
  $TransactionCategoriesTable createAlias(String alias) {
    return $TransactionCategoriesTable(attachedDatabase, alias);
  }
}

class TransactionCategory extends DataClass
    implements Insertable<TransactionCategory> {
  final int id;
  final String name;
  final String direction;
  final int? scopeCompanyId;
  final bool isUserCreated;
  final String? iconName;
  const TransactionCategory(
      {required this.id,
      required this.name,
      required this.direction,
      this.scopeCompanyId,
      required this.isUserCreated,
      this.iconName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['direction'] = Variable<String>(direction);
    if (!nullToAbsent || scopeCompanyId != null) {
      map['scope_company_id'] = Variable<int>(scopeCompanyId);
    }
    map['is_user_created'] = Variable<bool>(isUserCreated);
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    return map;
  }

  TransactionCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TransactionCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      direction: Value(direction),
      scopeCompanyId: scopeCompanyId == null && nullToAbsent
          ? const Value.absent()
          : Value(scopeCompanyId),
      isUserCreated: Value(isUserCreated),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
    );
  }

  factory TransactionCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      direction: serializer.fromJson<String>(json['direction']),
      scopeCompanyId: serializer.fromJson<int?>(json['scopeCompanyId']),
      isUserCreated: serializer.fromJson<bool>(json['isUserCreated']),
      iconName: serializer.fromJson<String?>(json['iconName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'direction': serializer.toJson<String>(direction),
      'scopeCompanyId': serializer.toJson<int?>(scopeCompanyId),
      'isUserCreated': serializer.toJson<bool>(isUserCreated),
      'iconName': serializer.toJson<String?>(iconName),
    };
  }

  TransactionCategory copyWith(
          {int? id,
          String? name,
          String? direction,
          Value<int?> scopeCompanyId = const Value.absent(),
          bool? isUserCreated,
          Value<String?> iconName = const Value.absent()}) =>
      TransactionCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        direction: direction ?? this.direction,
        scopeCompanyId:
            scopeCompanyId.present ? scopeCompanyId.value : this.scopeCompanyId,
        isUserCreated: isUserCreated ?? this.isUserCreated,
        iconName: iconName.present ? iconName.value : this.iconName,
      );
  TransactionCategory copyWithCompanion(TransactionCategoriesCompanion data) {
    return TransactionCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      direction: data.direction.present ? data.direction.value : this.direction,
      scopeCompanyId: data.scopeCompanyId.present
          ? data.scopeCompanyId.value
          : this.scopeCompanyId,
      isUserCreated: data.isUserCreated.present
          ? data.isUserCreated.value
          : this.isUserCreated,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('direction: $direction, ')
          ..write('scopeCompanyId: $scopeCompanyId, ')
          ..write('isUserCreated: $isUserCreated, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, direction, scopeCompanyId, isUserCreated, iconName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.direction == this.direction &&
          other.scopeCompanyId == this.scopeCompanyId &&
          other.isUserCreated == this.isUserCreated &&
          other.iconName == this.iconName);
}

class TransactionCategoriesCompanion
    extends UpdateCompanion<TransactionCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> direction;
  final Value<int?> scopeCompanyId;
  final Value<bool> isUserCreated;
  final Value<String?> iconName;
  const TransactionCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.direction = const Value.absent(),
    this.scopeCompanyId = const Value.absent(),
    this.isUserCreated = const Value.absent(),
    this.iconName = const Value.absent(),
  });
  TransactionCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String direction,
    this.scopeCompanyId = const Value.absent(),
    this.isUserCreated = const Value.absent(),
    this.iconName = const Value.absent(),
  })  : name = Value(name),
        direction = Value(direction);
  static Insertable<TransactionCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? direction,
    Expression<int>? scopeCompanyId,
    Expression<bool>? isUserCreated,
    Expression<String>? iconName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (direction != null) 'direction': direction,
      if (scopeCompanyId != null) 'scope_company_id': scopeCompanyId,
      if (isUserCreated != null) 'is_user_created': isUserCreated,
      if (iconName != null) 'icon_name': iconName,
    });
  }

  TransactionCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? direction,
      Value<int?>? scopeCompanyId,
      Value<bool>? isUserCreated,
      Value<String?>? iconName}) {
    return TransactionCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      direction: direction ?? this.direction,
      scopeCompanyId: scopeCompanyId ?? this.scopeCompanyId,
      isUserCreated: isUserCreated ?? this.isUserCreated,
      iconName: iconName ?? this.iconName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (scopeCompanyId.present) {
      map['scope_company_id'] = Variable<int>(scopeCompanyId.value);
    }
    if (isUserCreated.present) {
      map['is_user_created'] = Variable<bool>(isUserCreated.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('direction: $direction, ')
          ..write('scopeCompanyId: $scopeCompanyId, ')
          ..write('isUserCreated: $isUserCreated, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }
}

class $PaymentAccountsTable extends PaymentAccounts
    with TableInfo<$PaymentAccountsTable, PaymentAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, openingBalance, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $PaymentAccountsTable createAlias(String alias) {
    return $PaymentAccountsTable(attachedDatabase, alias);
  }
}

class PaymentAccount extends DataClass implements Insertable<PaymentAccount> {
  final int id;
  final String name;
  final String type;
  final double openingBalance;
  final bool isActive;
  const PaymentAccount(
      {required this.id,
      required this.name,
      required this.type,
      required this.openingBalance,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  PaymentAccountsCompanion toCompanion(bool nullToAbsent) {
    return PaymentAccountsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      openingBalance: Value(openingBalance),
      isActive: Value(isActive),
    );
  }

  factory PaymentAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentAccount(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  PaymentAccount copyWith(
          {int? id,
          String? name,
          String? type,
          double? openingBalance,
          bool? isActive}) =>
      PaymentAccount(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        openingBalance: openingBalance ?? this.openingBalance,
        isActive: isActive ?? this.isActive,
      );
  PaymentAccount copyWithCompanion(PaymentAccountsCompanion data) {
    return PaymentAccount(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAccount(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, openingBalance, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentAccount &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.openingBalance == this.openingBalance &&
          other.isActive == this.isActive);
}

class PaymentAccountsCompanion extends UpdateCompanion<PaymentAccount> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<double> openingBalance;
  final Value<bool> isActive;
  const PaymentAccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  PaymentAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.openingBalance = const Value.absent(),
    this.isActive = const Value.absent(),
  })  : name = Value(name),
        type = Value(type);
  static Insertable<PaymentAccount> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<double>? openingBalance,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (isActive != null) 'is_active': isActive,
    });
  }

  PaymentAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<double>? openingBalance,
      Value<bool>? isActive}) {
    return PaymentAccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      openingBalance: openingBalance ?? this.openingBalance,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  static const VerificationMeta _customerPersonIdMeta =
      const VerificationMeta('customerPersonId');
  @override
  late final GeneratedColumn<int> customerPersonId = GeneratedColumn<int>(
      'customer_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
      'vehicle_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES vehicles (id)'));
  static const VerificationMeta _driverPersonIdMeta =
      const VerificationMeta('driverPersonId');
  @override
  late final GeneratedColumn<int> driverPersonId = GeneratedColumn<int>(
      'driver_person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _materialMeta =
      const VerificationMeta('material');
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
      'material', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _freightAmountMeta =
      const VerificationMeta('freightAmount');
  @override
  late final GeneratedColumn<double> freightAmount = GeneratedColumn<double>(
      'freight_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyId,
        customerPersonId,
        vehicleId,
        driverPersonId,
        origin,
        destination,
        material,
        freightAmount,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('customer_person_id')) {
      context.handle(
          _customerPersonIdMeta,
          customerPersonId.isAcceptableOrUnknown(
              data['customer_person_id']!, _customerPersonIdMeta));
    } else if (isInserting) {
      context.missing(_customerPersonIdMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('driver_person_id')) {
      context.handle(
          _driverPersonIdMeta,
          driverPersonId.isAcceptableOrUnknown(
              data['driver_person_id']!, _driverPersonIdMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    }
    if (data.containsKey('material')) {
      context.handle(_materialMeta,
          material.isAcceptableOrUnknown(data['material']!, _materialMeta));
    }
    if (data.containsKey('freight_amount')) {
      context.handle(
          _freightAmountMeta,
          freightAmount.isAcceptableOrUnknown(
              data['freight_amount']!, _freightAmountMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      customerPersonId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}customer_person_id'])!,
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vehicle_id'])!,
      driverPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}driver_person_id']),
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin']),
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination']),
      material: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}material']),
      freightAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}freight_amount'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final int id;
  final int companyId;
  final int customerPersonId;
  final int vehicleId;
  final int? driverPersonId;
  final String? origin;
  final String? destination;
  final String? material;
  final double freightAmount;
  final String status;
  final DateTime createdAt;
  const Trip(
      {required this.id,
      required this.companyId,
      required this.customerPersonId,
      required this.vehicleId,
      this.driverPersonId,
      this.origin,
      this.destination,
      this.material,
      required this.freightAmount,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    map['customer_person_id'] = Variable<int>(customerPersonId);
    map['vehicle_id'] = Variable<int>(vehicleId);
    if (!nullToAbsent || driverPersonId != null) {
      map['driver_person_id'] = Variable<int>(driverPersonId);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || destination != null) {
      map['destination'] = Variable<String>(destination);
    }
    if (!nullToAbsent || material != null) {
      map['material'] = Variable<String>(material);
    }
    map['freight_amount'] = Variable<double>(freightAmount);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      companyId: Value(companyId),
      customerPersonId: Value(customerPersonId),
      vehicleId: Value(vehicleId),
      driverPersonId: driverPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(driverPersonId),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      destination: destination == null && nullToAbsent
          ? const Value.absent()
          : Value(destination),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      freightAmount: Value(freightAmount),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['companyId']),
      customerPersonId: serializer.fromJson<int>(json['customerPersonId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      driverPersonId: serializer.fromJson<int?>(json['driverPersonId']),
      origin: serializer.fromJson<String?>(json['origin']),
      destination: serializer.fromJson<String?>(json['destination']),
      material: serializer.fromJson<String?>(json['material']),
      freightAmount: serializer.fromJson<double>(json['freightAmount']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int>(companyId),
      'customerPersonId': serializer.toJson<int>(customerPersonId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'driverPersonId': serializer.toJson<int?>(driverPersonId),
      'origin': serializer.toJson<String?>(origin),
      'destination': serializer.toJson<String?>(destination),
      'material': serializer.toJson<String?>(material),
      'freightAmount': serializer.toJson<double>(freightAmount),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Trip copyWith(
          {int? id,
          int? companyId,
          int? customerPersonId,
          int? vehicleId,
          Value<int?> driverPersonId = const Value.absent(),
          Value<String?> origin = const Value.absent(),
          Value<String?> destination = const Value.absent(),
          Value<String?> material = const Value.absent(),
          double? freightAmount,
          String? status,
          DateTime? createdAt}) =>
      Trip(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        customerPersonId: customerPersonId ?? this.customerPersonId,
        vehicleId: vehicleId ?? this.vehicleId,
        driverPersonId:
            driverPersonId.present ? driverPersonId.value : this.driverPersonId,
        origin: origin.present ? origin.value : this.origin,
        destination: destination.present ? destination.value : this.destination,
        material: material.present ? material.value : this.material,
        freightAmount: freightAmount ?? this.freightAmount,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      customerPersonId: data.customerPersonId.present
          ? data.customerPersonId.value
          : this.customerPersonId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      driverPersonId: data.driverPersonId.present
          ? data.driverPersonId.value
          : this.driverPersonId,
      origin: data.origin.present ? data.origin.value : this.origin,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      material: data.material.present ? data.material.value : this.material,
      freightAmount: data.freightAmount.present
          ? data.freightAmount.value
          : this.freightAmount,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('customerPersonId: $customerPersonId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('driverPersonId: $driverPersonId, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('material: $material, ')
          ..write('freightAmount: $freightAmount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      companyId,
      customerPersonId,
      vehicleId,
      driverPersonId,
      origin,
      destination,
      material,
      freightAmount,
      status,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.customerPersonId == this.customerPersonId &&
          other.vehicleId == this.vehicleId &&
          other.driverPersonId == this.driverPersonId &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.material == this.material &&
          other.freightAmount == this.freightAmount &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<int> customerPersonId;
  final Value<int> vehicleId;
  final Value<int?> driverPersonId;
  final Value<String?> origin;
  final Value<String?> destination;
  final Value<String?> material;
  final Value<double> freightAmount;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.customerPersonId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.driverPersonId = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.material = const Value.absent(),
    this.freightAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TripsCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    required int customerPersonId,
    required int vehicleId,
    this.driverPersonId = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.material = const Value.absent(),
    this.freightAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : companyId = Value(companyId),
        customerPersonId = Value(customerPersonId),
        vehicleId = Value(vehicleId);
  static Insertable<Trip> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? customerPersonId,
    Expression<int>? vehicleId,
    Expression<int>? driverPersonId,
    Expression<String>? origin,
    Expression<String>? destination,
    Expression<String>? material,
    Expression<double>? freightAmount,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (customerPersonId != null) 'customer_person_id': customerPersonId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (driverPersonId != null) 'driver_person_id': driverPersonId,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (material != null) 'material': material,
      if (freightAmount != null) 'freight_amount': freightAmount,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TripsCompanion copyWith(
      {Value<int>? id,
      Value<int>? companyId,
      Value<int>? customerPersonId,
      Value<int>? vehicleId,
      Value<int?>? driverPersonId,
      Value<String?>? origin,
      Value<String?>? destination,
      Value<String?>? material,
      Value<double>? freightAmount,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return TripsCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      customerPersonId: customerPersonId ?? this.customerPersonId,
      vehicleId: vehicleId ?? this.vehicleId,
      driverPersonId: driverPersonId ?? this.driverPersonId,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      material: material ?? this.material,
      freightAmount: freightAmount ?? this.freightAmount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (customerPersonId.present) {
      map['customer_person_id'] = Variable<int>(customerPersonId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (driverPersonId.present) {
      map['driver_person_id'] = Variable<int>(driverPersonId.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (freightAmount.present) {
      map['freight_amount'] = Variable<double>(freightAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('customerPersonId: $customerPersonId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('driverPersonId: $driverPersonId, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('material: $material, ')
          ..write('freightAmount: $freightAmount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TruckDealsTable extends TruckDeals
    with TableInfo<$TruckDealsTable, TruckDeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TruckDealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
      'vehicle_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES vehicles (id)'));
  static const VerificationMeta _sellerPersonIdMeta =
      const VerificationMeta('sellerPersonId');
  @override
  late final GeneratedColumn<int> sellerPersonId = GeneratedColumn<int>(
      'seller_person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _dealTypeMeta =
      const VerificationMeta('dealType');
  @override
  late final GeneratedColumn<String> dealType = GeneratedColumn<String>(
      'deal_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _purchaseAmountMeta =
      const VerificationMeta('purchaseAmount');
  @override
  late final GeneratedColumn<double> purchaseAmount = GeneratedColumn<double>(
      'purchase_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Purchased'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyId,
        vehicleId,
        sellerPersonId,
        dealType,
        purchaseAmount,
        purchaseDate,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'truck_deals';
  @override
  VerificationContext validateIntegrity(Insertable<TruckDeal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('seller_person_id')) {
      context.handle(
          _sellerPersonIdMeta,
          sellerPersonId.isAcceptableOrUnknown(
              data['seller_person_id']!, _sellerPersonIdMeta));
    }
    if (data.containsKey('deal_type')) {
      context.handle(_dealTypeMeta,
          dealType.isAcceptableOrUnknown(data['deal_type']!, _dealTypeMeta));
    } else if (isInserting) {
      context.missing(_dealTypeMeta);
    }
    if (data.containsKey('purchase_amount')) {
      context.handle(
          _purchaseAmountMeta,
          purchaseAmount.isAcceptableOrUnknown(
              data['purchase_amount']!, _purchaseAmountMeta));
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TruckDeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TruckDeal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vehicle_id'])!,
      sellerPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seller_person_id']),
      dealType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deal_type'])!,
      purchaseAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}purchase_amount'])!,
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TruckDealsTable createAlias(String alias) {
    return $TruckDealsTable(attachedDatabase, alias);
  }
}

class TruckDeal extends DataClass implements Insertable<TruckDeal> {
  final int id;
  final int companyId;
  final int vehicleId;
  final int? sellerPersonId;
  final String dealType;
  final double purchaseAmount;
  final DateTime purchaseDate;
  final String status;
  final DateTime createdAt;
  const TruckDeal(
      {required this.id,
      required this.companyId,
      required this.vehicleId,
      this.sellerPersonId,
      required this.dealType,
      required this.purchaseAmount,
      required this.purchaseDate,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    map['vehicle_id'] = Variable<int>(vehicleId);
    if (!nullToAbsent || sellerPersonId != null) {
      map['seller_person_id'] = Variable<int>(sellerPersonId);
    }
    map['deal_type'] = Variable<String>(dealType);
    map['purchase_amount'] = Variable<double>(purchaseAmount);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TruckDealsCompanion toCompanion(bool nullToAbsent) {
    return TruckDealsCompanion(
      id: Value(id),
      companyId: Value(companyId),
      vehicleId: Value(vehicleId),
      sellerPersonId: sellerPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(sellerPersonId),
      dealType: Value(dealType),
      purchaseAmount: Value(purchaseAmount),
      purchaseDate: Value(purchaseDate),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory TruckDeal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TruckDeal(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['companyId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      sellerPersonId: serializer.fromJson<int?>(json['sellerPersonId']),
      dealType: serializer.fromJson<String>(json['dealType']),
      purchaseAmount: serializer.fromJson<double>(json['purchaseAmount']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int>(companyId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'sellerPersonId': serializer.toJson<int?>(sellerPersonId),
      'dealType': serializer.toJson<String>(dealType),
      'purchaseAmount': serializer.toJson<double>(purchaseAmount),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TruckDeal copyWith(
          {int? id,
          int? companyId,
          int? vehicleId,
          Value<int?> sellerPersonId = const Value.absent(),
          String? dealType,
          double? purchaseAmount,
          DateTime? purchaseDate,
          String? status,
          DateTime? createdAt}) =>
      TruckDeal(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        vehicleId: vehicleId ?? this.vehicleId,
        sellerPersonId:
            sellerPersonId.present ? sellerPersonId.value : this.sellerPersonId,
        dealType: dealType ?? this.dealType,
        purchaseAmount: purchaseAmount ?? this.purchaseAmount,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  TruckDeal copyWithCompanion(TruckDealsCompanion data) {
    return TruckDeal(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      sellerPersonId: data.sellerPersonId.present
          ? data.sellerPersonId.value
          : this.sellerPersonId,
      dealType: data.dealType.present ? data.dealType.value : this.dealType,
      purchaseAmount: data.purchaseAmount.present
          ? data.purchaseAmount.value
          : this.purchaseAmount,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TruckDeal(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('sellerPersonId: $sellerPersonId, ')
          ..write('dealType: $dealType, ')
          ..write('purchaseAmount: $purchaseAmount, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, companyId, vehicleId, sellerPersonId,
      dealType, purchaseAmount, purchaseDate, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TruckDeal &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.vehicleId == this.vehicleId &&
          other.sellerPersonId == this.sellerPersonId &&
          other.dealType == this.dealType &&
          other.purchaseAmount == this.purchaseAmount &&
          other.purchaseDate == this.purchaseDate &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class TruckDealsCompanion extends UpdateCompanion<TruckDeal> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<int> vehicleId;
  final Value<int?> sellerPersonId;
  final Value<String> dealType;
  final Value<double> purchaseAmount;
  final Value<DateTime> purchaseDate;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const TruckDealsCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.sellerPersonId = const Value.absent(),
    this.dealType = const Value.absent(),
    this.purchaseAmount = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TruckDealsCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    required int vehicleId,
    this.sellerPersonId = const Value.absent(),
    required String dealType,
    this.purchaseAmount = const Value.absent(),
    required DateTime purchaseDate,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : companyId = Value(companyId),
        vehicleId = Value(vehicleId),
        dealType = Value(dealType),
        purchaseDate = Value(purchaseDate);
  static Insertable<TruckDeal> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? vehicleId,
    Expression<int>? sellerPersonId,
    Expression<String>? dealType,
    Expression<double>? purchaseAmount,
    Expression<DateTime>? purchaseDate,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (sellerPersonId != null) 'seller_person_id': sellerPersonId,
      if (dealType != null) 'deal_type': dealType,
      if (purchaseAmount != null) 'purchase_amount': purchaseAmount,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TruckDealsCompanion copyWith(
      {Value<int>? id,
      Value<int>? companyId,
      Value<int>? vehicleId,
      Value<int?>? sellerPersonId,
      Value<String>? dealType,
      Value<double>? purchaseAmount,
      Value<DateTime>? purchaseDate,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return TruckDealsCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      vehicleId: vehicleId ?? this.vehicleId,
      sellerPersonId: sellerPersonId ?? this.sellerPersonId,
      dealType: dealType ?? this.dealType,
      purchaseAmount: purchaseAmount ?? this.purchaseAmount,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (sellerPersonId.present) {
      map['seller_person_id'] = Variable<int>(sellerPersonId.value);
    }
    if (dealType.present) {
      map['deal_type'] = Variable<String>(dealType.value);
    }
    if (purchaseAmount.present) {
      map['purchase_amount'] = Variable<double>(purchaseAmount.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TruckDealsCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('sellerPersonId: $sellerPersonId, ')
          ..write('dealType: $dealType, ')
          ..write('purchaseAmount: $purchaseAmount, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transaction_categories (id)'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
      'vehicle_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES vehicles (id)'));
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<int> tripId = GeneratedColumn<int>(
      'trip_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trips (id)'));
  static const VerificationMeta _dealIdMeta = const VerificationMeta('dealId');
  @override
  late final GeneratedColumn<int> dealId = GeneratedColumn<int>(
      'deal_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES truck_deals (id)'));
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES payment_accounts (id)'));
  static const VerificationMeta _componentIdMeta =
      const VerificationMeta('componentId');
  @override
  late final GeneratedColumn<int> componentId = GeneratedColumn<int>(
      'component_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vehicle_components (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Cash'));
  static const VerificationMeta _referenceNoMeta =
      const VerificationMeta('referenceNo');
  @override
  late final GeneratedColumn<String> referenceNo = GeneratedColumn<String>(
      'reference_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Owner'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedByMeta =
      const VerificationMeta('updatedBy');
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
      'updated_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _reversalOfTransactionIdMeta =
      const VerificationMeta('reversalOfTransactionId');
  @override
  late final GeneratedColumn<int> reversalOfTransactionId =
      GeneratedColumn<int>('reversal_of_transaction_id', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyId,
        categoryId,
        personId,
        vehicleId,
        tripId,
        dealId,
        accountId,
        componentId,
        date,
        amount,
        direction,
        paymentMethod,
        referenceNo,
        notes,
        createdBy,
        createdAt,
        updatedBy,
        updatedAt,
        isDeleted,
        reversalOfTransactionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    }
    if (data.containsKey('deal_id')) {
      context.handle(_dealIdMeta,
          dealId.isAcceptableOrUnknown(data['deal_id']!, _dealIdMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    }
    if (data.containsKey('component_id')) {
      context.handle(
          _componentIdMeta,
          componentId.isAcceptableOrUnknown(
              data['component_id']!, _componentIdMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('reference_no')) {
      context.handle(
          _referenceNoMeta,
          referenceNo.isAcceptableOrUnknown(
              data['reference_no']!, _referenceNoMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('reversal_of_transaction_id')) {
      context.handle(
          _reversalOfTransactionIdMeta,
          reversalOfTransactionId.isAcceptableOrUnknown(
              data['reversal_of_transaction_id']!,
              _reversalOfTransactionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id']),
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vehicle_id']),
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trip_id']),
      dealId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deal_id']),
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id']),
      componentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}component_id']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      referenceNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_no']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_by']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      reversalOfTransactionId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}reversal_of_transaction_id']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final int companyId;
  final int categoryId;
  final int? personId;
  final int? vehicleId;
  final int? tripId;
  final int? dealId;
  final int? accountId;
  final int? componentId;
  final DateTime date;
  final double amount;
  final String direction;
  final String paymentMethod;
  final String? referenceNo;
  final String? notes;
  final String createdBy;
  final DateTime createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;
  final bool isDeleted;
  final int? reversalOfTransactionId;
  const Transaction(
      {required this.id,
      required this.companyId,
      required this.categoryId,
      this.personId,
      this.vehicleId,
      this.tripId,
      this.dealId,
      this.accountId,
      this.componentId,
      required this.date,
      required this.amount,
      required this.direction,
      required this.paymentMethod,
      this.referenceNo,
      this.notes,
      required this.createdBy,
      required this.createdAt,
      this.updatedBy,
      this.updatedAt,
      required this.isDeleted,
      this.reversalOfTransactionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<int>(personId);
    }
    if (!nullToAbsent || vehicleId != null) {
      map['vehicle_id'] = Variable<int>(vehicleId);
    }
    if (!nullToAbsent || tripId != null) {
      map['trip_id'] = Variable<int>(tripId);
    }
    if (!nullToAbsent || dealId != null) {
      map['deal_id'] = Variable<int>(dealId);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<int>(accountId);
    }
    if (!nullToAbsent || componentId != null) {
      map['component_id'] = Variable<int>(componentId);
    }
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    map['direction'] = Variable<String>(direction);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || referenceNo != null) {
      map['reference_no'] = Variable<String>(referenceNo);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_by'] = Variable<String>(createdBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || reversalOfTransactionId != null) {
      map['reversal_of_transaction_id'] =
          Variable<int>(reversalOfTransactionId);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      companyId: Value(companyId),
      categoryId: Value(categoryId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      vehicleId: vehicleId == null && nullToAbsent
          ? const Value.absent()
          : Value(vehicleId),
      tripId:
          tripId == null && nullToAbsent ? const Value.absent() : Value(tripId),
      dealId:
          dealId == null && nullToAbsent ? const Value.absent() : Value(dealId),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      componentId: componentId == null && nullToAbsent
          ? const Value.absent()
          : Value(componentId),
      date: Value(date),
      amount: Value(amount),
      direction: Value(direction),
      paymentMethod: Value(paymentMethod),
      referenceNo: referenceNo == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNo),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdBy: Value(createdBy),
      createdAt: Value(createdAt),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isDeleted: Value(isDeleted),
      reversalOfTransactionId: reversalOfTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(reversalOfTransactionId),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['companyId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      personId: serializer.fromJson<int?>(json['personId']),
      vehicleId: serializer.fromJson<int?>(json['vehicleId']),
      tripId: serializer.fromJson<int?>(json['tripId']),
      dealId: serializer.fromJson<int?>(json['dealId']),
      accountId: serializer.fromJson<int?>(json['accountId']),
      componentId: serializer.fromJson<int?>(json['componentId']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
      direction: serializer.fromJson<String>(json['direction']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      referenceNo: serializer.fromJson<String?>(json['referenceNo']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      reversalOfTransactionId:
          serializer.fromJson<int?>(json['reversalOfTransactionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int>(companyId),
      'categoryId': serializer.toJson<int>(categoryId),
      'personId': serializer.toJson<int?>(personId),
      'vehicleId': serializer.toJson<int?>(vehicleId),
      'tripId': serializer.toJson<int?>(tripId),
      'dealId': serializer.toJson<int?>(dealId),
      'accountId': serializer.toJson<int?>(accountId),
      'componentId': serializer.toJson<int?>(componentId),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
      'direction': serializer.toJson<String>(direction),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'referenceNo': serializer.toJson<String?>(referenceNo),
      'notes': serializer.toJson<String?>(notes),
      'createdBy': serializer.toJson<String>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'reversalOfTransactionId':
          serializer.toJson<int?>(reversalOfTransactionId),
    };
  }

  Transaction copyWith(
          {int? id,
          int? companyId,
          int? categoryId,
          Value<int?> personId = const Value.absent(),
          Value<int?> vehicleId = const Value.absent(),
          Value<int?> tripId = const Value.absent(),
          Value<int?> dealId = const Value.absent(),
          Value<int?> accountId = const Value.absent(),
          Value<int?> componentId = const Value.absent(),
          DateTime? date,
          double? amount,
          String? direction,
          String? paymentMethod,
          Value<String?> referenceNo = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          String? createdBy,
          DateTime? createdAt,
          Value<String?> updatedBy = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isDeleted,
          Value<int?> reversalOfTransactionId = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        categoryId: categoryId ?? this.categoryId,
        personId: personId.present ? personId.value : this.personId,
        vehicleId: vehicleId.present ? vehicleId.value : this.vehicleId,
        tripId: tripId.present ? tripId.value : this.tripId,
        dealId: dealId.present ? dealId.value : this.dealId,
        accountId: accountId.present ? accountId.value : this.accountId,
        componentId: componentId.present ? componentId.value : this.componentId,
        date: date ?? this.date,
        amount: amount ?? this.amount,
        direction: direction ?? this.direction,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        referenceNo: referenceNo.present ? referenceNo.value : this.referenceNo,
        notes: notes.present ? notes.value : this.notes,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        reversalOfTransactionId: reversalOfTransactionId.present
            ? reversalOfTransactionId.value
            : this.reversalOfTransactionId,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      personId: data.personId.present ? data.personId.value : this.personId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      dealId: data.dealId.present ? data.dealId.value : this.dealId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      componentId:
          data.componentId.present ? data.componentId.value : this.componentId,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
      direction: data.direction.present ? data.direction.value : this.direction,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      referenceNo:
          data.referenceNo.present ? data.referenceNo.value : this.referenceNo,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      reversalOfTransactionId: data.reversalOfTransactionId.present
          ? data.reversalOfTransactionId.value
          : this.reversalOfTransactionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('categoryId: $categoryId, ')
          ..write('personId: $personId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('tripId: $tripId, ')
          ..write('dealId: $dealId, ')
          ..write('accountId: $accountId, ')
          ..write('componentId: $componentId, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('direction: $direction, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNo: $referenceNo, ')
          ..write('notes: $notes, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('reversalOfTransactionId: $reversalOfTransactionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        companyId,
        categoryId,
        personId,
        vehicleId,
        tripId,
        dealId,
        accountId,
        componentId,
        date,
        amount,
        direction,
        paymentMethod,
        referenceNo,
        notes,
        createdBy,
        createdAt,
        updatedBy,
        updatedAt,
        isDeleted,
        reversalOfTransactionId
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.categoryId == this.categoryId &&
          other.personId == this.personId &&
          other.vehicleId == this.vehicleId &&
          other.tripId == this.tripId &&
          other.dealId == this.dealId &&
          other.accountId == this.accountId &&
          other.componentId == this.componentId &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.direction == this.direction &&
          other.paymentMethod == this.paymentMethod &&
          other.referenceNo == this.referenceNo &&
          other.notes == this.notes &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedBy == this.updatedBy &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.reversalOfTransactionId == this.reversalOfTransactionId);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<int> categoryId;
  final Value<int?> personId;
  final Value<int?> vehicleId;
  final Value<int?> tripId;
  final Value<int?> dealId;
  final Value<int?> accountId;
  final Value<int?> componentId;
  final Value<DateTime> date;
  final Value<double> amount;
  final Value<String> direction;
  final Value<String> paymentMethod;
  final Value<String?> referenceNo;
  final Value<String?> notes;
  final Value<String> createdBy;
  final Value<DateTime> createdAt;
  final Value<String?> updatedBy;
  final Value<DateTime?> updatedAt;
  final Value<bool> isDeleted;
  final Value<int?> reversalOfTransactionId;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.personId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.tripId = const Value.absent(),
    this.dealId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.componentId = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.direction = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.referenceNo = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.reversalOfTransactionId = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    required int categoryId,
    this.personId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.tripId = const Value.absent(),
    this.dealId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.componentId = const Value.absent(),
    required DateTime date,
    required double amount,
    required String direction,
    this.paymentMethod = const Value.absent(),
    this.referenceNo = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.reversalOfTransactionId = const Value.absent(),
  })  : companyId = Value(companyId),
        categoryId = Value(categoryId),
        date = Value(date),
        amount = Value(amount),
        direction = Value(direction);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? categoryId,
    Expression<int>? personId,
    Expression<int>? vehicleId,
    Expression<int>? tripId,
    Expression<int>? dealId,
    Expression<int>? accountId,
    Expression<int>? componentId,
    Expression<DateTime>? date,
    Expression<double>? amount,
    Expression<String>? direction,
    Expression<String>? paymentMethod,
    Expression<String>? referenceNo,
    Expression<String>? notes,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<String>? updatedBy,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? reversalOfTransactionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (categoryId != null) 'category_id': categoryId,
      if (personId != null) 'person_id': personId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (tripId != null) 'trip_id': tripId,
      if (dealId != null) 'deal_id': dealId,
      if (accountId != null) 'account_id': accountId,
      if (componentId != null) 'component_id': componentId,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (direction != null) 'direction': direction,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (referenceNo != null) 'reference_no': referenceNo,
      if (notes != null) 'notes': notes,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (reversalOfTransactionId != null)
        'reversal_of_transaction_id': reversalOfTransactionId,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? companyId,
      Value<int>? categoryId,
      Value<int?>? personId,
      Value<int?>? vehicleId,
      Value<int?>? tripId,
      Value<int?>? dealId,
      Value<int?>? accountId,
      Value<int?>? componentId,
      Value<DateTime>? date,
      Value<double>? amount,
      Value<String>? direction,
      Value<String>? paymentMethod,
      Value<String?>? referenceNo,
      Value<String?>? notes,
      Value<String>? createdBy,
      Value<DateTime>? createdAt,
      Value<String?>? updatedBy,
      Value<DateTime?>? updatedAt,
      Value<bool>? isDeleted,
      Value<int?>? reversalOfTransactionId}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      categoryId: categoryId ?? this.categoryId,
      personId: personId ?? this.personId,
      vehicleId: vehicleId ?? this.vehicleId,
      tripId: tripId ?? this.tripId,
      dealId: dealId ?? this.dealId,
      accountId: accountId ?? this.accountId,
      componentId: componentId ?? this.componentId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      direction: direction ?? this.direction,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      referenceNo: referenceNo ?? this.referenceNo,
      notes: notes ?? this.notes,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      reversalOfTransactionId:
          reversalOfTransactionId ?? this.reversalOfTransactionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<int>(tripId.value);
    }
    if (dealId.present) {
      map['deal_id'] = Variable<int>(dealId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (componentId.present) {
      map['component_id'] = Variable<int>(componentId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (referenceNo.present) {
      map['reference_no'] = Variable<String>(referenceNo.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (reversalOfTransactionId.present) {
      map['reversal_of_transaction_id'] =
          Variable<int>(reversalOfTransactionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('categoryId: $categoryId, ')
          ..write('personId: $personId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('tripId: $tripId, ')
          ..write('dealId: $dealId, ')
          ..write('accountId: $accountId, ')
          ..write('componentId: $componentId, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('direction: $direction, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNo: $referenceNo, ')
          ..write('notes: $notes, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('reversalOfTransactionId: $reversalOfTransactionId')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oldValueJsonMeta =
      const VerificationMeta('oldValueJson');
  @override
  late final GeneratedColumn<String> oldValueJson = GeneratedColumn<String>(
      'old_value_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _newValueJsonMeta =
      const VerificationMeta('newValueJson');
  @override
  late final GeneratedColumn<String> newValueJson = GeneratedColumn<String>(
      'new_value_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionId,
        action,
        oldValueJson,
        newValueJson,
        userId,
        timestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(Insertable<AuditLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('old_value_json')) {
      context.handle(
          _oldValueJsonMeta,
          oldValueJson.isAcceptableOrUnknown(
              data['old_value_json']!, _oldValueJsonMeta));
    }
    if (data.containsKey('new_value_json')) {
      context.handle(
          _newValueJsonMeta,
          newValueJson.isAcceptableOrUnknown(
              data['new_value_json']!, _newValueJsonMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id']),
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      oldValueJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}old_value_json']),
      newValueJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}new_value_json']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final int id;
  final int? transactionId;
  final String action;
  final String? oldValueJson;
  final String? newValueJson;
  final String userId;
  final DateTime timestamp;
  const AuditLog(
      {required this.id,
      this.transactionId,
      required this.action,
      this.oldValueJson,
      this.newValueJson,
      required this.userId,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<int>(transactionId);
    }
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || oldValueJson != null) {
      map['old_value_json'] = Variable<String>(oldValueJson);
    }
    if (!nullToAbsent || newValueJson != null) {
      map['new_value_json'] = Variable<String>(newValueJson);
    }
    map['user_id'] = Variable<String>(userId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      action: Value(action),
      oldValueJson: oldValueJson == null && nullToAbsent
          ? const Value.absent()
          : Value(oldValueJson),
      newValueJson: newValueJson == null && nullToAbsent
          ? const Value.absent()
          : Value(newValueJson),
      userId: Value(userId),
      timestamp: Value(timestamp),
    );
  }

  factory AuditLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int?>(json['transactionId']),
      action: serializer.fromJson<String>(json['action']),
      oldValueJson: serializer.fromJson<String?>(json['oldValueJson']),
      newValueJson: serializer.fromJson<String?>(json['newValueJson']),
      userId: serializer.fromJson<String>(json['userId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int?>(transactionId),
      'action': serializer.toJson<String>(action),
      'oldValueJson': serializer.toJson<String?>(oldValueJson),
      'newValueJson': serializer.toJson<String?>(newValueJson),
      'userId': serializer.toJson<String>(userId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  AuditLog copyWith(
          {int? id,
          Value<int?> transactionId = const Value.absent(),
          String? action,
          Value<String?> oldValueJson = const Value.absent(),
          Value<String?> newValueJson = const Value.absent(),
          String? userId,
          DateTime? timestamp}) =>
      AuditLog(
        id: id ?? this.id,
        transactionId:
            transactionId.present ? transactionId.value : this.transactionId,
        action: action ?? this.action,
        oldValueJson:
            oldValueJson.present ? oldValueJson.value : this.oldValueJson,
        newValueJson:
            newValueJson.present ? newValueJson.value : this.newValueJson,
        userId: userId ?? this.userId,
        timestamp: timestamp ?? this.timestamp,
      );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      action: data.action.present ? data.action.value : this.action,
      oldValueJson: data.oldValueJson.present
          ? data.oldValueJson.value
          : this.oldValueJson,
      newValueJson: data.newValueJson.present
          ? data.newValueJson.value
          : this.newValueJson,
      userId: data.userId.present ? data.userId.value : this.userId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('action: $action, ')
          ..write('oldValueJson: $oldValueJson, ')
          ..write('newValueJson: $newValueJson, ')
          ..write('userId: $userId, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, transactionId, action, oldValueJson, newValueJson, userId, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.action == this.action &&
          other.oldValueJson == this.oldValueJson &&
          other.newValueJson == this.newValueJson &&
          other.userId == this.userId &&
          other.timestamp == this.timestamp);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<int> id;
  final Value<int?> transactionId;
  final Value<String> action;
  final Value<String?> oldValueJson;
  final Value<String?> newValueJson;
  final Value<String> userId;
  final Value<DateTime> timestamp;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.action = const Value.absent(),
    this.oldValueJson = const Value.absent(),
    this.newValueJson = const Value.absent(),
    this.userId = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    required String action,
    this.oldValueJson = const Value.absent(),
    this.newValueJson = const Value.absent(),
    required String userId,
    this.timestamp = const Value.absent(),
  })  : action = Value(action),
        userId = Value(userId);
  static Insertable<AuditLog> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<String>? action,
    Expression<String>? oldValueJson,
    Expression<String>? newValueJson,
    Expression<String>? userId,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (action != null) 'action': action,
      if (oldValueJson != null) 'old_value_json': oldValueJson,
      if (newValueJson != null) 'new_value_json': newValueJson,
      if (userId != null) 'user_id': userId,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  AuditLogsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? transactionId,
      Value<String>? action,
      Value<String?>? oldValueJson,
      Value<String?>? newValueJson,
      Value<String>? userId,
      Value<DateTime>? timestamp}) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      action: action ?? this.action,
      oldValueJson: oldValueJson ?? this.oldValueJson,
      newValueJson: newValueJson ?? this.newValueJson,
      userId: userId ?? this.userId,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (oldValueJson.present) {
      map['old_value_json'] = Variable<String>(oldValueJson.value);
    }
    if (newValueJson.present) {
      map['new_value_json'] = Variable<String>(newValueJson.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('action: $action, ')
          ..write('oldValueJson: $oldValueJson, ')
          ..write('newValueJson: $newValueJson, ')
          ..write('userId: $userId, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES transactions (id)'));
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
      'vehicle_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES vehicles (id)'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES people (id)'));
  static const VerificationMeta _fileUrlMeta =
      const VerificationMeta('fileUrl');
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
      'file_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileTypeMeta =
      const VerificationMeta('fileType');
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
      'file_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Image'));
  static const VerificationMeta _uploadedByMeta =
      const VerificationMeta('uploadedBy');
  @override
  late final GeneratedColumn<String> uploadedBy = GeneratedColumn<String>(
      'uploaded_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Owner'));
  static const VerificationMeta _uploadedAtMeta =
      const VerificationMeta('uploadedAt');
  @override
  late final GeneratedColumn<DateTime> uploadedAt = GeneratedColumn<DateTime>(
      'uploaded_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionId,
        vehicleId,
        personId,
        fileUrl,
        fileType,
        uploadedBy,
        uploadedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(Insertable<Attachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    }
    if (data.containsKey('file_url')) {
      context.handle(_fileUrlMeta,
          fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta));
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(_fileTypeMeta,
          fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta));
    }
    if (data.containsKey('uploaded_by')) {
      context.handle(
          _uploadedByMeta,
          uploadedBy.isAcceptableOrUnknown(
              data['uploaded_by']!, _uploadedByMeta));
    }
    if (data.containsKey('uploaded_at')) {
      context.handle(
          _uploadedAtMeta,
          uploadedAt.isAcceptableOrUnknown(
              data['uploaded_at']!, _uploadedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id']),
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vehicle_id']),
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id']),
      fileUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_url'])!,
      fileType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_type'])!,
      uploadedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploaded_by'])!,
      uploadedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}uploaded_at'])!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final int id;
  final int? transactionId;
  final int? vehicleId;
  final int? personId;
  final String fileUrl;
  final String fileType;
  final String uploadedBy;
  final DateTime uploadedAt;
  const Attachment(
      {required this.id,
      this.transactionId,
      this.vehicleId,
      this.personId,
      required this.fileUrl,
      required this.fileType,
      required this.uploadedBy,
      required this.uploadedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<int>(transactionId);
    }
    if (!nullToAbsent || vehicleId != null) {
      map['vehicle_id'] = Variable<int>(vehicleId);
    }
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<int>(personId);
    }
    map['file_url'] = Variable<String>(fileUrl);
    map['file_type'] = Variable<String>(fileType);
    map['uploaded_by'] = Variable<String>(uploadedBy);
    map['uploaded_at'] = Variable<DateTime>(uploadedAt);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      vehicleId: vehicleId == null && nullToAbsent
          ? const Value.absent()
          : Value(vehicleId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      fileUrl: Value(fileUrl),
      fileType: Value(fileType),
      uploadedBy: Value(uploadedBy),
      uploadedAt: Value(uploadedAt),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int?>(json['transactionId']),
      vehicleId: serializer.fromJson<int?>(json['vehicleId']),
      personId: serializer.fromJson<int?>(json['personId']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      fileType: serializer.fromJson<String>(json['fileType']),
      uploadedBy: serializer.fromJson<String>(json['uploadedBy']),
      uploadedAt: serializer.fromJson<DateTime>(json['uploadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int?>(transactionId),
      'vehicleId': serializer.toJson<int?>(vehicleId),
      'personId': serializer.toJson<int?>(personId),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'fileType': serializer.toJson<String>(fileType),
      'uploadedBy': serializer.toJson<String>(uploadedBy),
      'uploadedAt': serializer.toJson<DateTime>(uploadedAt),
    };
  }

  Attachment copyWith(
          {int? id,
          Value<int?> transactionId = const Value.absent(),
          Value<int?> vehicleId = const Value.absent(),
          Value<int?> personId = const Value.absent(),
          String? fileUrl,
          String? fileType,
          String? uploadedBy,
          DateTime? uploadedAt}) =>
      Attachment(
        id: id ?? this.id,
        transactionId:
            transactionId.present ? transactionId.value : this.transactionId,
        vehicleId: vehicleId.present ? vehicleId.value : this.vehicleId,
        personId: personId.present ? personId.value : this.personId,
        fileUrl: fileUrl ?? this.fileUrl,
        fileType: fileType ?? this.fileType,
        uploadedBy: uploadedBy ?? this.uploadedBy,
        uploadedAt: uploadedAt ?? this.uploadedAt,
      );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      personId: data.personId.present ? data.personId.value : this.personId,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      uploadedBy:
          data.uploadedBy.present ? data.uploadedBy.value : this.uploadedBy,
      uploadedAt:
          data.uploadedAt.present ? data.uploadedAt.value : this.uploadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('personId: $personId, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('fileType: $fileType, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('uploadedAt: $uploadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, transactionId, vehicleId, personId,
      fileUrl, fileType, uploadedBy, uploadedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.vehicleId == this.vehicleId &&
          other.personId == this.personId &&
          other.fileUrl == this.fileUrl &&
          other.fileType == this.fileType &&
          other.uploadedBy == this.uploadedBy &&
          other.uploadedAt == this.uploadedAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<int> id;
  final Value<int?> transactionId;
  final Value<int?> vehicleId;
  final Value<int?> personId;
  final Value<String> fileUrl;
  final Value<String> fileType;
  final Value<String> uploadedBy;
  final Value<DateTime> uploadedAt;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.personId = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.fileType = const Value.absent(),
    this.uploadedBy = const Value.absent(),
    this.uploadedAt = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.personId = const Value.absent(),
    required String fileUrl,
    this.fileType = const Value.absent(),
    this.uploadedBy = const Value.absent(),
    this.uploadedAt = const Value.absent(),
  }) : fileUrl = Value(fileUrl);
  static Insertable<Attachment> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<int>? vehicleId,
    Expression<int>? personId,
    Expression<String>? fileUrl,
    Expression<String>? fileType,
    Expression<String>? uploadedBy,
    Expression<DateTime>? uploadedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (personId != null) 'person_id': personId,
      if (fileUrl != null) 'file_url': fileUrl,
      if (fileType != null) 'file_type': fileType,
      if (uploadedBy != null) 'uploaded_by': uploadedBy,
      if (uploadedAt != null) 'uploaded_at': uploadedAt,
    });
  }

  AttachmentsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? transactionId,
      Value<int?>? vehicleId,
      Value<int?>? personId,
      Value<String>? fileUrl,
      Value<String>? fileType,
      Value<String>? uploadedBy,
      Value<DateTime>? uploadedAt}) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      vehicleId: vehicleId ?? this.vehicleId,
      personId: personId ?? this.personId,
      fileUrl: fileUrl ?? this.fileUrl,
      fileType: fileType ?? this.fileType,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (uploadedBy.present) {
      map['uploaded_by'] = Variable<String>(uploadedBy.value);
    }
    if (uploadedAt.present) {
      map['uploaded_at'] = Variable<DateTime>(uploadedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('personId: $personId, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('fileType: $fileType, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('uploadedAt: $uploadedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CompaniesTable companies = $CompaniesTable(this);
  late final $PeopleTable people = $PeopleTable(this);
  late final $PersonRolesTable personRoles = $PersonRolesTable(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $VehicleComponentsTable vehicleComponents =
      $VehicleComponentsTable(this);
  late final $TransactionCategoriesTable transactionCategories =
      $TransactionCategoriesTable(this);
  late final $PaymentAccountsTable paymentAccounts =
      $PaymentAccountsTable(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $TruckDealsTable truckDeals = $TruckDealsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        companies,
        people,
        personRoles,
        vehicles,
        vehicleComponents,
        transactionCategories,
        paymentAccounts,
        trips,
        truckDeals,
        transactions,
        auditLogs,
        attachments
      ];
}

typedef $$CompaniesTableCreateCompanionBuilder = CompaniesCompanion Function({
  Value<int> id,
  required String name,
  required String businessType,
  Value<String> defaultCurrency,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});
typedef $$CompaniesTableUpdateCompanionBuilder = CompaniesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> businessType,
  Value<String> defaultCurrency,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});

final class $$CompaniesTableReferences
    extends BaseReferences<_$AppDatabase, $CompaniesTable, Company> {
  $$CompaniesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PersonRolesTable, List<PersonRole>>
      _personRolesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.personRoles,
          aliasName:
              $_aliasNameGenerator(db.companies.id, db.personRoles.companyId));

  $$PersonRolesTableProcessedTableManager get personRolesRefs {
    final manager = $$PersonRolesTableTableManager($_db, $_db.personRoles)
        .filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_personRolesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$VehiclesTable, List<Vehicle>> _vehiclesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.vehicles,
          aliasName:
              $_aliasNameGenerator(db.companies.id, db.vehicles.companyId));

  $$VehiclesTableProcessedTableManager get vehiclesRefs {
    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vehiclesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionCategoriesTable,
      List<TransactionCategory>> _transactionCategoriesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionCategories,
          aliasName: $_aliasNameGenerator(
              db.companies.id, db.transactionCategories.scopeCompanyId));

  $$TransactionCategoriesTableProcessedTableManager
      get transactionCategoriesRefs {
    final manager = $$TransactionCategoriesTableTableManager(
            $_db, $_db.transactionCategories)
        .filter((f) => f.scopeCompanyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_transactionCategoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TripsTable, List<Trip>> _tripsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.trips,
          aliasName: $_aliasNameGenerator(db.companies.id, db.trips.companyId));

  $$TripsTableProcessedTableManager get tripsRefs {
    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tripsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TruckDealsTable, List<TruckDeal>>
      _truckDealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.truckDeals,
          aliasName:
              $_aliasNameGenerator(db.companies.id, db.truckDeals.companyId));

  $$TruckDealsTableProcessedTableManager get truckDealsRefs {
    final manager = $$TruckDealsTableTableManager($_db, $_db.truckDeals)
        .filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_truckDealsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName:
              $_aliasNameGenerator(db.companies.id, db.transactions.companyId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CompaniesTableFilterComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessType => $composableBuilder(
      column: $table.businessType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get defaultCurrency => $composableBuilder(
      column: $table.defaultCurrency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> personRolesRefs(
      Expression<bool> Function($$PersonRolesTableFilterComposer f) f) {
    final $$PersonRolesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personRoles,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonRolesTableFilterComposer(
              $db: $db,
              $table: $db.personRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> vehiclesRefs(
      Expression<bool> Function($$VehiclesTableFilterComposer f) f) {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionCategoriesRefs(
      Expression<bool> Function($$TransactionCategoriesTableFilterComposer f)
          f) {
    final $$TransactionCategoriesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionCategories,
            getReferencedColumn: (t) => t.scopeCompanyId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionCategoriesTableFilterComposer(
                  $db: $db,
                  $table: $db.transactionCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> tripsRefs(
      Expression<bool> Function($$TripsTableFilterComposer f) f) {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> truckDealsRefs(
      Expression<bool> Function($$TruckDealsTableFilterComposer f) f) {
    final $$TruckDealsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableFilterComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CompaniesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessType => $composableBuilder(
      column: $table.businessType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get defaultCurrency => $composableBuilder(
      column: $table.defaultCurrency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CompaniesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get businessType => $composableBuilder(
      column: $table.businessType, builder: (column) => column);

  GeneratedColumn<String> get defaultCurrency => $composableBuilder(
      column: $table.defaultCurrency, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> personRolesRefs<T extends Object>(
      Expression<T> Function($$PersonRolesTableAnnotationComposer a) f) {
    final $$PersonRolesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personRoles,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonRolesTableAnnotationComposer(
              $db: $db,
              $table: $db.personRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> vehiclesRefs<T extends Object>(
      Expression<T> Function($$VehiclesTableAnnotationComposer a) f) {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionCategoriesRefs<T extends Object>(
      Expression<T> Function($$TransactionCategoriesTableAnnotationComposer a)
          f) {
    final $$TransactionCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionCategories,
            getReferencedColumn: (t) => t.scopeCompanyId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tripsRefs<T extends Object>(
      Expression<T> Function($$TripsTableAnnotationComposer a) f) {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> truckDealsRefs<T extends Object>(
      Expression<T> Function($$TruckDealsTableAnnotationComposer a) f) {
    final $$TruckDealsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableAnnotationComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.companyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CompaniesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CompaniesTable,
    Company,
    $$CompaniesTableFilterComposer,
    $$CompaniesTableOrderingComposer,
    $$CompaniesTableAnnotationComposer,
    $$CompaniesTableCreateCompanionBuilder,
    $$CompaniesTableUpdateCompanionBuilder,
    (Company, $$CompaniesTableReferences),
    Company,
    PrefetchHooks Function(
        {bool personRolesRefs,
        bool vehiclesRefs,
        bool transactionCategoriesRefs,
        bool tripsRefs,
        bool truckDealsRefs,
        bool transactionsRefs})> {
  $$CompaniesTableTableManager(_$AppDatabase db, $CompaniesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompaniesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompaniesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompaniesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> businessType = const Value.absent(),
            Value<String> defaultCurrency = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CompaniesCompanion(
            id: id,
            name: name,
            businessType: businessType,
            defaultCurrency: defaultCurrency,
            isActive: isActive,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String businessType,
            Value<String> defaultCurrency = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CompaniesCompanion.insert(
            id: id,
            name: name,
            businessType: businessType,
            defaultCurrency: defaultCurrency,
            isActive: isActive,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CompaniesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {personRolesRefs = false,
              vehiclesRefs = false,
              transactionCategoriesRefs = false,
              tripsRefs = false,
              truckDealsRefs = false,
              transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (personRolesRefs) db.personRoles,
                if (vehiclesRefs) db.vehicles,
                if (transactionCategoriesRefs) db.transactionCategories,
                if (tripsRefs) db.trips,
                if (truckDealsRefs) db.truckDeals,
                if (transactionsRefs) db.transactions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (personRolesRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable,
                            PersonRole>(
                        currentTable: table,
                        referencedTable: $$CompaniesTableReferences
                            ._personRolesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompaniesTableReferences(db, table, p0)
                                .personRolesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.companyId == item.id),
                        typedResults: items),
                  if (vehiclesRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable,
                            Vehicle>(
                        currentTable: table,
                        referencedTable:
                            $$CompaniesTableReferences._vehiclesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompaniesTableReferences(db, table, p0)
                                .vehiclesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.companyId == item.id),
                        typedResults: items),
                  if (transactionCategoriesRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable,
                            TransactionCategory>(
                        currentTable: table,
                        referencedTable: $$CompaniesTableReferences
                            ._transactionCategoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompaniesTableReferences(db, table, p0)
                                .transactionCategoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.scopeCompanyId == item.id),
                        typedResults: items),
                  if (tripsRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable, Trip>(
                        currentTable: table,
                        referencedTable:
                            $$CompaniesTableReferences._tripsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompaniesTableReferences(db, table, p0).tripsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.companyId == item.id),
                        typedResults: items),
                  if (truckDealsRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable,
                            TruckDeal>(
                        currentTable: table,
                        referencedTable:
                            $$CompaniesTableReferences._truckDealsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompaniesTableReferences(db, table, p0)
                                .truckDealsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.companyId == item.id),
                        typedResults: items),
                  if (transactionsRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable,
                            Transaction>(
                        currentTable: table,
                        referencedTable: $$CompaniesTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompaniesTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.companyId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CompaniesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CompaniesTable,
    Company,
    $$CompaniesTableFilterComposer,
    $$CompaniesTableOrderingComposer,
    $$CompaniesTableAnnotationComposer,
    $$CompaniesTableCreateCompanionBuilder,
    $$CompaniesTableUpdateCompanionBuilder,
    (Company, $$CompaniesTableReferences),
    Company,
    PrefetchHooks Function(
        {bool personRolesRefs,
        bool vehiclesRefs,
        bool transactionCategoriesRefs,
        bool tripsRefs,
        bool truckDealsRefs,
        bool transactionsRefs})>;
typedef $$PeopleTableCreateCompanionBuilder = PeopleCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phone,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});
typedef $$PeopleTableUpdateCompanionBuilder = PeopleCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});

final class $$PeopleTableReferences
    extends BaseReferences<_$AppDatabase, $PeopleTable, PeopleData> {
  $$PeopleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PersonRolesTable, List<PersonRole>>
      _personRolesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.personRoles,
              aliasName:
                  $_aliasNameGenerator(db.people.id, db.personRoles.personId));

  $$PersonRolesTableProcessedTableManager get personRolesRefs {
    final manager = $$PersonRolesTableTableManager($_db, $_db.personRoles)
        .filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_personRolesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$VehiclesTable, List<Vehicle>> _vehiclesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.vehicles,
          aliasName:
              $_aliasNameGenerator(db.people.id, db.vehicles.ownerPersonId));

  $$VehiclesTableProcessedTableManager get vehiclesRefs {
    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.ownerPersonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vehiclesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TruckDealsTable, List<TruckDeal>>
      _truckDealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.truckDeals,
          aliasName:
              $_aliasNameGenerator(db.people.id, db.truckDeals.sellerPersonId));

  $$TruckDealsTableProcessedTableManager get truckDealsRefs {
    final manager = $$TruckDealsTableTableManager($_db, $_db.truckDeals)
        .filter((f) => f.sellerPersonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_truckDealsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName:
                  $_aliasNameGenerator(db.people.id, db.transactions.personId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AttachmentsTable, List<Attachment>>
      _attachmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.attachments,
              aliasName:
                  $_aliasNameGenerator(db.people.id, db.attachments.personId));

  $$AttachmentsTableProcessedTableManager get attachmentsRefs {
    final manager = $$AttachmentsTableTableManager($_db, $_db.attachments)
        .filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PeopleTableFilterComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> personRolesRefs(
      Expression<bool> Function($$PersonRolesTableFilterComposer f) f) {
    final $$PersonRolesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personRoles,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonRolesTableFilterComposer(
              $db: $db,
              $table: $db.personRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> vehiclesRefs(
      Expression<bool> Function($$VehiclesTableFilterComposer f) f) {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.ownerPersonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> truckDealsRefs(
      Expression<bool> Function($$TruckDealsTableFilterComposer f) f) {
    final $$TruckDealsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.sellerPersonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableFilterComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> attachmentsRefs(
      Expression<bool> Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableFilterComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PeopleTableOrderingComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$PeopleTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> personRolesRefs<T extends Object>(
      Expression<T> Function($$PersonRolesTableAnnotationComposer a) f) {
    final $$PersonRolesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personRoles,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonRolesTableAnnotationComposer(
              $db: $db,
              $table: $db.personRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> vehiclesRefs<T extends Object>(
      Expression<T> Function($$VehiclesTableAnnotationComposer a) f) {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.ownerPersonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> truckDealsRefs<T extends Object>(
      Expression<T> Function($$TruckDealsTableAnnotationComposer a) f) {
    final $$TruckDealsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.sellerPersonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableAnnotationComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> attachmentsRefs<T extends Object>(
      Expression<T> Function($$AttachmentsTableAnnotationComposer a) f) {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PeopleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PeopleTable,
    PeopleData,
    $$PeopleTableFilterComposer,
    $$PeopleTableOrderingComposer,
    $$PeopleTableAnnotationComposer,
    $$PeopleTableCreateCompanionBuilder,
    $$PeopleTableUpdateCompanionBuilder,
    (PeopleData, $$PeopleTableReferences),
    PeopleData,
    PrefetchHooks Function(
        {bool personRolesRefs,
        bool vehiclesRefs,
        bool truckDealsRefs,
        bool transactionsRefs,
        bool attachmentsRefs})> {
  $$PeopleTableTableManager(_$AppDatabase db, $PeopleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeopleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeopleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeopleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PeopleCompanion(
            id: id,
            name: name,
            phone: phone,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PeopleCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PeopleTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {personRolesRefs = false,
              vehiclesRefs = false,
              truckDealsRefs = false,
              transactionsRefs = false,
              attachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (personRolesRefs) db.personRoles,
                if (vehiclesRefs) db.vehicles,
                if (truckDealsRefs) db.truckDeals,
                if (transactionsRefs) db.transactions,
                if (attachmentsRefs) db.attachments
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (personRolesRefs)
                    await $_getPrefetchedData<PeopleData, $PeopleTable,
                            PersonRole>(
                        currentTable: table,
                        referencedTable:
                            $$PeopleTableReferences._personRolesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PeopleTableReferences(db, table, p0)
                                .personRolesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.personId == item.id),
                        typedResults: items),
                  if (vehiclesRefs)
                    await $_getPrefetchedData<PeopleData, $PeopleTable,
                            Vehicle>(
                        currentTable: table,
                        referencedTable:
                            $$PeopleTableReferences._vehiclesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PeopleTableReferences(db, table, p0).vehiclesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.ownerPersonId == item.id),
                        typedResults: items),
                  if (truckDealsRefs)
                    await $_getPrefetchedData<PeopleData, $PeopleTable,
                            TruckDeal>(
                        currentTable: table,
                        referencedTable:
                            $$PeopleTableReferences._truckDealsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PeopleTableReferences(db, table, p0)
                                .truckDealsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.sellerPersonId == item.id),
                        typedResults: items),
                  if (transactionsRefs)
                    await $_getPrefetchedData<PeopleData, $PeopleTable,
                            Transaction>(
                        currentTable: table,
                        referencedTable:
                            $$PeopleTableReferences._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PeopleTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.personId == item.id),
                        typedResults: items),
                  if (attachmentsRefs)
                    await $_getPrefetchedData<PeopleData, $PeopleTable,
                            Attachment>(
                        currentTable: table,
                        referencedTable:
                            $$PeopleTableReferences._attachmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PeopleTableReferences(db, table, p0)
                                .attachmentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.personId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PeopleTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PeopleTable,
    PeopleData,
    $$PeopleTableFilterComposer,
    $$PeopleTableOrderingComposer,
    $$PeopleTableAnnotationComposer,
    $$PeopleTableCreateCompanionBuilder,
    $$PeopleTableUpdateCompanionBuilder,
    (PeopleData, $$PeopleTableReferences),
    PeopleData,
    PrefetchHooks Function(
        {bool personRolesRefs,
        bool vehiclesRefs,
        bool truckDealsRefs,
        bool transactionsRefs,
        bool attachmentsRefs})>;
typedef $$PersonRolesTableCreateCompanionBuilder = PersonRolesCompanion
    Function({
  Value<int> id,
  required int personId,
  required String role,
  Value<int?> companyId,
});
typedef $$PersonRolesTableUpdateCompanionBuilder = PersonRolesCompanion
    Function({
  Value<int> id,
  Value<int> personId,
  Value<String> role,
  Value<int?> companyId,
});

final class $$PersonRolesTableReferences
    extends BaseReferences<_$AppDatabase, $PersonRolesTable, PersonRole> {
  $$PersonRolesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PeopleTable _personIdTable(_$AppDatabase db) => db.people
      .createAlias($_aliasNameGenerator(db.personRoles.personId, db.people.id));

  $$PeopleTableProcessedTableManager get personId {
    final $_column = $_itemColumn<int>('person_id')!;

    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CompaniesTable _companyIdTable(_$AppDatabase db) =>
      db.companies.createAlias(
          $_aliasNameGenerator(db.personRoles.companyId, db.companies.id));

  $$CompaniesTableProcessedTableManager? get companyId {
    final $_column = $_itemColumn<int>('company_id');
    if ($_column == null) return null;
    final manager = $$CompaniesTableTableManager($_db, $_db.companies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PersonRolesTableFilterComposer
    extends Composer<_$AppDatabase, $PersonRolesTable> {
  $$PersonRolesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CompaniesTableFilterComposer get companyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableFilterComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonRolesTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonRolesTable> {
  $$PersonRolesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CompaniesTableOrderingComposer get companyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableOrderingComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonRolesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonRolesTable> {
  $$PersonRolesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CompaniesTableAnnotationComposer get companyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableAnnotationComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonRolesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonRolesTable,
    PersonRole,
    $$PersonRolesTableFilterComposer,
    $$PersonRolesTableOrderingComposer,
    $$PersonRolesTableAnnotationComposer,
    $$PersonRolesTableCreateCompanionBuilder,
    $$PersonRolesTableUpdateCompanionBuilder,
    (PersonRole, $$PersonRolesTableReferences),
    PersonRole,
    PrefetchHooks Function({bool personId, bool companyId})> {
  $$PersonRolesTableTableManager(_$AppDatabase db, $PersonRolesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonRolesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonRolesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonRolesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> personId = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<int?> companyId = const Value.absent(),
          }) =>
              PersonRolesCompanion(
            id: id,
            personId: personId,
            role: role,
            companyId: companyId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int personId,
            required String role,
            Value<int?> companyId = const Value.absent(),
          }) =>
              PersonRolesCompanion.insert(
            id: id,
            personId: personId,
            role: role,
            companyId: companyId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PersonRolesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({personId = false, companyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (personId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.personId,
                    referencedTable:
                        $$PersonRolesTableReferences._personIdTable(db),
                    referencedColumn:
                        $$PersonRolesTableReferences._personIdTable(db).id,
                  ) as T;
                }
                if (companyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.companyId,
                    referencedTable:
                        $$PersonRolesTableReferences._companyIdTable(db),
                    referencedColumn:
                        $$PersonRolesTableReferences._companyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PersonRolesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PersonRolesTable,
    PersonRole,
    $$PersonRolesTableFilterComposer,
    $$PersonRolesTableOrderingComposer,
    $$PersonRolesTableAnnotationComposer,
    $$PersonRolesTableCreateCompanionBuilder,
    $$PersonRolesTableUpdateCompanionBuilder,
    (PersonRole, $$PersonRolesTableReferences),
    PersonRole,
    PrefetchHooks Function({bool personId, bool companyId})>;
typedef $$VehiclesTableCreateCompanionBuilder = VehiclesCompanion Function({
  Value<int> id,
  required int companyId,
  Value<int?> ownerPersonId,
  required String regNumber,
  Value<String?> make,
  Value<String?> model,
  Value<String?> vehicleType,
  Value<String?> chassisNo,
  Value<String?> engineNo,
  Value<DateTime?> purchaseDate,
  Value<double> purchasePrice,
  required String status,
  required String businessContext,
  Value<String?> notes,
  Value<DateTime> createdAt,
});
typedef $$VehiclesTableUpdateCompanionBuilder = VehiclesCompanion Function({
  Value<int> id,
  Value<int> companyId,
  Value<int?> ownerPersonId,
  Value<String> regNumber,
  Value<String?> make,
  Value<String?> model,
  Value<String?> vehicleType,
  Value<String?> chassisNo,
  Value<String?> engineNo,
  Value<DateTime?> purchaseDate,
  Value<double> purchasePrice,
  Value<String> status,
  Value<String> businessContext,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

final class $$VehiclesTableReferences
    extends BaseReferences<_$AppDatabase, $VehiclesTable, Vehicle> {
  $$VehiclesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CompaniesTable _companyIdTable(_$AppDatabase db) =>
      db.companies.createAlias(
          $_aliasNameGenerator(db.vehicles.companyId, db.companies.id));

  $$CompaniesTableProcessedTableManager get companyId {
    final $_column = $_itemColumn<int>('company_id')!;

    final manager = $$CompaniesTableTableManager($_db, $_db.companies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PeopleTable _ownerPersonIdTable(_$AppDatabase db) =>
      db.people.createAlias(
          $_aliasNameGenerator(db.vehicles.ownerPersonId, db.people.id));

  $$PeopleTableProcessedTableManager? get ownerPersonId {
    final $_column = $_itemColumn<int>('owner_person_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$VehicleComponentsTable, List<VehicleComponent>>
      _vehicleComponentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.vehicleComponents,
              aliasName: $_aliasNameGenerator(
                  db.vehicles.id, db.vehicleComponents.vehicleId));

  $$VehicleComponentsTableProcessedTableManager get vehicleComponentsRefs {
    final manager =
        $$VehicleComponentsTableTableManager($_db, $_db.vehicleComponents)
            .filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_vehicleComponentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TripsTable, List<Trip>> _tripsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.trips,
          aliasName: $_aliasNameGenerator(db.vehicles.id, db.trips.vehicleId));

  $$TripsTableProcessedTableManager get tripsRefs {
    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tripsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TruckDealsTable, List<TruckDeal>>
      _truckDealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.truckDeals,
          aliasName:
              $_aliasNameGenerator(db.vehicles.id, db.truckDeals.vehicleId));

  $$TruckDealsTableProcessedTableManager get truckDealsRefs {
    final manager = $$TruckDealsTableTableManager($_db, $_db.truckDeals)
        .filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_truckDealsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName:
              $_aliasNameGenerator(db.vehicles.id, db.transactions.vehicleId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AttachmentsTable, List<Attachment>>
      _attachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.attachments,
          aliasName:
              $_aliasNameGenerator(db.vehicles.id, db.attachments.vehicleId));

  $$AttachmentsTableProcessedTableManager get attachmentsRefs {
    final manager = $$AttachmentsTableTableManager($_db, $_db.attachments)
        .filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$VehiclesTableFilterComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get regNumber => $composableBuilder(
      column: $table.regNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get make => $composableBuilder(
      column: $table.make, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vehicleType => $composableBuilder(
      column: $table.vehicleType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get chassisNo => $composableBuilder(
      column: $table.chassisNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get engineNo => $composableBuilder(
      column: $table.engineNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessContext => $composableBuilder(
      column: $table.businessContext,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$CompaniesTableFilterComposer get companyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableFilterComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableFilterComposer get ownerPersonId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> vehicleComponentsRefs(
      Expression<bool> Function($$VehicleComponentsTableFilterComposer f) f) {
    final $$VehicleComponentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vehicleComponents,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehicleComponentsTableFilterComposer(
              $db: $db,
              $table: $db.vehicleComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tripsRefs(
      Expression<bool> Function($$TripsTableFilterComposer f) f) {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> truckDealsRefs(
      Expression<bool> Function($$TruckDealsTableFilterComposer f) f) {
    final $$TruckDealsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableFilterComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> attachmentsRefs(
      Expression<bool> Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableFilterComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VehiclesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get regNumber => $composableBuilder(
      column: $table.regNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get make => $composableBuilder(
      column: $table.make, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vehicleType => $composableBuilder(
      column: $table.vehicleType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get chassisNo => $composableBuilder(
      column: $table.chassisNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get engineNo => $composableBuilder(
      column: $table.engineNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessContext => $composableBuilder(
      column: $table.businessContext,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$CompaniesTableOrderingComposer get companyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableOrderingComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableOrderingComposer get ownerPersonId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VehiclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get regNumber =>
      $composableBuilder(column: $table.regNumber, builder: (column) => column);

  GeneratedColumn<String> get make =>
      $composableBuilder(column: $table.make, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get vehicleType => $composableBuilder(
      column: $table.vehicleType, builder: (column) => column);

  GeneratedColumn<String> get chassisNo =>
      $composableBuilder(column: $table.chassisNo, builder: (column) => column);

  GeneratedColumn<String> get engineNo =>
      $composableBuilder(column: $table.engineNo, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get businessContext => $composableBuilder(
      column: $table.businessContext, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CompaniesTableAnnotationComposer get companyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableAnnotationComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableAnnotationComposer get ownerPersonId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> vehicleComponentsRefs<T extends Object>(
      Expression<T> Function($$VehicleComponentsTableAnnotationComposer a) f) {
    final $$VehicleComponentsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.vehicleComponents,
            getReferencedColumn: (t) => t.vehicleId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$VehicleComponentsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.vehicleComponents,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tripsRefs<T extends Object>(
      Expression<T> Function($$TripsTableAnnotationComposer a) f) {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> truckDealsRefs<T extends Object>(
      Expression<T> Function($$TruckDealsTableAnnotationComposer a) f) {
    final $$TruckDealsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableAnnotationComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> attachmentsRefs<T extends Object>(
      Expression<T> Function($$AttachmentsTableAnnotationComposer a) f) {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.vehicleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VehiclesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VehiclesTable,
    Vehicle,
    $$VehiclesTableFilterComposer,
    $$VehiclesTableOrderingComposer,
    $$VehiclesTableAnnotationComposer,
    $$VehiclesTableCreateCompanionBuilder,
    $$VehiclesTableUpdateCompanionBuilder,
    (Vehicle, $$VehiclesTableReferences),
    Vehicle,
    PrefetchHooks Function(
        {bool companyId,
        bool ownerPersonId,
        bool vehicleComponentsRefs,
        bool tripsRefs,
        bool truckDealsRefs,
        bool transactionsRefs,
        bool attachmentsRefs})> {
  $$VehiclesTableTableManager(_$AppDatabase db, $VehiclesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> companyId = const Value.absent(),
            Value<int?> ownerPersonId = const Value.absent(),
            Value<String> regNumber = const Value.absent(),
            Value<String?> make = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> vehicleType = const Value.absent(),
            Value<String?> chassisNo = const Value.absent(),
            Value<String?> engineNo = const Value.absent(),
            Value<DateTime?> purchaseDate = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> businessContext = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              VehiclesCompanion(
            id: id,
            companyId: companyId,
            ownerPersonId: ownerPersonId,
            regNumber: regNumber,
            make: make,
            model: model,
            vehicleType: vehicleType,
            chassisNo: chassisNo,
            engineNo: engineNo,
            purchaseDate: purchaseDate,
            purchasePrice: purchasePrice,
            status: status,
            businessContext: businessContext,
            notes: notes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int companyId,
            Value<int?> ownerPersonId = const Value.absent(),
            required String regNumber,
            Value<String?> make = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> vehicleType = const Value.absent(),
            Value<String?> chassisNo = const Value.absent(),
            Value<String?> engineNo = const Value.absent(),
            Value<DateTime?> purchaseDate = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            required String status,
            required String businessContext,
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              VehiclesCompanion.insert(
            id: id,
            companyId: companyId,
            ownerPersonId: ownerPersonId,
            regNumber: regNumber,
            make: make,
            model: model,
            vehicleType: vehicleType,
            chassisNo: chassisNo,
            engineNo: engineNo,
            purchaseDate: purchaseDate,
            purchasePrice: purchasePrice,
            status: status,
            businessContext: businessContext,
            notes: notes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$VehiclesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {companyId = false,
              ownerPersonId = false,
              vehicleComponentsRefs = false,
              tripsRefs = false,
              truckDealsRefs = false,
              transactionsRefs = false,
              attachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (vehicleComponentsRefs) db.vehicleComponents,
                if (tripsRefs) db.trips,
                if (truckDealsRefs) db.truckDeals,
                if (transactionsRefs) db.transactions,
                if (attachmentsRefs) db.attachments
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (companyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.companyId,
                    referencedTable:
                        $$VehiclesTableReferences._companyIdTable(db),
                    referencedColumn:
                        $$VehiclesTableReferences._companyIdTable(db).id,
                  ) as T;
                }
                if (ownerPersonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ownerPersonId,
                    referencedTable:
                        $$VehiclesTableReferences._ownerPersonIdTable(db),
                    referencedColumn:
                        $$VehiclesTableReferences._ownerPersonIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vehicleComponentsRefs)
                    await $_getPrefetchedData<Vehicle, $VehiclesTable,
                            VehicleComponent>(
                        currentTable: table,
                        referencedTable: $$VehiclesTableReferences
                            ._vehicleComponentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VehiclesTableReferences(db, table, p0)
                                .vehicleComponentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vehicleId == item.id),
                        typedResults: items),
                  if (tripsRefs)
                    await $_getPrefetchedData<Vehicle, $VehiclesTable, Trip>(
                        currentTable: table,
                        referencedTable:
                            $$VehiclesTableReferences._tripsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VehiclesTableReferences(db, table, p0).tripsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vehicleId == item.id),
                        typedResults: items),
                  if (truckDealsRefs)
                    await $_getPrefetchedData<Vehicle, $VehiclesTable,
                            TruckDeal>(
                        currentTable: table,
                        referencedTable:
                            $$VehiclesTableReferences._truckDealsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VehiclesTableReferences(db, table, p0)
                                .truckDealsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vehicleId == item.id),
                        typedResults: items),
                  if (transactionsRefs)
                    await $_getPrefetchedData<Vehicle, $VehiclesTable,
                            Transaction>(
                        currentTable: table,
                        referencedTable: $$VehiclesTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VehiclesTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vehicleId == item.id),
                        typedResults: items),
                  if (attachmentsRefs)
                    await $_getPrefetchedData<Vehicle, $VehiclesTable,
                            Attachment>(
                        currentTable: table,
                        referencedTable:
                            $$VehiclesTableReferences._attachmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VehiclesTableReferences(db, table, p0)
                                .attachmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vehicleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$VehiclesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VehiclesTable,
    Vehicle,
    $$VehiclesTableFilterComposer,
    $$VehiclesTableOrderingComposer,
    $$VehiclesTableAnnotationComposer,
    $$VehiclesTableCreateCompanionBuilder,
    $$VehiclesTableUpdateCompanionBuilder,
    (Vehicle, $$VehiclesTableReferences),
    Vehicle,
    PrefetchHooks Function(
        {bool companyId,
        bool ownerPersonId,
        bool vehicleComponentsRefs,
        bool tripsRefs,
        bool truckDealsRefs,
        bool transactionsRefs,
        bool attachmentsRefs})>;
typedef $$VehicleComponentsTableCreateCompanionBuilder
    = VehicleComponentsCompanion Function({
  Value<int> id,
  required int vehicleId,
  required String componentType,
  Value<String> status,
  Value<int?> saleTransactionId,
  Value<DateTime> createdAt,
});
typedef $$VehicleComponentsTableUpdateCompanionBuilder
    = VehicleComponentsCompanion Function({
  Value<int> id,
  Value<int> vehicleId,
  Value<String> componentType,
  Value<String> status,
  Value<int?> saleTransactionId,
  Value<DateTime> createdAt,
});

final class $$VehicleComponentsTableReferences extends BaseReferences<
    _$AppDatabase, $VehicleComponentsTable, VehicleComponent> {
  $$VehicleComponentsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias(
          $_aliasNameGenerator(db.vehicleComponents.vehicleId, db.vehicles.id));

  $$VehiclesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<int>('vehicle_id')!;

    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName: $_aliasNameGenerator(
                  db.vehicleComponents.id, db.transactions.componentId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.componentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$VehicleComponentsTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleComponentsTable> {
  $$VehicleComponentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get componentType => $composableBuilder(
      column: $table.componentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get saleTransactionId => $composableBuilder(
      column: $table.saleTransactionId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.componentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VehicleComponentsTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleComponentsTable> {
  $$VehicleComponentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get componentType => $composableBuilder(
      column: $table.componentType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get saleTransactionId => $composableBuilder(
      column: $table.saleTransactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableOrderingComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VehicleComponentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleComponentsTable> {
  $$VehicleComponentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get componentType => $composableBuilder(
      column: $table.componentType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get saleTransactionId => $composableBuilder(
      column: $table.saleTransactionId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.componentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VehicleComponentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VehicleComponentsTable,
    VehicleComponent,
    $$VehicleComponentsTableFilterComposer,
    $$VehicleComponentsTableOrderingComposer,
    $$VehicleComponentsTableAnnotationComposer,
    $$VehicleComponentsTableCreateCompanionBuilder,
    $$VehicleComponentsTableUpdateCompanionBuilder,
    (VehicleComponent, $$VehicleComponentsTableReferences),
    VehicleComponent,
    PrefetchHooks Function({bool vehicleId, bool transactionsRefs})> {
  $$VehicleComponentsTableTableManager(
      _$AppDatabase db, $VehicleComponentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleComponentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleComponentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleComponentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> vehicleId = const Value.absent(),
            Value<String> componentType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int?> saleTransactionId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              VehicleComponentsCompanion(
            id: id,
            vehicleId: vehicleId,
            componentType: componentType,
            status: status,
            saleTransactionId: saleTransactionId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int vehicleId,
            required String componentType,
            Value<String> status = const Value.absent(),
            Value<int?> saleTransactionId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              VehicleComponentsCompanion.insert(
            id: id,
            vehicleId: vehicleId,
            componentType: componentType,
            status: status,
            saleTransactionId: saleTransactionId,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VehicleComponentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {vehicleId = false, transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (vehicleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vehicleId,
                    referencedTable:
                        $$VehicleComponentsTableReferences._vehicleIdTable(db),
                    referencedColumn: $$VehicleComponentsTableReferences
                        ._vehicleIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<VehicleComponent,
                            $VehicleComponentsTable, Transaction>(
                        currentTable: table,
                        referencedTable: $$VehicleComponentsTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VehicleComponentsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.componentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$VehicleComponentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VehicleComponentsTable,
    VehicleComponent,
    $$VehicleComponentsTableFilterComposer,
    $$VehicleComponentsTableOrderingComposer,
    $$VehicleComponentsTableAnnotationComposer,
    $$VehicleComponentsTableCreateCompanionBuilder,
    $$VehicleComponentsTableUpdateCompanionBuilder,
    (VehicleComponent, $$VehicleComponentsTableReferences),
    VehicleComponent,
    PrefetchHooks Function({bool vehicleId, bool transactionsRefs})>;
typedef $$TransactionCategoriesTableCreateCompanionBuilder
    = TransactionCategoriesCompanion Function({
  Value<int> id,
  required String name,
  required String direction,
  Value<int?> scopeCompanyId,
  Value<bool> isUserCreated,
  Value<String?> iconName,
});
typedef $$TransactionCategoriesTableUpdateCompanionBuilder
    = TransactionCategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> direction,
  Value<int?> scopeCompanyId,
  Value<bool> isUserCreated,
  Value<String?> iconName,
});

final class $$TransactionCategoriesTableReferences extends BaseReferences<
    _$AppDatabase, $TransactionCategoriesTable, TransactionCategory> {
  $$TransactionCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CompaniesTable _scopeCompanyIdTable(_$AppDatabase db) =>
      db.companies.createAlias($_aliasNameGenerator(
          db.transactionCategories.scopeCompanyId, db.companies.id));

  $$CompaniesTableProcessedTableManager? get scopeCompanyId {
    final $_column = $_itemColumn<int>('scope_company_id');
    if ($_column == null) return null;
    final manager = $$CompaniesTableTableManager($_db, $_db.companies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scopeCompanyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName: $_aliasNameGenerator(
                  db.transactionCategories.id, db.transactions.categoryId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TransactionCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionCategoriesTable> {
  $$TransactionCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isUserCreated => $composableBuilder(
      column: $table.isUserCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  $$CompaniesTableFilterComposer get scopeCompanyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scopeCompanyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableFilterComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TransactionCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionCategoriesTable> {
  $$TransactionCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isUserCreated => $composableBuilder(
      column: $table.isUserCreated,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  $$CompaniesTableOrderingComposer get scopeCompanyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scopeCompanyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableOrderingComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionCategoriesTable> {
  $$TransactionCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<bool> get isUserCreated => $composableBuilder(
      column: $table.isUserCreated, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  $$CompaniesTableAnnotationComposer get scopeCompanyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scopeCompanyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableAnnotationComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TransactionCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionCategoriesTable,
    TransactionCategory,
    $$TransactionCategoriesTableFilterComposer,
    $$TransactionCategoriesTableOrderingComposer,
    $$TransactionCategoriesTableAnnotationComposer,
    $$TransactionCategoriesTableCreateCompanionBuilder,
    $$TransactionCategoriesTableUpdateCompanionBuilder,
    (TransactionCategory, $$TransactionCategoriesTableReferences),
    TransactionCategory,
    PrefetchHooks Function({bool scopeCompanyId, bool transactionsRefs})> {
  $$TransactionCategoriesTableTableManager(
      _$AppDatabase db, $TransactionCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionCategoriesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionCategoriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionCategoriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<int?> scopeCompanyId = const Value.absent(),
            Value<bool> isUserCreated = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
          }) =>
              TransactionCategoriesCompanion(
            id: id,
            name: name,
            direction: direction,
            scopeCompanyId: scopeCompanyId,
            isUserCreated: isUserCreated,
            iconName: iconName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String direction,
            Value<int?> scopeCompanyId = const Value.absent(),
            Value<bool> isUserCreated = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
          }) =>
              TransactionCategoriesCompanion.insert(
            id: id,
            name: name,
            direction: direction,
            scopeCompanyId: scopeCompanyId,
            isUserCreated: isUserCreated,
            iconName: iconName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {scopeCompanyId = false, transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (scopeCompanyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.scopeCompanyId,
                    referencedTable: $$TransactionCategoriesTableReferences
                        ._scopeCompanyIdTable(db),
                    referencedColumn: $$TransactionCategoriesTableReferences
                        ._scopeCompanyIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<TransactionCategory,
                            $TransactionCategoriesTable, Transaction>(
                        currentTable: table,
                        referencedTable: $$TransactionCategoriesTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TransactionCategoriesTableReferences(
                                    db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TransactionCategoriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TransactionCategoriesTable,
        TransactionCategory,
        $$TransactionCategoriesTableFilterComposer,
        $$TransactionCategoriesTableOrderingComposer,
        $$TransactionCategoriesTableAnnotationComposer,
        $$TransactionCategoriesTableCreateCompanionBuilder,
        $$TransactionCategoriesTableUpdateCompanionBuilder,
        (TransactionCategory, $$TransactionCategoriesTableReferences),
        TransactionCategory,
        PrefetchHooks Function({bool scopeCompanyId, bool transactionsRefs})>;
typedef $$PaymentAccountsTableCreateCompanionBuilder = PaymentAccountsCompanion
    Function({
  Value<int> id,
  required String name,
  required String type,
  Value<double> openingBalance,
  Value<bool> isActive,
});
typedef $$PaymentAccountsTableUpdateCompanionBuilder = PaymentAccountsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> type,
  Value<double> openingBalance,
  Value<bool> isActive,
});

final class $$PaymentAccountsTableReferences extends BaseReferences<
    _$AppDatabase, $PaymentAccountsTable, PaymentAccount> {
  $$PaymentAccountsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName: $_aliasNameGenerator(
                  db.paymentAccounts.id, db.transactions.accountId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PaymentAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentAccountsTable> {
  $$PaymentAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaymentAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentAccountsTable> {
  $$PaymentAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$PaymentAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentAccountsTable> {
  $$PaymentAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaymentAccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentAccountsTable,
    PaymentAccount,
    $$PaymentAccountsTableFilterComposer,
    $$PaymentAccountsTableOrderingComposer,
    $$PaymentAccountsTableAnnotationComposer,
    $$PaymentAccountsTableCreateCompanionBuilder,
    $$PaymentAccountsTableUpdateCompanionBuilder,
    (PaymentAccount, $$PaymentAccountsTableReferences),
    PaymentAccount,
    PrefetchHooks Function({bool transactionsRefs})> {
  $$PaymentAccountsTableTableManager(
      _$AppDatabase db, $PaymentAccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              PaymentAccountsCompanion(
            id: id,
            name: name,
            type: type,
            openingBalance: openingBalance,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String type,
            Value<double> openingBalance = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              PaymentAccountsCompanion.insert(
            id: id,
            name: name,
            type: type,
            openingBalance: openingBalance,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PaymentAccountsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<PaymentAccount,
                            $PaymentAccountsTable, Transaction>(
                        currentTable: table,
                        referencedTable: $$PaymentAccountsTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PaymentAccountsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PaymentAccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PaymentAccountsTable,
    PaymentAccount,
    $$PaymentAccountsTableFilterComposer,
    $$PaymentAccountsTableOrderingComposer,
    $$PaymentAccountsTableAnnotationComposer,
    $$PaymentAccountsTableCreateCompanionBuilder,
    $$PaymentAccountsTableUpdateCompanionBuilder,
    (PaymentAccount, $$PaymentAccountsTableReferences),
    PaymentAccount,
    PrefetchHooks Function({bool transactionsRefs})>;
typedef $$TripsTableCreateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  required int companyId,
  required int customerPersonId,
  required int vehicleId,
  Value<int?> driverPersonId,
  Value<String?> origin,
  Value<String?> destination,
  Value<String?> material,
  Value<double> freightAmount,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$TripsTableUpdateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  Value<int> companyId,
  Value<int> customerPersonId,
  Value<int> vehicleId,
  Value<int?> driverPersonId,
  Value<String?> origin,
  Value<String?> destination,
  Value<String?> material,
  Value<double> freightAmount,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$TripsTableReferences
    extends BaseReferences<_$AppDatabase, $TripsTable, Trip> {
  $$TripsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CompaniesTable _companyIdTable(_$AppDatabase db) => db.companies
      .createAlias($_aliasNameGenerator(db.trips.companyId, db.companies.id));

  $$CompaniesTableProcessedTableManager get companyId {
    final $_column = $_itemColumn<int>('company_id')!;

    final manager = $$CompaniesTableTableManager($_db, $_db.companies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PeopleTable _customerPersonIdTable(_$AppDatabase db) =>
      db.people.createAlias(
          $_aliasNameGenerator(db.trips.customerPersonId, db.people.id));

  $$PeopleTableProcessedTableManager get customerPersonId {
    final $_column = $_itemColumn<int>('customer_person_id')!;

    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) => db.vehicles
      .createAlias($_aliasNameGenerator(db.trips.vehicleId, db.vehicles.id));

  $$VehiclesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<int>('vehicle_id')!;

    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PeopleTable _driverPersonIdTable(_$AppDatabase db) => db.people
      .createAlias($_aliasNameGenerator(db.trips.driverPersonId, db.people.id));

  $$PeopleTableProcessedTableManager? get driverPersonId {
    final $_column = $_itemColumn<int>('driver_person_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_driverPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName: $_aliasNameGenerator(db.trips.id, db.transactions.tripId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.tripId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TripsTableFilterComposer extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get material => $composableBuilder(
      column: $table.material, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get freightAmount => $composableBuilder(
      column: $table.freightAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$CompaniesTableFilterComposer get companyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableFilterComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableFilterComposer get customerPersonId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableFilterComposer get driverPersonId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.driverPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get material => $composableBuilder(
      column: $table.material, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get freightAmount => $composableBuilder(
      column: $table.freightAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$CompaniesTableOrderingComposer get companyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableOrderingComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableOrderingComposer get customerPersonId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableOrderingComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableOrderingComposer get driverPersonId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.driverPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TripsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<double> get freightAmount => $composableBuilder(
      column: $table.freightAmount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CompaniesTableAnnotationComposer get companyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableAnnotationComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableAnnotationComposer get customerPersonId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableAnnotationComposer get driverPersonId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.driverPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function(
        {bool companyId,
        bool customerPersonId,
        bool vehicleId,
        bool driverPersonId,
        bool transactionsRefs})> {
  $$TripsTableTableManager(_$AppDatabase db, $TripsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> companyId = const Value.absent(),
            Value<int> customerPersonId = const Value.absent(),
            Value<int> vehicleId = const Value.absent(),
            Value<int?> driverPersonId = const Value.absent(),
            Value<String?> origin = const Value.absent(),
            Value<String?> destination = const Value.absent(),
            Value<String?> material = const Value.absent(),
            Value<double> freightAmount = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TripsCompanion(
            id: id,
            companyId: companyId,
            customerPersonId: customerPersonId,
            vehicleId: vehicleId,
            driverPersonId: driverPersonId,
            origin: origin,
            destination: destination,
            material: material,
            freightAmount: freightAmount,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int companyId,
            required int customerPersonId,
            required int vehicleId,
            Value<int?> driverPersonId = const Value.absent(),
            Value<String?> origin = const Value.absent(),
            Value<String?> destination = const Value.absent(),
            Value<String?> material = const Value.absent(),
            Value<double> freightAmount = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TripsCompanion.insert(
            id: id,
            companyId: companyId,
            customerPersonId: customerPersonId,
            vehicleId: vehicleId,
            driverPersonId: driverPersonId,
            origin: origin,
            destination: destination,
            material: material,
            freightAmount: freightAmount,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TripsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {companyId = false,
              customerPersonId = false,
              vehicleId = false,
              driverPersonId = false,
              transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (companyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.companyId,
                    referencedTable: $$TripsTableReferences._companyIdTable(db),
                    referencedColumn:
                        $$TripsTableReferences._companyIdTable(db).id,
                  ) as T;
                }
                if (customerPersonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerPersonId,
                    referencedTable:
                        $$TripsTableReferences._customerPersonIdTable(db),
                    referencedColumn:
                        $$TripsTableReferences._customerPersonIdTable(db).id,
                  ) as T;
                }
                if (vehicleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vehicleId,
                    referencedTable: $$TripsTableReferences._vehicleIdTable(db),
                    referencedColumn:
                        $$TripsTableReferences._vehicleIdTable(db).id,
                  ) as T;
                }
                if (driverPersonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.driverPersonId,
                    referencedTable:
                        $$TripsTableReferences._driverPersonIdTable(db),
                    referencedColumn:
                        $$TripsTableReferences._driverPersonIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<Trip, $TripsTable, Transaction>(
                        currentTable: table,
                        referencedTable:
                            $$TripsTableReferences._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TripsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function(
        {bool companyId,
        bool customerPersonId,
        bool vehicleId,
        bool driverPersonId,
        bool transactionsRefs})>;
typedef $$TruckDealsTableCreateCompanionBuilder = TruckDealsCompanion Function({
  Value<int> id,
  required int companyId,
  required int vehicleId,
  Value<int?> sellerPersonId,
  required String dealType,
  Value<double> purchaseAmount,
  required DateTime purchaseDate,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$TruckDealsTableUpdateCompanionBuilder = TruckDealsCompanion Function({
  Value<int> id,
  Value<int> companyId,
  Value<int> vehicleId,
  Value<int?> sellerPersonId,
  Value<String> dealType,
  Value<double> purchaseAmount,
  Value<DateTime> purchaseDate,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$TruckDealsTableReferences
    extends BaseReferences<_$AppDatabase, $TruckDealsTable, TruckDeal> {
  $$TruckDealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CompaniesTable _companyIdTable(_$AppDatabase db) =>
      db.companies.createAlias(
          $_aliasNameGenerator(db.truckDeals.companyId, db.companies.id));

  $$CompaniesTableProcessedTableManager get companyId {
    final $_column = $_itemColumn<int>('company_id')!;

    final manager = $$CompaniesTableTableManager($_db, $_db.companies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias(
          $_aliasNameGenerator(db.truckDeals.vehicleId, db.vehicles.id));

  $$VehiclesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<int>('vehicle_id')!;

    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PeopleTable _sellerPersonIdTable(_$AppDatabase db) =>
      db.people.createAlias(
          $_aliasNameGenerator(db.truckDeals.sellerPersonId, db.people.id));

  $$PeopleTableProcessedTableManager? get sellerPersonId {
    final $_column = $_itemColumn<int>('seller_person_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sellerPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName:
              $_aliasNameGenerator(db.truckDeals.id, db.transactions.dealId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.dealId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TruckDealsTableFilterComposer
    extends Composer<_$AppDatabase, $TruckDealsTable> {
  $$TruckDealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dealType => $composableBuilder(
      column: $table.dealType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchaseAmount => $composableBuilder(
      column: $table.purchaseAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$CompaniesTableFilterComposer get companyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableFilterComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableFilterComposer get sellerPersonId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sellerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.dealId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TruckDealsTableOrderingComposer
    extends Composer<_$AppDatabase, $TruckDealsTable> {
  $$TruckDealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dealType => $composableBuilder(
      column: $table.dealType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchaseAmount => $composableBuilder(
      column: $table.purchaseAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$CompaniesTableOrderingComposer get companyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableOrderingComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableOrderingComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableOrderingComposer get sellerPersonId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sellerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TruckDealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TruckDealsTable> {
  $$TruckDealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dealType =>
      $composableBuilder(column: $table.dealType, builder: (column) => column);

  GeneratedColumn<double> get purchaseAmount => $composableBuilder(
      column: $table.purchaseAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CompaniesTableAnnotationComposer get companyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableAnnotationComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableAnnotationComposer get sellerPersonId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sellerPersonId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.dealId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TruckDealsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TruckDealsTable,
    TruckDeal,
    $$TruckDealsTableFilterComposer,
    $$TruckDealsTableOrderingComposer,
    $$TruckDealsTableAnnotationComposer,
    $$TruckDealsTableCreateCompanionBuilder,
    $$TruckDealsTableUpdateCompanionBuilder,
    (TruckDeal, $$TruckDealsTableReferences),
    TruckDeal,
    PrefetchHooks Function(
        {bool companyId,
        bool vehicleId,
        bool sellerPersonId,
        bool transactionsRefs})> {
  $$TruckDealsTableTableManager(_$AppDatabase db, $TruckDealsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TruckDealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TruckDealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TruckDealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> companyId = const Value.absent(),
            Value<int> vehicleId = const Value.absent(),
            Value<int?> sellerPersonId = const Value.absent(),
            Value<String> dealType = const Value.absent(),
            Value<double> purchaseAmount = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TruckDealsCompanion(
            id: id,
            companyId: companyId,
            vehicleId: vehicleId,
            sellerPersonId: sellerPersonId,
            dealType: dealType,
            purchaseAmount: purchaseAmount,
            purchaseDate: purchaseDate,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int companyId,
            required int vehicleId,
            Value<int?> sellerPersonId = const Value.absent(),
            required String dealType,
            Value<double> purchaseAmount = const Value.absent(),
            required DateTime purchaseDate,
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TruckDealsCompanion.insert(
            id: id,
            companyId: companyId,
            vehicleId: vehicleId,
            sellerPersonId: sellerPersonId,
            dealType: dealType,
            purchaseAmount: purchaseAmount,
            purchaseDate: purchaseDate,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TruckDealsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {companyId = false,
              vehicleId = false,
              sellerPersonId = false,
              transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (companyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.companyId,
                    referencedTable:
                        $$TruckDealsTableReferences._companyIdTable(db),
                    referencedColumn:
                        $$TruckDealsTableReferences._companyIdTable(db).id,
                  ) as T;
                }
                if (vehicleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vehicleId,
                    referencedTable:
                        $$TruckDealsTableReferences._vehicleIdTable(db),
                    referencedColumn:
                        $$TruckDealsTableReferences._vehicleIdTable(db).id,
                  ) as T;
                }
                if (sellerPersonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sellerPersonId,
                    referencedTable:
                        $$TruckDealsTableReferences._sellerPersonIdTable(db),
                    referencedColumn:
                        $$TruckDealsTableReferences._sellerPersonIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<TruckDeal, $TruckDealsTable,
                            Transaction>(
                        currentTable: table,
                        referencedTable: $$TruckDealsTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TruckDealsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.dealId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TruckDealsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TruckDealsTable,
    TruckDeal,
    $$TruckDealsTableFilterComposer,
    $$TruckDealsTableOrderingComposer,
    $$TruckDealsTableAnnotationComposer,
    $$TruckDealsTableCreateCompanionBuilder,
    $$TruckDealsTableUpdateCompanionBuilder,
    (TruckDeal, $$TruckDealsTableReferences),
    TruckDeal,
    PrefetchHooks Function(
        {bool companyId,
        bool vehicleId,
        bool sellerPersonId,
        bool transactionsRefs})>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required int companyId,
  required int categoryId,
  Value<int?> personId,
  Value<int?> vehicleId,
  Value<int?> tripId,
  Value<int?> dealId,
  Value<int?> accountId,
  Value<int?> componentId,
  required DateTime date,
  required double amount,
  required String direction,
  Value<String> paymentMethod,
  Value<String?> referenceNo,
  Value<String?> notes,
  Value<String> createdBy,
  Value<DateTime> createdAt,
  Value<String?> updatedBy,
  Value<DateTime?> updatedAt,
  Value<bool> isDeleted,
  Value<int?> reversalOfTransactionId,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<int> companyId,
  Value<int> categoryId,
  Value<int?> personId,
  Value<int?> vehicleId,
  Value<int?> tripId,
  Value<int?> dealId,
  Value<int?> accountId,
  Value<int?> componentId,
  Value<DateTime> date,
  Value<double> amount,
  Value<String> direction,
  Value<String> paymentMethod,
  Value<String?> referenceNo,
  Value<String?> notes,
  Value<String> createdBy,
  Value<DateTime> createdAt,
  Value<String?> updatedBy,
  Value<DateTime?> updatedAt,
  Value<bool> isDeleted,
  Value<int?> reversalOfTransactionId,
});

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CompaniesTable _companyIdTable(_$AppDatabase db) =>
      db.companies.createAlias(
          $_aliasNameGenerator(db.transactions.companyId, db.companies.id));

  $$CompaniesTableProcessedTableManager get companyId {
    final $_column = $_itemColumn<int>('company_id')!;

    final manager = $$CompaniesTableTableManager($_db, $_db.companies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TransactionCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.transactionCategories.createAlias($_aliasNameGenerator(
          db.transactions.categoryId, db.transactionCategories.id));

  $$TransactionCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$TransactionCategoriesTableTableManager(
            $_db, $_db.transactionCategories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PeopleTable _personIdTable(_$AppDatabase db) => db.people.createAlias(
      $_aliasNameGenerator(db.transactions.personId, db.people.id));

  $$PeopleTableProcessedTableManager? get personId {
    final $_column = $_itemColumn<int>('person_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias(
          $_aliasNameGenerator(db.transactions.vehicleId, db.vehicles.id));

  $$VehiclesTableProcessedTableManager? get vehicleId {
    final $_column = $_itemColumn<int>('vehicle_id');
    if ($_column == null) return null;
    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TripsTable _tripIdTable(_$AppDatabase db) => db.trips
      .createAlias($_aliasNameGenerator(db.transactions.tripId, db.trips.id));

  $$TripsTableProcessedTableManager? get tripId {
    final $_column = $_itemColumn<int>('trip_id');
    if ($_column == null) return null;
    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TruckDealsTable _dealIdTable(_$AppDatabase db) =>
      db.truckDeals.createAlias(
          $_aliasNameGenerator(db.transactions.dealId, db.truckDeals.id));

  $$TruckDealsTableProcessedTableManager? get dealId {
    final $_column = $_itemColumn<int>('deal_id');
    if ($_column == null) return null;
    final manager = $$TruckDealsTableTableManager($_db, $_db.truckDeals)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dealIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PaymentAccountsTable _accountIdTable(_$AppDatabase db) =>
      db.paymentAccounts.createAlias($_aliasNameGenerator(
          db.transactions.accountId, db.paymentAccounts.id));

  $$PaymentAccountsTableProcessedTableManager? get accountId {
    final $_column = $_itemColumn<int>('account_id');
    if ($_column == null) return null;
    final manager =
        $$PaymentAccountsTableTableManager($_db, $_db.paymentAccounts)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $VehicleComponentsTable _componentIdTable(_$AppDatabase db) =>
      db.vehicleComponents.createAlias($_aliasNameGenerator(
          db.transactions.componentId, db.vehicleComponents.id));

  $$VehicleComponentsTableProcessedTableManager? get componentId {
    final $_column = $_itemColumn<int>('component_id');
    if ($_column == null) return null;
    final manager =
        $$VehicleComponentsTableTableManager($_db, $_db.vehicleComponents)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_componentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AttachmentsTable, List<Attachment>>
      _attachmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.attachments,
              aliasName: $_aliasNameGenerator(
                  db.transactions.id, db.attachments.transactionId));

  $$AttachmentsTableProcessedTableManager get attachmentsRefs {
    final manager = $$AttachmentsTableTableManager($_db, $_db.attachments)
        .filter((f) => f.transactionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNo => $composableBuilder(
      column: $table.referenceNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedBy => $composableBuilder(
      column: $table.updatedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reversalOfTransactionId => $composableBuilder(
      column: $table.reversalOfTransactionId,
      builder: (column) => ColumnFilters(column));

  $$CompaniesTableFilterComposer get companyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableFilterComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TransactionCategoriesTableFilterComposer get categoryId {
    final $$TransactionCategoriesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.transactionCategories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionCategoriesTableFilterComposer(
                  $db: $db,
                  $table: $db.transactionCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TruckDealsTableFilterComposer get dealId {
    final $$TruckDealsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dealId,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableFilterComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaymentAccountsTableFilterComposer get accountId {
    final $$PaymentAccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.paymentAccounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentAccountsTableFilterComposer(
              $db: $db,
              $table: $db.paymentAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehicleComponentsTableFilterComposer get componentId {
    final $$VehicleComponentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.componentId,
        referencedTable: $db.vehicleComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehicleComponentsTableFilterComposer(
              $db: $db,
              $table: $db.vehicleComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> attachmentsRefs(
      Expression<bool> Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableFilterComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNo => $composableBuilder(
      column: $table.referenceNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedBy => $composableBuilder(
      column: $table.updatedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reversalOfTransactionId => $composableBuilder(
      column: $table.reversalOfTransactionId,
      builder: (column) => ColumnOrderings(column));

  $$CompaniesTableOrderingComposer get companyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableOrderingComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TransactionCategoriesTableOrderingComposer get categoryId {
    final $$TransactionCategoriesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.transactionCategories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionCategoriesTableOrderingComposer(
                  $db: $db,
                  $table: $db.transactionCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableOrderingComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TruckDealsTableOrderingComposer get dealId {
    final $$TruckDealsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dealId,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableOrderingComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaymentAccountsTableOrderingComposer get accountId {
    final $$PaymentAccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.paymentAccounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentAccountsTableOrderingComposer(
              $db: $db,
              $table: $db.paymentAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehicleComponentsTableOrderingComposer get componentId {
    final $$VehicleComponentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.componentId,
        referencedTable: $db.vehicleComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehicleComponentsTableOrderingComposer(
              $db: $db,
              $table: $db.vehicleComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get referenceNo => $composableBuilder(
      column: $table.referenceNo, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get reversalOfTransactionId => $composableBuilder(
      column: $table.reversalOfTransactionId, builder: (column) => column);

  $$CompaniesTableAnnotationComposer get companyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.companyId,
        referencedTable: $db.companies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompaniesTableAnnotationComposer(
              $db: $db,
              $table: $db.companies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TransactionCategoriesTableAnnotationComposer get categoryId {
    final $$TransactionCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.transactionCategories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TruckDealsTableAnnotationComposer get dealId {
    final $$TruckDealsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dealId,
        referencedTable: $db.truckDeals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TruckDealsTableAnnotationComposer(
              $db: $db,
              $table: $db.truckDeals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaymentAccountsTableAnnotationComposer get accountId {
    final $$PaymentAccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.paymentAccounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentAccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.paymentAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehicleComponentsTableAnnotationComposer get componentId {
    final $$VehicleComponentsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.componentId,
            referencedTable: $db.vehicleComponents,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$VehicleComponentsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.vehicleComponents,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> attachmentsRefs<T extends Object>(
      Expression<T> Function($$AttachmentsTableAnnotationComposer a) f) {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function(
        {bool companyId,
        bool categoryId,
        bool personId,
        bool vehicleId,
        bool tripId,
        bool dealId,
        bool accountId,
        bool componentId,
        bool attachmentsRefs})> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> companyId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int?> personId = const Value.absent(),
            Value<int?> vehicleId = const Value.absent(),
            Value<int?> tripId = const Value.absent(),
            Value<int?> dealId = const Value.absent(),
            Value<int?> accountId = const Value.absent(),
            Value<int?> componentId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String?> referenceNo = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> updatedBy = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int?> reversalOfTransactionId = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            companyId: companyId,
            categoryId: categoryId,
            personId: personId,
            vehicleId: vehicleId,
            tripId: tripId,
            dealId: dealId,
            accountId: accountId,
            componentId: componentId,
            date: date,
            amount: amount,
            direction: direction,
            paymentMethod: paymentMethod,
            referenceNo: referenceNo,
            notes: notes,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedBy: updatedBy,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            reversalOfTransactionId: reversalOfTransactionId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int companyId,
            required int categoryId,
            Value<int?> personId = const Value.absent(),
            Value<int?> vehicleId = const Value.absent(),
            Value<int?> tripId = const Value.absent(),
            Value<int?> dealId = const Value.absent(),
            Value<int?> accountId = const Value.absent(),
            Value<int?> componentId = const Value.absent(),
            required DateTime date,
            required double amount,
            required String direction,
            Value<String> paymentMethod = const Value.absent(),
            Value<String?> referenceNo = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> updatedBy = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int?> reversalOfTransactionId = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            companyId: companyId,
            categoryId: categoryId,
            personId: personId,
            vehicleId: vehicleId,
            tripId: tripId,
            dealId: dealId,
            accountId: accountId,
            componentId: componentId,
            date: date,
            amount: amount,
            direction: direction,
            paymentMethod: paymentMethod,
            referenceNo: referenceNo,
            notes: notes,
            createdBy: createdBy,
            createdAt: createdAt,
            updatedBy: updatedBy,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            reversalOfTransactionId: reversalOfTransactionId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {companyId = false,
              categoryId = false,
              personId = false,
              vehicleId = false,
              tripId = false,
              dealId = false,
              accountId = false,
              componentId = false,
              attachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (attachmentsRefs) db.attachments],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (companyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.companyId,
                    referencedTable:
                        $$TransactionsTableReferences._companyIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._companyIdTable(db).id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$TransactionsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (personId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.personId,
                    referencedTable:
                        $$TransactionsTableReferences._personIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._personIdTable(db).id,
                  ) as T;
                }
                if (vehicleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vehicleId,
                    referencedTable:
                        $$TransactionsTableReferences._vehicleIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._vehicleIdTable(db).id,
                  ) as T;
                }
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable:
                        $$TransactionsTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._tripIdTable(db).id,
                  ) as T;
                }
                if (dealId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.dealId,
                    referencedTable:
                        $$TransactionsTableReferences._dealIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._dealIdTable(db).id,
                  ) as T;
                }
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable:
                        $$TransactionsTableReferences._accountIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._accountIdTable(db).id,
                  ) as T;
                }
                if (componentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.componentId,
                    referencedTable:
                        $$TransactionsTableReferences._componentIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._componentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (attachmentsRefs)
                    await $_getPrefetchedData<Transaction, $TransactionsTable,
                            Attachment>(
                        currentTable: table,
                        referencedTable: $$TransactionsTableReferences
                            ._attachmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TransactionsTableReferences(db, table, p0)
                                .attachmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.transactionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function(
        {bool companyId,
        bool categoryId,
        bool personId,
        bool vehicleId,
        bool tripId,
        bool dealId,
        bool accountId,
        bool componentId,
        bool attachmentsRefs})>;
typedef $$AuditLogsTableCreateCompanionBuilder = AuditLogsCompanion Function({
  Value<int> id,
  Value<int?> transactionId,
  required String action,
  Value<String?> oldValueJson,
  Value<String?> newValueJson,
  required String userId,
  Value<DateTime> timestamp,
});
typedef $$AuditLogsTableUpdateCompanionBuilder = AuditLogsCompanion Function({
  Value<int> id,
  Value<int?> transactionId,
  Value<String> action,
  Value<String?> oldValueJson,
  Value<String?> newValueJson,
  Value<String> userId,
  Value<DateTime> timestamp,
});

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get oldValueJson => $composableBuilder(
      column: $table.oldValueJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get newValueJson => $composableBuilder(
      column: $table.newValueJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get oldValueJson => $composableBuilder(
      column: $table.oldValueJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get newValueJson => $composableBuilder(
      column: $table.newValueJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get oldValueJson => $composableBuilder(
      column: $table.oldValueJson, builder: (column) => column);

  GeneratedColumn<String> get newValueJson => $composableBuilder(
      column: $table.newValueJson, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$AuditLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuditLogsTable,
    AuditLog,
    $$AuditLogsTableFilterComposer,
    $$AuditLogsTableOrderingComposer,
    $$AuditLogsTableAnnotationComposer,
    $$AuditLogsTableCreateCompanionBuilder,
    $$AuditLogsTableUpdateCompanionBuilder,
    (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
    AuditLog,
    PrefetchHooks Function()> {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> transactionId = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String?> oldValueJson = const Value.absent(),
            Value<String?> newValueJson = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              AuditLogsCompanion(
            id: id,
            transactionId: transactionId,
            action: action,
            oldValueJson: oldValueJson,
            newValueJson: newValueJson,
            userId: userId,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> transactionId = const Value.absent(),
            required String action,
            Value<String?> oldValueJson = const Value.absent(),
            Value<String?> newValueJson = const Value.absent(),
            required String userId,
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              AuditLogsCompanion.insert(
            id: id,
            transactionId: transactionId,
            action: action,
            oldValueJson: oldValueJson,
            newValueJson: newValueJson,
            userId: userId,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuditLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuditLogsTable,
    AuditLog,
    $$AuditLogsTableFilterComposer,
    $$AuditLogsTableOrderingComposer,
    $$AuditLogsTableAnnotationComposer,
    $$AuditLogsTableCreateCompanionBuilder,
    $$AuditLogsTableUpdateCompanionBuilder,
    (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
    AuditLog,
    PrefetchHooks Function()>;
typedef $$AttachmentsTableCreateCompanionBuilder = AttachmentsCompanion
    Function({
  Value<int> id,
  Value<int?> transactionId,
  Value<int?> vehicleId,
  Value<int?> personId,
  required String fileUrl,
  Value<String> fileType,
  Value<String> uploadedBy,
  Value<DateTime> uploadedAt,
});
typedef $$AttachmentsTableUpdateCompanionBuilder = AttachmentsCompanion
    Function({
  Value<int> id,
  Value<int?> transactionId,
  Value<int?> vehicleId,
  Value<int?> personId,
  Value<String> fileUrl,
  Value<String> fileType,
  Value<String> uploadedBy,
  Value<DateTime> uploadedAt,
});

final class $$AttachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment> {
  $$AttachmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias($_aliasNameGenerator(
          db.attachments.transactionId, db.transactions.id));

  $$TransactionsTableProcessedTableManager? get transactionId {
    final $_column = $_itemColumn<int>('transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias(
          $_aliasNameGenerator(db.attachments.vehicleId, db.vehicles.id));

  $$VehiclesTableProcessedTableManager? get vehicleId {
    final $_column = $_itemColumn<int>('vehicle_id');
    if ($_column == null) return null;
    final manager = $$VehiclesTableTableManager($_db, $_db.vehicles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PeopleTable _personIdTable(_$AppDatabase db) => db.people
      .createAlias($_aliasNameGenerator(db.attachments.personId, db.people.id));

  $$PeopleTableProcessedTableManager? get personId {
    final $_column = $_itemColumn<int>('person_id');
    if ($_column == null) return null;
    final manager = $$PeopleTableTableManager($_db, $_db.people)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileUrl => $composableBuilder(
      column: $table.fileUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileType => $composableBuilder(
      column: $table.fileType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploadedBy => $composableBuilder(
      column: $table.uploadedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => ColumnFilters(column));

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableFilterComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableFilterComposer get personId {
    final $$PeopleTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableFilterComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileUrl => $composableBuilder(
      column: $table.fileUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileType => $composableBuilder(
      column: $table.fileType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploadedBy => $composableBuilder(
      column: $table.uploadedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => ColumnOrderings(column));

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableOrderingComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableOrderingComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableOrderingComposer get personId {
    final $$PeopleTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableOrderingComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<String> get uploadedBy => $composableBuilder(
      column: $table.uploadedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vehicleId,
        referencedTable: $db.vehicles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VehiclesTableAnnotationComposer(
              $db: $db,
              $table: $db.vehicles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PeopleTableAnnotationComposer get personId {
    final $$PeopleTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.people,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PeopleTableAnnotationComposer(
              $db: $db,
              $table: $db.people,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttachmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableAnnotationComposer,
    $$AttachmentsTableCreateCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder,
    (Attachment, $$AttachmentsTableReferences),
    Attachment,
    PrefetchHooks Function(
        {bool transactionId, bool vehicleId, bool personId})> {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> transactionId = const Value.absent(),
            Value<int?> vehicleId = const Value.absent(),
            Value<int?> personId = const Value.absent(),
            Value<String> fileUrl = const Value.absent(),
            Value<String> fileType = const Value.absent(),
            Value<String> uploadedBy = const Value.absent(),
            Value<DateTime> uploadedAt = const Value.absent(),
          }) =>
              AttachmentsCompanion(
            id: id,
            transactionId: transactionId,
            vehicleId: vehicleId,
            personId: personId,
            fileUrl: fileUrl,
            fileType: fileType,
            uploadedBy: uploadedBy,
            uploadedAt: uploadedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> transactionId = const Value.absent(),
            Value<int?> vehicleId = const Value.absent(),
            Value<int?> personId = const Value.absent(),
            required String fileUrl,
            Value<String> fileType = const Value.absent(),
            Value<String> uploadedBy = const Value.absent(),
            Value<DateTime> uploadedAt = const Value.absent(),
          }) =>
              AttachmentsCompanion.insert(
            id: id,
            transactionId: transactionId,
            vehicleId: vehicleId,
            personId: personId,
            fileUrl: fileUrl,
            fileType: fileType,
            uploadedBy: uploadedBy,
            uploadedAt: uploadedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AttachmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {transactionId = false, vehicleId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (transactionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.transactionId,
                    referencedTable:
                        $$AttachmentsTableReferences._transactionIdTable(db),
                    referencedColumn:
                        $$AttachmentsTableReferences._transactionIdTable(db).id,
                  ) as T;
                }
                if (vehicleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vehicleId,
                    referencedTable:
                        $$AttachmentsTableReferences._vehicleIdTable(db),
                    referencedColumn:
                        $$AttachmentsTableReferences._vehicleIdTable(db).id,
                  ) as T;
                }
                if (personId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.personId,
                    referencedTable:
                        $$AttachmentsTableReferences._personIdTable(db),
                    referencedColumn:
                        $$AttachmentsTableReferences._personIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AttachmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableAnnotationComposer,
    $$AttachmentsTableCreateCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder,
    (Attachment, $$AttachmentsTableReferences),
    Attachment,
    PrefetchHooks Function(
        {bool transactionId, bool vehicleId, bool personId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CompaniesTableTableManager get companies =>
      $$CompaniesTableTableManager(_db, _db.companies);
  $$PeopleTableTableManager get people =>
      $$PeopleTableTableManager(_db, _db.people);
  $$PersonRolesTableTableManager get personRoles =>
      $$PersonRolesTableTableManager(_db, _db.personRoles);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db, _db.vehicles);
  $$VehicleComponentsTableTableManager get vehicleComponents =>
      $$VehicleComponentsTableTableManager(_db, _db.vehicleComponents);
  $$TransactionCategoriesTableTableManager get transactionCategories =>
      $$TransactionCategoriesTableTableManager(_db, _db.transactionCategories);
  $$PaymentAccountsTableTableManager get paymentAccounts =>
      $$PaymentAccountsTableTableManager(_db, _db.paymentAccounts);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
  $$TruckDealsTableTableManager get truckDeals =>
      $$TruckDealsTableTableManager(_db, _db.truckDeals);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
}
