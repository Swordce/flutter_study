class AllCollectionsBean {
  String _title;
  List<Result> result;

  AllCollectionsBean({this.result});


  String get title => _title;

  set title(String value) {
    _title = value;
  }

  AllCollectionsBean.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
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

class Result {
  int collectionId;
  String desc;
  int studyPlansCount;
  int childOrder;
  String name;
  String startDate;
  String cover;
  int kindId;
  String shortDesc;
  int order;
  String shopUrl;
  String objectId;
  String createdAt;
  String updatedAt;
  String sType;
  String className;
  String date;
  int weappOrder;
  String endDate;

  Result(
      {this.collectionId,
        this.desc,
        this.studyPlansCount,
        this.childOrder,
        this.name,
        this.startDate,
        this.cover,
        this.kindId,
        this.shortDesc,
        this.order,
        this.shopUrl,
        this.objectId,
        this.createdAt,
        this.updatedAt,
        this.sType,
        this.className,
        this.date,
        this.weappOrder,
        this.endDate});

  Result.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    desc = json['desc'];
    studyPlansCount = json['studyPlansCount'];
    childOrder = json['childOrder'];
    name = json['name'];
    startDate = json['startDate'];
    cover = json['cover'];
    kindId = json['kindId'];
    shortDesc = json['shortDesc'];
    order = json['order'];
    shopUrl = json['shopUrl'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sType = json['__type'];
    className = json['className'];
    date = json['date'];
    weappOrder = json['weappOrder'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['desc'] = this.desc;
    data['studyPlansCount'] = this.studyPlansCount;
    data['childOrder'] = this.childOrder;
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['cover'] = this.cover;
    data['kindId'] = this.kindId;
    data['shortDesc'] = this.shortDesc;
    data['order'] = this.order;
    data['shopUrl'] = this.shopUrl;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__type'] = this.sType;
    data['className'] = this.className;
    data['date'] = this.date;
    data['weappOrder'] = this.weappOrder;
    data['endDate'] = this.endDate;
    return data;
  }
}
