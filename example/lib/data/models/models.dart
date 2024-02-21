import 'package:realm/realm.dart';

part 'models.g.dart';

@RealmModel(ObjectType.embeddedObject)
class _Date {
  late int year;
  late int month;
  late int day;
}

@RealmModel()
class _Project {
  @PrimaryKey()
  late ObjectId id;

  late String title;

  late String? description;

  late _Date? startDate;

  late _Date? endDate;

  late _ProjectType? projectType;

  late int? index;
}

@RealmModel(ObjectType.embeddedObject)
class _ProjectType {
  late bool? cloud = false;

  late String? theType = 'DATABASE';
}

@RealmModel()
class _Info {
  @PrimaryKey()
  late String key;
  late String uri;
}

@RealmModel()
class _User {
  @PrimaryKey()
  late ObjectId id;

  late String? name;

  late String? phoneNumber;

  late String? nationalId;

  late String? email;

  late String? username;
}
