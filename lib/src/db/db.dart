import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/keyvalue.dart';

export 'keyvalue.dart';

class VDB<T extends RealmObject> {
  static late VConnection vConnection;

  late final Realm realm;
  late List<T> changes;
  VDB(Configuration config) {
    realm = Realm(config);
    changes = realm.all<T>().toList();
  }

  void add(T object) {
    realm.write(() {
      realm.add<T>(object, update: true);
    });
    changes = realm.all<T>().toList();
  }

  void delete(T object) {
    realm.write(() {
      realm.delete<T>(object);
    });
    changes = realm.all<T>().toList();
  }

  void dispose() {
    realm.close();
  }
}

class VKvDB {
  static late VConnection vConnection;
  static String? path;
  static String? customPath;

  late final Realm realm;
  late List<KeyValue> changes;

  VKvDB(VKvDBOptions options) : assert(!(path != null && customPath != null)) {
    realm = Realm(options.onConfig?.call(KeyValue.schema) ??
        Configuration.local(
          [KeyValue.schema],
          shouldDeleteIfMigrationNeeded: options.shouldDeleteIfMigrationNeeded,
          schemaVersion: options.schemaVersion,
          path: customPath == null
              ? (path == null ? "VDLib/kv/kv.realm" : "VDLib/$path/kv/kv.realm")
              : "$customPath/kv/kv.realm",
        ));
    changes = realm.all<KeyValue>().toList();
  }

  void set(KeyValue keyValue) {
    realm.write(() {
      realm.add<KeyValue>(keyValue, update: true);
    });
    changes = realm.all<KeyValue>().toList();
  }

  String? get(String key) {
    return realm.find<KeyValue>(key)?.value;
  }

  void dispose() {
    realm.close();
  }
}

class VKvDBOptions extends Equatable {
  final bool shouldDeleteIfMigrationNeeded;
  final int schemaVersion;
  final Configuration Function(SchemaObject schema)? onConfig;

  const VKvDBOptions({
    this.shouldDeleteIfMigrationNeeded = true,
    this.schemaVersion = 0,
    this.onConfig,
  });

  @override
  List<Object?> get props => [
        shouldDeleteIfMigrationNeeded,
        schemaVersion,
        onConfig,
      ];
}
