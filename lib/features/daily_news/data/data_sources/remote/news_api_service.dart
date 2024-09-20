import 'package:clean_arch_bloc_news_app/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:clean_arch_bloc_news_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apikey') String? apikey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
