// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'models.dart';

// // **************************************************************************
// // RealmObjectGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// class Date extends _Date with RealmEntity, RealmObjectBase, EmbeddedObject {
//   Date(
//     int year,
//     int month,
//     int day,
//   ) {
//     RealmObjectBase.set(this, 'year', year);
//     RealmObjectBase.set(this, 'month', month);
//     RealmObjectBase.set(this, 'day', day);
//   }

//   Date._();

//   @override
//   int get year => RealmObjectBase.get<int>(this, 'year') as int;
//   @override
//   set year(int value) => RealmObjectBase.set(this, 'year', value);

//   @override
//   int get month => RealmObjectBase.get<int>(this, 'month') as int;
//   @override
//   set month(int value) => RealmObjectBase.set(this, 'month', value);

//   @override
//   int get day => RealmObjectBase.get<int>(this, 'day') as int;
//   @override
//   set day(int value) => RealmObjectBase.set(this, 'day', value);

//   @override
//   Stream<RealmObjectChanges<Date>> get changes =>
//       RealmObjectBase.getChanges<Date>(this);

//   @override
//   Date freeze() => RealmObjectBase.freezeObject<Date>(this);

//   static SchemaObject get schema => _schema ??= _initSchema();
//   static SchemaObject? _schema;
//   static SchemaObject _initSchema() {
//     RealmObjectBase.registerFactory(Date._);
//     return const SchemaObject(ObjectType.embeddedObject, Date, 'Date', [
//       SchemaProperty('year', RealmPropertyType.int),
//       SchemaProperty('month', RealmPropertyType.int),
//       SchemaProperty('day', RealmPropertyType.int),
//     ]);
//   }
// }

// class Project extends _Project with RealmEntity, RealmObjectBase, RealmObject {
//   Project(
//     ObjectId id,
//     String title, {
//     String? description,
//     Date? startDate,
//     Date? endDate,
//     ProjectType? projectType,
//     int? index,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'title', title);
//     RealmObjectBase.set(this, 'description', description);
//     RealmObjectBase.set(this, 'startDate', startDate);
//     RealmObjectBase.set(this, 'endDate', endDate);
//     RealmObjectBase.set(this, 'projectType', projectType);
//     RealmObjectBase.set(this, 'index', index);
//   }

//   Project._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String get title => RealmObjectBase.get<String>(this, 'title') as String;
//   @override
//   set title(String value) => RealmObjectBase.set(this, 'title', value);

//   @override
//   String? get description =>
//       RealmObjectBase.get<String>(this, 'description') as String?;
//   @override
//   set description(String? value) =>
//       RealmObjectBase.set(this, 'description', value);

//   @override
//   Date? get startDate => RealmObjectBase.get<Date>(this, 'startDate') as Date?;
//   @override
//   set startDate(covariant Date? value) =>
//       RealmObjectBase.set(this, 'startDate', value);

//   @override
//   Date? get endDate => RealmObjectBase.get<Date>(this, 'endDate') as Date?;
//   @override
//   set endDate(covariant Date? value) =>
//       RealmObjectBase.set(this, 'endDate', value);

//   @override
//   ProjectType? get projectType =>
//       RealmObjectBase.get<ProjectType>(this, 'projectType') as ProjectType?;
//   @override
//   set projectType(covariant ProjectType? value) =>
//       RealmObjectBase.set(this, 'projectType', value);

//   @override
//   int? get index => RealmObjectBase.get<int>(this, 'index') as int?;
//   @override
//   set index(int? value) => RealmObjectBase.set(this, 'index', value);

//   @override
//   Stream<RealmObjectChanges<Project>> get changes =>
//       RealmObjectBase.getChanges<Project>(this);

//   @override
//   Project freeze() => RealmObjectBase.freezeObject<Project>(this);

//   static SchemaObject get schema => _schema ??= _initSchema();
//   static SchemaObject? _schema;
//   static SchemaObject _initSchema() {
//     RealmObjectBase.registerFactory(Project._);
//     return const SchemaObject(ObjectType.realmObject, Project, 'Project', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('title', RealmPropertyType.string),
//       SchemaProperty('description', RealmPropertyType.string, optional: true),
//       SchemaProperty('startDate', RealmPropertyType.object,
//           optional: true, linkTarget: 'Date'),
//       SchemaProperty('endDate', RealmPropertyType.object,
//           optional: true, linkTarget: 'Date'),
//       SchemaProperty('projectType', RealmPropertyType.object,
//           optional: true, linkTarget: 'ProjectType'),
//       SchemaProperty('index', RealmPropertyType.int, optional: true),
//     ]);
//   }
// }

// class ProjectType extends _ProjectType
//     with RealmEntity, RealmObjectBase, EmbeddedObject {
//   static var _defaultsSet = false;

//   ProjectType({
//     bool? cloud = false,
//     String? theType = 'DATABASE',
//   }) {
//     if (!_defaultsSet) {
//       _defaultsSet = RealmObjectBase.setDefaults<ProjectType>({
//         'cloud': false,
//         'theType': 'DATABASE',
//       });
//     }
//     RealmObjectBase.set(this, 'cloud', cloud);
//     RealmObjectBase.set(this, 'theType', theType);
//   }

//   ProjectType._();

//   @override
//   bool? get cloud => RealmObjectBase.get<bool>(this, 'cloud') as bool?;
//   @override
//   set cloud(bool? value) => RealmObjectBase.set(this, 'cloud', value);

//   @override
//   String? get theType =>
//       RealmObjectBase.get<String>(this, 'theType') as String?;
//   @override
//   set theType(String? value) => RealmObjectBase.set(this, 'theType', value);

//   @override
//   Stream<RealmObjectChanges<ProjectType>> get changes =>
//       RealmObjectBase.getChanges<ProjectType>(this);

//   @override
//   ProjectType freeze() => RealmObjectBase.freezeObject<ProjectType>(this);

//   static SchemaObject get schema => _schema ??= _initSchema();
//   static SchemaObject? _schema;
//   static SchemaObject _initSchema() {
//     RealmObjectBase.registerFactory(ProjectType._);
//     return const SchemaObject(
//         ObjectType.embeddedObject, ProjectType, 'ProjectType', [
//       SchemaProperty('cloud', RealmPropertyType.bool, optional: true),
//       SchemaProperty('theType', RealmPropertyType.string, optional: true),
//     ]);
//   }
// }

// class Info extends _Info with RealmEntity, RealmObjectBase, RealmObject {
//   Info(
//     String key,
//     String uri,
//   ) {
//     RealmObjectBase.set(this, 'key', key);
//     RealmObjectBase.set(this, 'uri', uri);
//   }

//   Info._();

//   @override
//   String get key => RealmObjectBase.get<String>(this, 'key') as String;
//   @override
//   set key(String value) => RealmObjectBase.set(this, 'key', value);

//   @override
//   String get uri => RealmObjectBase.get<String>(this, 'uri') as String;
//   @override
//   set uri(String value) => RealmObjectBase.set(this, 'uri', value);

//   @override
//   Stream<RealmObjectChanges<Info>> get changes =>
//       RealmObjectBase.getChanges<Info>(this);

//   @override
//   Info freeze() => RealmObjectBase.freezeObject<Info>(this);

//   static SchemaObject get schema => _schema ??= _initSchema();
//   static SchemaObject? _schema;
//   static SchemaObject _initSchema() {
//     RealmObjectBase.registerFactory(Info._);
//     return const SchemaObject(ObjectType.realmObject, Info, 'Info', [
//       SchemaProperty('key', RealmPropertyType.string, primaryKey: true),
//       SchemaProperty('uri', RealmPropertyType.string),
//     ]);
//   }
// }

// class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
//   User(
//     ObjectId id, {
//     String? name,
//     String? phoneNumber,
//     String? nationalId,
//     String? email,
//     String? username,
//   }) {
//     RealmObjectBase.set(this, 'id', id);
//     RealmObjectBase.set(this, 'name', name);
//     RealmObjectBase.set(this, 'phoneNumber', phoneNumber);
//     RealmObjectBase.set(this, 'nationalId', nationalId);
//     RealmObjectBase.set(this, 'email', email);
//     RealmObjectBase.set(this, 'username', username);
//   }

//   User._();

//   @override
//   ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
//   @override
//   set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

//   @override
//   String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
//   @override
//   set name(String? value) => RealmObjectBase.set(this, 'name', value);

//   @override
//   String? get phoneNumber =>
//       RealmObjectBase.get<String>(this, 'phoneNumber') as String?;
//   @override
//   set phoneNumber(String? value) =>
//       RealmObjectBase.set(this, 'phoneNumber', value);

//   @override
//   String? get nationalId =>
//       RealmObjectBase.get<String>(this, 'nationalId') as String?;
//   @override
//   set nationalId(String? value) =>
//       RealmObjectBase.set(this, 'nationalId', value);

//   @override
//   String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
//   @override
//   set email(String? value) => RealmObjectBase.set(this, 'email', value);

//   @override
//   String? get username =>
//       RealmObjectBase.get<String>(this, 'username') as String?;
//   @override
//   set username(String? value) => RealmObjectBase.set(this, 'username', value);

//   @override
//   Stream<RealmObjectChanges<User>> get changes =>
//       RealmObjectBase.getChanges<User>(this);

//   @override
//   User freeze() => RealmObjectBase.freezeObject<User>(this);

//   static SchemaObject get schema => _schema ??= _initSchema();
//   static SchemaObject? _schema;
//   static SchemaObject _initSchema() {
//     RealmObjectBase.registerFactory(User._);
//     return const SchemaObject(ObjectType.realmObject, User, 'User', [
//       SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
//       SchemaProperty('name', RealmPropertyType.string, optional: true),
//       SchemaProperty('phoneNumber', RealmPropertyType.string, optional: true),
//       SchemaProperty('nationalId', RealmPropertyType.string, optional: true),
//       SchemaProperty('email', RealmPropertyType.string, optional: true),
//       SchemaProperty('username', RealmPropertyType.string, optional: true),
//     ]);
//   }
// }
