import 'package:app_challenge/modules/elements/domain/dtos/origin_dto.dart';

class ResultsDto {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  OriginDto? origin;
  OriginDto? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  ResultsDto(
      {this.id = 0,
      this.name = '',
      this.status = '',
      this.species = '',
      this.type = '',
      this.gender = '',
      this.origin,
      this.location,
      this.image = '',
      this.episode,
      this.url = '',
      this.created = ''});
}
