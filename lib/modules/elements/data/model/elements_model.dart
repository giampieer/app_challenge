import 'package:app_challenge/modules/elements/data/model/info_model.dart';
import 'package:app_challenge/modules/elements/data/model/results_model.dart';

class ElementsModel {
  InfoModel? info;
  List<ResultsModel>? results;

  ElementsModel({this.info, this.results});

  ElementsModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? InfoModel.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <ResultsModel>[];
      json['results'].forEach((v) {
        results!.add(ResultsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
