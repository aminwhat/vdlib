import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/keyvalue.dart';

export 'keyvalue.dart';

class VKvDB {
  static late VConnection vConnection;
  static String? path;

  late final Realm realm;
  late List<KeyValue> changes;

  VKvDB(VKvDBOptions options) {
    realm = Realm(Configuration.local(
      [KeyValue.schema],
      shouldDeleteIfMigrationNeeded: options.shouldDeleteIfMigrationNeeded,
      schemaVersion: options.schemaVersion,
      path: (path == null ? "VDLib/kv/kv.realm" : "VDLib/$path/kv/kv.realm"),
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

  const VKvDBOptions({
    this.shouldDeleteIfMigrationNeeded = true,
    this.schemaVersion = 0,
  });

  @override
  List<Object?> get props => [
        shouldDeleteIfMigrationNeeded,
        schemaVersion,
      ];
}
