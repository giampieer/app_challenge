import 'package:app_challenge/modules/elements/domain/dtos/info_dto.dart';
import 'package:app_challenge/modules/elements/domain/dtos/results_dto.dart';

class ElementsDto {
  InfoDto? info;
  List<ResultsDto>? results;

  ElementsDto({this.info, this.results});
}
