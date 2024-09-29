import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_arch/features/daily_news/data/models/article.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(
    this._newsApiService,
    this._appDatabase,
  );

  @override
  Future<DataState<List<Article>>> getNewsArticles() async {
    try {
      final result = await _newsApiService.getNewsArticles(
        apiKey: ApiConstants.key,
        country: ApiConstants.country,
        category: ApiConstants.category,
      );
      return DataSuccess(result);
    } on Exception catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<List<Article>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(Article article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
