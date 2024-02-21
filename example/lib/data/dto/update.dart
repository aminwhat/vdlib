import 'package:equatable/equatable.dart';

class UpdateDto extends Equatable {
  final String name;

  final String token;

  final String version;

  final String downloadUri;

  const UpdateDto({
    required this.name,
    required this.token,
    required this.version,
    required this.downloadUri,
  });

  factory UpdateDto.fromJson(dynamic json) {
    return UpdateDto(
      name: json['name'],
      token: json['token'],
      version: json['version'],
      downloadUri: json['download_uri'],
    );
  }

  @override
  List<Object?> get props => [name, token, version, downloadUri];
}
