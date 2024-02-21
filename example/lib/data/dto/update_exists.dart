import 'package:example/data/dto/update.dart';
import 'package:equatable/equatable.dart';

class UpdateExists extends Equatable {
  final bool exists;
  final UpdateDto? update;

  const UpdateExists({
    required this.exists,
    required this.update,
  });

  factory UpdateExists.fromJson(dynamic json) {
    UpdateDto? updateDto;
    try {
      updateDto = UpdateDto.fromJson(json['update']);
    } catch (e) {
      updateDto = null;
    }
    return UpdateExists(
      exists: json['exists'],
      update: updateDto,
    );
  }

  @override
  List<Object?> get props => [exists, update];
}
