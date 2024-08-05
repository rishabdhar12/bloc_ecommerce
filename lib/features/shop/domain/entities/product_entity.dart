import 'package:bloc_ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final int price;
  final String description;
  final CategoryEntity? category;
  final List<String> images;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  @override
  List<Object> get props => [id, title, price, description, category!, images];
}
