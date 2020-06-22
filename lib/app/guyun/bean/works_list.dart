import 'package:study/app/guyun/bean/search_works.dart';

class WorksListBean {
  List<Work> result;

  WorksListBean({this.result});

  WorksListBean.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Work>();
      json['result'].forEach((v) {
        result.add(new Work.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HighlightedAt {
  String sType;
  String iso;

  HighlightedAt({this.sType, this.iso});

  HighlightedAt.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['iso'] = this.iso;
    return data;
  }
}

class Author {
  String sType;
  String className;
  String objectId;

  Author({this.sType, this.className, this.objectId});

  Author.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    className = json['className'];
    objectId = json['objectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['className'] = this.className;
    data['objectId'] = this.objectId;
    return data;
  }
}
