class AllAuthorBean {
  AllAuthor result;

  AllAuthorBean({this.result});

  AllAuthorBean.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new AllAuthor.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class AllAuthor {
  dynamic count;
  List<Authors> authors;

  AllAuthor({this.count, this.authors});

  AllAuthor.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['authors'] != null) {
      authors = new List<Authors>();
      json['authors'].forEach((v) {
        authors.add(new Authors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.authors != null) {
      data['authors'] = this.authors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authors {
  bool hasProcessedWorks;
  String baiduWiki;
  String nameTr;
  int likersCount;
  int authorId;
  String desc;
  int viewsCount;
  String dynasty;
  int worksCount;
  String name;
  int worksQuCount;
  String dynastyTr;
  int worksShiCount;
  String birthYear;
  String descTr;
  String deathYear;
  int worksFuCount;
  int worksWenCount;
  int worksCiCount;
  String objectId;
  String createdAt;
  String updatedAt;
  String sType;
  String className;

  Authors(
      {this.hasProcessedWorks,
        this.baiduWiki,
        this.nameTr,
        this.likersCount,
        this.authorId,
        this.desc,
        this.viewsCount,
        this.dynasty,
        this.worksCount,
        this.name,
        this.worksQuCount,
        this.dynastyTr,
        this.worksShiCount,
        this.birthYear,
        this.descTr,
        this.deathYear,
        this.worksFuCount,
        this.worksWenCount,
        this.worksCiCount,
        this.objectId,
        this.createdAt,
        this.updatedAt,
        this.sType,
        this.className});

  Authors.fromJson(Map<String, dynamic> json) {
    hasProcessedWorks = json['hasProcessedWorks'];
    baiduWiki = json['baiduWiki'];
    nameTr = json['nameTr'];
    likersCount = json['likersCount'];
    authorId = json['authorId'];
    desc = json['desc'];
    viewsCount = json['viewsCount'];
    dynasty = json['dynasty'];
    worksCount = json['worksCount'];
    name = json['name'];
    worksQuCount = json['worksQuCount'];
    dynastyTr = json['dynastyTr'];
    worksShiCount = json['worksShiCount'];
    birthYear = json['birthYear'];
    descTr = json['descTr'];
    deathYear = json['deathYear'];
    worksFuCount = json['worksFuCount'];
    worksWenCount = json['worksWenCount'];
    worksCiCount = json['worksCiCount'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sType = json['__type'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasProcessedWorks'] = this.hasProcessedWorks;
    data['baiduWiki'] = this.baiduWiki;
    data['nameTr'] = this.nameTr;
    data['likersCount'] = this.likersCount;
    data['authorId'] = this.authorId;
    data['desc'] = this.desc;
    data['viewsCount'] = this.viewsCount;
    data['dynasty'] = this.dynasty;
    data['worksCount'] = this.worksCount;
    data['name'] = this.name;
    data['worksQuCount'] = this.worksQuCount;
    data['dynastyTr'] = this.dynastyTr;
    data['worksShiCount'] = this.worksShiCount;
    data['birthYear'] = this.birthYear;
    data['descTr'] = this.descTr;
    data['deathYear'] = this.deathYear;
    data['worksFuCount'] = this.worksFuCount;
    data['worksWenCount'] = this.worksWenCount;
    data['worksCiCount'] = this.worksCiCount;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__type'] = this.sType;
    data['className'] = this.className;
    return data;
  }
}
