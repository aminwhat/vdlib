import 'package:equatable/equatable.dart';

class InfoDto extends Equatable {
  final String? key;
  final String uri;

  const InfoDto({this.key, required this.uri});

  @override
  List<Object?> get props => [key, uri];

  /// key is not supported
  factory InfoDto.fromJson(dynamic json) {
    return InfoDto(uri: json.toString());
  }
}
