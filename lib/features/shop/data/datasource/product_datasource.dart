import 'package:bloc_ecommerce/core/constants/strings.dart';
import 'package:bloc_ecommerce/features/shop/data/models/product_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'product_datasource.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET("/products")
  Future<List<ProductModel>> getAllProducts();
}
