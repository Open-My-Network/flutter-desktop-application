class CategoryModel {
  int? iD;
  String? name;
  String? slug;

  CategoryModel({
    this.iD,
    this.name,
    this.slug,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
