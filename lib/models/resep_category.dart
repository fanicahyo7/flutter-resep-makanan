class ResepCategoryModel {
  ResepCategoryModel({
    required this.method,
    required this.status,
    required this.results,
  });
  late final String method;
  late final bool status;
  late final List<ResepCategory> results;

  ResepCategoryModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    results = List.from(json['results'])
        .map((e) => ResepCategory.fromJson(e))
        .toList();
  }
}

class ResepCategory {
  ResepCategory({
    required this.category,
    required this.url,
    required this.key,
  });
  late final String category;
  late final String url;
  late final String key;

  ResepCategory.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    url = json['url'];
    key = json['key'];
  }
}
