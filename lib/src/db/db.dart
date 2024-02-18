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

  late final Realm realm;
  late List<KeyValue> changes;

  VKvDB(VKvDBOptions options) {
    realm = Realm(Configuration.local(
      [KeyValue.schema],
      shouldDeleteIfMigrationNeeded: options.shouldDeleteIfMigrationNeeded,
      schemaVersion: options.schemaVersion,
      path: options.disablePath
          ? null
          : options.path == null
              ? '/${options.subPath}/'
              : '/${options.subPath}/${options.path}/',
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
    return realm.find<KeyValue>('appVersion')?.value;
  }

  void dispose() {
    realm.close();
  }
}

class VKvDBOptions extends Equatable {
  final bool shouldDeleteIfMigrationNeeded;
  final int schemaVersion;

  /// Simple word after special key value path
  final String? path;
  final bool disablePath;
  final String subPath;

  const VKvDBOptions({
    this.shouldDeleteIfMigrationNeeded = true,
    this.schemaVersion = 0,
    this.subPath = '/kv/',
    this.path,
    this.disablePath = false,
  });

  @override
  List<Object?> get props => [
        shouldDeleteIfMigrationNeeded,
        schemaVersion,
        path,
        disablePath,
        subPath,
      ];
}
