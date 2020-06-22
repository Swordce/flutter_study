class CollectionDetailBean {
  DetailInfo result;

  CollectionDetailBean({this.result});

  CollectionDetailBean.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new DetailInfo.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class DetailInfo {
  int collectionId;
  String date;
  String desc;
  int studyPlansCount;
  int childOrder;
  String name;
  String startDate;
  String cover;
  int kindId;
  int weappOrder;
  String endDate;
  String shortDesc;
  int order;
  String shopUrl;
  String objectId;
  String createdAt;
  String updatedAt;
  String sType;
  String className;

  DetailInfo(
      {this.collectionId,
        this.date,
        this.desc,
        this.studyPlansCount,
        this.childOrder,
        this.name,
        this.startDate,
        this.cover,
        this.kindId,
        this.weappOrder,
        this.endDate,
        this.shortDesc,
        this.order,
        this.shopUrl,
        this.objectId,
        this.createdAt,
        this.updatedAt,
        this.sType,
        this.className});

  DetailInfo.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    date = json['date'];
    desc = json['desc'];
    studyPlansCount = json['studyPlansCount'];
    childOrder = json['childOrder'];
    name = json['name'];
    startDate = json['startDate'];
    cover = json['cover'];
    kindId = json['kindId'];
    weappOrder = json['weappOrder'];
    endDate = json['endDate'];
    shortDesc = json['shortDesc'];
    order = json['order'];
    shopUrl = json['shopUrl'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sType = json['__type'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['date'] = this.date;
    data['desc'] = this.desc;
    data['studyPlansCount'] = this.studyPlansCount;
    data['childOrder'] = this.childOrder;
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['cover'] = this.cover;
    data['kindId'] = this.kindId;
    data['weappOrder'] = this.weappOrder;
    data['endDate'] = this.endDate;
    data['shortDesc'] = this.shortDesc;
    data['order'] = this.order;
    data['shopUrl'] = this.shopUrl;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__type'] = this.sType;
    data['className'] = this.className;
    return data;
  }
}
