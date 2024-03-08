import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/keyvalue.dart';

export 'keyvalue.dart';

class VKvDB {
  static late VConnection vConnection;

  late final Realm realm;
  late List<KeyValue> changes;

  VKvDB(VKvDBOptions options) {
    late final Configuration config;

    String? path;

    if (Platform.isWindows) {
      path = (options.path == null
          ? "VDLib/kv/kv.realm"
          : "VDLib/${options.path}/kv/kv.realm");
    }

    switch (options.vKvType) {
      case VKvType.inMemory:
        config = Configuration.inMemory(
          [KeyValue.schema],
          path: path,
        );

        break;
      case VKvType.local:
        config = Configuration.local(
          [KeyValue.schema],
          shouldDeleteIfMigrationNeeded: options.shouldDeleteIfMigrationNeeded,
          schemaVersion: options.schemaVersion,
          path: path,
        );
        break;
    }

    realm = Realm(config);
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
  final VKvType vKvType;
  final String? path;

  const VKvDBOptions({
    this.shouldDeleteIfMigrationNeeded = true,
    this.schemaVersion = 0,
    this.vKvType = VKvType.local,
    this.path,
  });

  @override
  List<Object?> get props => [
        shouldDeleteIfMigrationNeeded,
        schemaVersion,
        vKvType,
        path,
      ];
}

enum VKvType { inMemory, local }
