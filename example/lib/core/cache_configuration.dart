import 'package:example/core/version.dart';
import 'package:realm/realm.dart';

Configuration localConfiguration(
  List<SchemaObject> schemas, {
  String? path,
  bool removePath = false,
  bool isReadOnly = false,
}) {
  return Configuration.local(
    schemas,
    path: removePath ? null : '${path ?? schemas.first.name}.realm',
    shouldDeleteIfMigrationNeeded: true,
    schemaVersion: appVersionSimple,
    isReadOnly: isReadOnly,
  );
}

Configuration memoryConfiguration(
  List<SchemaObject> schemas, {
  String? path,
  bool removePath = false,
}) {
  return Configuration.inMemory(
    schemas,
    path: removePath ? null : '${path ?? schemas.first.name}.realm',
  );
}
