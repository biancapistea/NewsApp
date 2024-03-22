import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? dioError;

  const RemoteArticleState({this.articles, this.dioError});

  @override
  List<Object> get props => [articles!, dioError!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioError error) : super(dioError: error);
}