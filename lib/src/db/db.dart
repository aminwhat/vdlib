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

  VKvDB({bool shouldDeleteIfMigrationNeeded = false, int schemaVersion = 0}) {
    realm = Realm(Configuration.local(
      [KeyValue.schema],
      shouldDeleteIfMigrationNeeded: shouldDeleteIfMigrationNeeded,
      schemaVersion: schemaVersion,
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
