import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloctraining2/core/resources/data_state.dart';
import 'package:bloctraining2/core/utils/constants.dart';
import 'package:bloctraining2/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:bloctraining2/features/daily_news/data/models/article_model.dart';
import 'package:bloctraining2/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImplementation implements ArticleRepository {

    final NewsApiService _newsApiService;

    ArticleRepositoryImplementation(this._newsApiService);

    @override
    Future<DataState<List<ArticleModel>>> getNewsArticles() async {
        try {
            final httpResponse = await _newsApiService.getNewsArticles(
                apiKey: apiKey,
                country: countryQuery,
                category: categoryQuery,
            );

            if (httpResponse.response.statusCode == HttpStatus.ok) {
                return DataSuccess(httpResponse.data);
            } else {
                return DataFailed(
                    DioException(
                        error: httpResponse.response.statusMessage,
                        response: httpResponse.response,
                        type: DioExceptionType.badResponse,
                        requestOptions: httpResponse.response.requestOptions,
                    )
                );
            }
        } on DioException catch (error) {
            return DataFailed(error);
        }
    }

}