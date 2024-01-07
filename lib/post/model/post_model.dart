class PostModel {
  int? iD;
  String? title;
  String? slug;
  List<String>? category;
  String? author;
  String? content;
  String? expert;
  String? createdAt;
  String? updatedAt;
  String? image;

  PostModel({
    this.iD,
    this.title,
    this.slug,
    this.category,
    this.author,
    this.content,
    this.expert,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    title = json['title'];
    slug = json['slug'];
    category = json['category'].cast<String>();
    author = json['author'];
    content = json['content'];
    expert = json['expert'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['title'] = title;
    data['slug'] = slug;
    data['category'] = category;
    data['author'] = author;
    data['content'] = content;
    data['expert'] = expert;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    return data;
  }
}
