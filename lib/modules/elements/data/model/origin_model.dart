class OriginModel {
  String? name;
  String? url;

  OriginModel({this.name, this.url});

  OriginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    url = json['url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}