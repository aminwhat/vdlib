import 'package:equatable/equatable.dart';

class BasicInfoDto extends Equatable {
  final String username;

  const BasicInfoDto({
    required this.username,
  });

  factory BasicInfoDto.fromJson(dynamic json) {
    return BasicInfoDto(
      username: json['username'],
    );
  }

  @override
  List<Object?> get props => [username];
}
