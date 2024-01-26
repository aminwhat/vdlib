// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyvalue.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class KeyValue extends _KeyValue
    with RealmEntity, RealmObjectBase, RealmObject {
  KeyValue(
    String key, {
    String? value,
  }) {
    RealmObjectBase.set(this, 'key', key);
    RealmObjectBase.set(this, 'value', value);
  }

  KeyValue._();

  @override
  String get key => RealmObjectBase.get<String>(this, 'key') as String;
  @override
  set key(String value) => throw RealmUnsupportedSetError();

  @override
  String? get value => RealmObjectBase.get<String>(this, 'value') as String?;
  @override
  set value(String? value) => RealmObjectBase.set(this, 'value', value);

  @override
  Stream<RealmObjectChanges<KeyValue>> get changes =>
      RealmObjectBase.getChanges<KeyValue>(this);

  @override
  KeyValue freeze() => RealmObjectBase.freezeObject<KeyValue>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(KeyValue._);
    return const SchemaObject(ObjectType.realmObject, KeyValue, 'KeyValue', [
      SchemaProperty('key', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('value', RealmPropertyType.string, optional: true),
    ]);
  }
}
