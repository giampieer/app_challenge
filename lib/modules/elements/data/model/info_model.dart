class InfoModel {
  int? count;
  int? pages;
  String? next;

  InfoModel({this.count, this.pages, this.next});

  InfoModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? 0;
    pages = json['pages'] ?? 0;
    next = json['next'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    return data;
  }
}
