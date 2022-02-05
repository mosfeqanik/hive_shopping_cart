import 'products.dart';

class ProductsData {
  ProductsData({
      this.totalSize, 
      this.limit, 
      this.offset, 
      this.products,});

  ProductsData.fromJson(dynamic json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  int? totalSize;
  String? limit;
  String? offset;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_size'] = totalSize;
    map['limit'] = limit;
    map['offset'] = offset;
    // if (products != null) {
    //   map['products'] = products?.map((v) => v.toJson()).toList();
    // }
    return map;
  }

}