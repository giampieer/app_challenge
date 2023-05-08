import 'package:app_challenge/modules/elements/data/model/origin_model.dart';

class ResultsModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  OriginModel? origin;
  OriginModel? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  ResultsModel(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  ResultsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    status = json['status'] ?? '';
    species = json['species'] ?? '';
    type = json['type'] ?? '';
    gender = json['gender'] ?? '';
    origin =
        json['origin'] != null ? OriginModel.fromJson(json['origin']) : null;
    location = json['location'] != null
        ? OriginModel.fromJson(json['location'])
        : null;
    image = json['image'] ?? '';
    episode = json['episode'].cast<String>();
    url = json['url'] ?? '';
    created = json['created'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}
