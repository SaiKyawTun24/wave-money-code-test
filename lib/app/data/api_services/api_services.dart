import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/recipes.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final apiKey = dotenv.env['APIKEY'];
        if (apiKey != null) {
          options.queryParameters['apiKey'] = apiKey;
        }
        return handler.next(options);
      },
    ));
    dio.options = BaseOptions(
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
    );
    dio.options.headers['Accept'] = 'application/json';

    final baseUrl = dotenv.env['BASEURL'];
    if (baseUrl == null) {
      throw Exception("BASEURL environment variable is not set.");
    }

    return ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/recipes/random')
  Future<RecipesResponse> getRecipes(
    @Query('includeNutrition') bool includeNutrition,
    @Query('limitLicense') bool limitLicense,
    @Query('number') int number,
  );
}
