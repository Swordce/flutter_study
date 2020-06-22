import 'package:study/app/guyun/bean/all_author.dart';

class SearchAuthorBean {
  List<Authors> result;

  SearchAuthorBean({this.result});

  SearchAuthorBean.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Authors>();
      json['result'].forEach((v) {
        result.add(new Authors.fromJson(v));
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