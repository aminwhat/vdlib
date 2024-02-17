// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TestModel extends _TestModel
    with RealmEntity, RealmObjectBase, RealmObject {
  TestModel(
    ObjectId id,
  ) {
    RealmObjectBase.set(this, 'id', id);
  }

  TestModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  Stream<RealmObjectChanges<TestModel>> get changes =>
      RealmObjectBase.getChanges<TestModel>(this);

  @override
  TestModel freeze() => RealmObjectBase.freezeObject<TestModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TestModel._);
    return const SchemaObject(ObjectType.realmObject, TestModel, 'TestModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
    ]);
  }
}
