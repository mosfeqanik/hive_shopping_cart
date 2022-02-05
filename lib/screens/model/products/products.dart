import 'category_ids.dart';

class Products {
  Products({
      this.id, 
      this.name, 
      this.description, 
      this.image, 
      this.price, 
      // this.variations,
      this.tax, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      // this.attributes,
      this.categoryIds, 
      // this.choiceOptions,
      this.discount, 
      this.discountType, 
      this.taxType, 
      this.unit, 
      this.totalStock, 
      this.capacity, 
      this.dailyNeeds, 
      this.wishlistCount, 
      // this.rating,

  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? json['image'].cast<String>() : [];
    price = json['price'];
    // if (json['variations'] != null) {
    //   variations = [];
    //   json['variations'].forEach((v) {
    //     variations?.add(dynamic.fromJson(v));
    //   });
    // }
    tax = json['tax'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // if (json['attributes'] != null) {
    //   attributes = [];
    //   json['attributes'].forEach((v) {
    //     attributes?.add(dynamic.fromJson(v));
    //   });
    // }
    if (json['category_ids'] != null) {
      categoryIds = [];
      json['category_ids'].forEach((v) {
        categoryIds?.add(Category_ids.fromJson(v));
      });
    }
    // if (json['choice_options'] != null) {
    //   choiceOptions = [];
    //   json['choice_options'].forEach((v) {
    //     choiceOptions?.add(dynamic.fromJson(v));
    //   });
    // }
    discount = json['discount'];
    discountType = json['discount_type'];
    taxType = json['tax_type'];
    unit = json['unit'];
    totalStock = json['total_stock'];
    capacity = json['capacity'];
    dailyNeeds = json['daily_needs'];
    wishlistCount = json['wishlist_count'];
    // if (json['rating'] != null) {
    //   rating = [];
    //   json['rating'].forEach((v) {
    //     rating?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  int? id;
  String? name;
  String? description;
  List<String>? image;
  double? price;
  // List<dynamic>? variations;
  int? tax;
  int? status;
  String? createdAt;
  String? updatedAt;
  // List<dynamic>? attributes;
  List<Category_ids>? categoryIds;
  // List<dynamic>? choiceOptions;
  int? discount;
  String? discountType;
  String? taxType;
  String? unit;
  int? totalStock;
  int? capacity;
  int? dailyNeeds;
  int? wishlistCount;
  // List<dynamic>? rating;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['name'] = name;
  //   map['description'] = description;
  //   map['image'] = image;
  //   map['price'] = price;
  //   if (variations != null) {
  //     map['variations'] = variations?.map((v) => v.toJson()).toList();
  //   }
  //   map['tax'] = tax;
  //   map['status'] = status;
  //   map['created_at'] = createdAt;
  //   map['updated_at'] = updatedAt;
  //   if (attributes != null) {
  //     map['attributes'] = attributes?.map((v) => v.toJson()).toList();
  //   }
  //   if (categoryIds != null) {
  //     map['category_ids'] = categoryIds?.map((v) => v.toJson()).toList();
  //   }
  //   if (choiceOptions != null) {
  //     map['choice_options'] = choiceOptions?.map((v) => v.toJson()).toList();
  //   }
  //   map['discount'] = discount;
  //   map['discount_type'] = discountType;
  //   map['tax_type'] = taxType;
  //   map['unit'] = unit;
  //   map['total_stock'] = totalStock;
  //   map['capacity'] = capacity;
  //   map['daily_needs'] = dailyNeeds;
  //   map['wishlist_count'] = wishlistCount;
  //   if (rating != null) {
  //     map['rating'] = rating?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}