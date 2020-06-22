class WorksListBean {
  List<WorksList> result;

  WorksListBean({this.result});

  WorksListBean.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<WorksList>();
      json['result'].forEach((v) {
        result.add(new WorksList.fromJson(v));
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

class WorksList {
  String authorName;
  String kindCN;
  String baiduWiki;
  String translationTr;
  String introTr;
  int authorId;
  String appreciation;
  int viewsCount;
  String dynasty;
  String layout;
  String content;
  HighlightedAt highlightedAt;
  String appreciationTr;
  String masterComment;
  String dynastyTr;
  bool highlighted;
  int workId;
  String title;
  int collectionsCount;
  String authorDescTr;
  int postsCount;
  Author author;
  int likesCount;
  int listsCount;
  String contentTr;
  String titleTr;
  String kind;
  String translation;
  String masterCommentTr;
  int quotesCount;
  String intro;
  String foreword;
  String authorDesc;
  String kindCNTr;
  String annotationTr;
  String authorNameTr;
  String annotation;
  String forewordTr;
  String objectId;
  String createdAt;
  String updatedAt;
  String sType;
  String className;

  WorksList(
      {this.authorName,
        this.kindCN,
        this.baiduWiki,
        this.translationTr,
        this.introTr,
        this.authorId,
        this.appreciation,
        this.viewsCount,
        this.dynasty,
        this.layout,
        this.content,
        this.highlightedAt,
        this.appreciationTr,
        this.masterComment,
        this.dynastyTr,
        this.highlighted,
        this.workId,
        this.title,
        this.collectionsCount,
        this.authorDescTr,
        this.postsCount,
        this.author,
        this.likesCount,
        this.listsCount,
        this.contentTr,
        this.titleTr,
        this.kind,
        this.translation,
        this.masterCommentTr,
        this.quotesCount,
        this.intro,
        this.foreword,
        this.authorDesc,
        this.kindCNTr,
        this.annotationTr,
        this.authorNameTr,
        this.annotation,
        this.forewordTr,
        this.objectId,
        this.createdAt,
        this.updatedAt,
        this.sType,
        this.className});

  WorksList.fromJson(Map<String, dynamic> json) {
    authorName = json['authorName'];
    kindCN = json['kindCN'];
    baiduWiki = json['baiduWiki'];
    translationTr = json['translationTr'];
    introTr = json['introTr'];
    authorId = json['authorId'];
    appreciation = json['appreciation'];
    viewsCount = json['viewsCount'];
    dynasty = json['dynasty'];
    layout = json['layout'];
    content = json['content'];
    highlightedAt = json['highlightedAt'] != null
        ? new HighlightedAt.fromJson(json['highlightedAt'])
        : null;
    appreciationTr = json['appreciationTr'];
    masterComment = json['masterComment'];
    dynastyTr = json['dynastyTr'];
    highlighted = json['highlighted'];
    workId = json['workId'];
    title = json['title'];
    collectionsCount = json['collectionsCount'];
    authorDescTr = json['authorDescTr'];
    postsCount = json['postsCount'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    likesCount = json['likesCount'];
    listsCount = json['listsCount'];
    contentTr = json['contentTr'];
    titleTr = json['titleTr'];
    kind = json['kind'];
    translation = json['translation'];
    masterCommentTr = json['masterCommentTr'];
    quotesCount = json['quotesCount'];
    intro = json['intro'];
    foreword = json['foreword'];
    authorDesc = json['authorDesc'];
    kindCNTr = json['kindCNTr'];
    annotationTr = json['annotationTr'];
    authorNameTr = json['authorNameTr'];
    annotation = json['annotation'];
    forewordTr = json['forewordTr'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sType = json['__type'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorName'] = this.authorName;
    data['kindCN'] = this.kindCN;
    data['baiduWiki'] = this.baiduWiki;
    data['translationTr'] = this.translationTr;
    data['introTr'] = this.introTr;
    data['authorId'] = this.authorId;
    data['appreciation'] = this.appreciation;
    data['viewsCount'] = this.viewsCount;
    data['dynasty'] = this.dynasty;
    data['layout'] = this.layout;
    data['content'] = this.content;
    if (this.highlightedAt != null) {
      data['highlightedAt'] = this.highlightedAt.toJson();
    }
    data['appreciationTr'] = this.appreciationTr;
    data['masterComment'] = this.masterComment;
    data['dynastyTr'] = this.dynastyTr;
    data['highlighted'] = this.highlighted;
    data['workId'] = this.workId;
    data['title'] = this.title;
    data['collectionsCount'] = this.collectionsCount;
    data['authorDescTr'] = this.authorDescTr;
    data['postsCount'] = this.postsCount;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['likesCount'] = this.likesCount;
    data['listsCount'] = this.listsCount;
    data['contentTr'] = this.contentTr;
    data['titleTr'] = this.titleTr;
    data['kind'] = this.kind;
    data['translation'] = this.translation;
    data['masterCommentTr'] = this.masterCommentTr;
    data['quotesCount'] = this.quotesCount;
    data['intro'] = this.intro;
    data['foreword'] = this.foreword;
    data['authorDesc'] = this.authorDesc;
    data['kindCNTr'] = this.kindCNTr;
    data['annotationTr'] = this.annotationTr;
    data['authorNameTr'] = this.authorNameTr;
    data['annotation'] = this.annotation;
    data['forewordTr'] = this.forewordTr;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__type'] = this.sType;
    data['className'] = this.className;
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
