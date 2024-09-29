import 'package:flutter_clean_arch/core/resources/data_state.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<Article>>> getNewsArticles();

  Future<List<Article>> getSavedArticles();

  Future<void> saveArticle(Article article);

  Future<void> removeArticle(Article article);

}
