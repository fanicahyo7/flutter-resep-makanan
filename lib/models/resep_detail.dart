class ResepDetailModel {
  String? method;
  bool? status;
  ResepDetail? results;

  ResepDetailModel({this.method, this.status, this.results});

  ResepDetailModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    results = json['results'] = ResepDetail.fromJson(json['results']);
  }
}

class ResepDetail {
  String? title;
  String? thumb;
  String? servings;
  String? times;
  String? dificulty;
  Author? author;
  String? desc;
  List<NeedItem>? needItem;
  List<String>? ingredient;
  List<String>? step;

  ResepDetail(
      {this.title,
      this.thumb,
      this.servings,
      this.times,
      this.dificulty,
      this.author,
      this.desc,
      this.needItem,
      this.ingredient,
      this.step});

  ResepDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    servings = json['servings'];
    times = json['times'];
    dificulty = json['dificulty'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    desc = json['desc'];
    if (json['needItem'] != null) {
      needItem = <NeedItem>[];
      json['needItem'].forEach((v) {
        needItem!.add(NeedItem.fromJson(v));
      });
    }
    ingredient = json['ingredient'].cast<String>();
    step = json['step'].cast<String>();
  }
}

class Author {
  String? user;
  String? datePublished;

  Author({this.user, this.datePublished});

  Author.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    datePublished = json['datePublished'];
  }
}

class NeedItem {
  String? itemName;
  String? thumbItem;

  NeedItem({this.itemName, this.thumbItem});

  NeedItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    thumbItem = json['thumb_item'];
  }
}
