import 'package:realm/realm.dart';

part 'keyvalue.g.dart';

@RealmModel()
class _KeyValue {
  @PrimaryKey()
  late final String key;

  String? value;
}
