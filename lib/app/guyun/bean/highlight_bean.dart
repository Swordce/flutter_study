import 'package:study/app/guyun/bean/search_works.dart';

class HighlightContentBean {
  HighlightBean result;

  HighlightContentBean({this.result});

  HighlightContentBean.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new HighlightBean.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class HighlightBean {
  List<Quotes> quotes;

  HighlightBean({this.quotes});

  HighlightBean.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = new List<Quotes>();
      json['quotes'].forEach((v) {
        quotes.add(new Quotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quotes {
  String authorName;
  int viewsCount;
  String dynasty;
  String quoteTr;
  Work work;
  int quoteId;
  Author author;
  int likesCount;
  String quote;
  String kind;
  String objectId;
  String createdAt;
  String updatedAt;
  String sType;
  String className;

  Quotes(
      {this.authorName,
        this.viewsCount,
        this.dynasty,
        this.quoteTr,
        this.work,
        this.quoteId,
        this.author,
        this.likesCount,
        this.quote,
        this.kind,
        this.objectId,
        this.createdAt,
        this.updatedAt,
        this.sType,
        this.className});

  Quotes.fromJson(Map<String, dynamic> json) {
    authorName = json['authorName'];
    viewsCount = json['viewsCount'];
    dynasty = json['dynasty'];
    quoteTr = json['quoteTr'];
    work = json['work'] != null ? new Work.fromJson(json['work']) : null;
    quoteId = json['quoteId'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    likesCount = json['likesCount'];
    quote = json['quote'];
    kind = json['kind'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sType = json['__type'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorName'] = this.authorName;
    data['viewsCount'] = this.viewsCount;
    data['dynasty'] = this.dynasty;
    data['quoteTr'] = this.quoteTr;
    if (this.work != null) {
      data['work'] = this.work.toJson();
    }
    data['quoteId'] = this.quoteId;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['likesCount'] = this.likesCount;
    data['quote'] = this.quote;
    data['kind'] = this.kind;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__type'] = this.sType;
    data['className'] = this.className;
    return data;
  }
}

