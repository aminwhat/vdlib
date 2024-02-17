import 'package:realm/realm.dart';

part 'models.g.dart';

@RealmModel()
class _TestModel {
  @PrimaryKey()
  late ObjectId id;
}
