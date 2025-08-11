import 'package:bloctraining2/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
    final List<ArticleEntity>? articles;
    final DioException? exception;

    const RemoteArticleState({this.articles, this.exception});

    @override
    List<Object?> get props => [articles!, exception!];
}

class RemoteArticlesLoading extends RemoteArticleState {
    const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
    const RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesException extends RemoteArticleState {
    const RemoteArticlesException(DioException exception) : super(exception: exception);
}