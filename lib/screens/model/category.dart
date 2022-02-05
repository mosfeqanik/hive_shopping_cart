class Category {
  Category({
      this.id, 
      this.name, 
      this.parentId, 
      this.position, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.image, 
      // this.translations,

  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    // if (json['translations'] != null) {
    //   translations = [];
    //   json['translations'].forEach((v) {
    //     translations?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  int? id;
  String? name;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? image;
  // List<String>? translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['parent_id'] = parentId;
    map['position'] = position;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image'] = image;
    // if (translations != null) {
    //   map['translations'] = translations?.map((v) => v.toJson()).toList();
    // }
    return map;
  }

}