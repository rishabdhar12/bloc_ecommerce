import 'package:bloc_ecommerce/features/categories/data/models/category_model.dart';
import 'package:bloc_ecommerce/features/shop/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: CategoryModel.fromJson(json["category"]),
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }
}
