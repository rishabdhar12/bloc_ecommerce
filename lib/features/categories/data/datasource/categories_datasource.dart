import 'package:bloc_ecommerce/core/constants/strings.dart';
import 'package:bloc_ecommerce/features/categories/data/models/category_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_datasource.g.dart';

@RestApi(baseUrl: AppStrings.fakeStoreUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio) = _CategoriesApiService;

  @GET("/products/categories")
  Future<List<CategoryModel>> getCategories();
}
