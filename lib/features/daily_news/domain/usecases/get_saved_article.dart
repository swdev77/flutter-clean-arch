import 'package:flutter_clean_arch/core/usecases/use_case.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticles implements UseCase<List<Article>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticles(this._articleRepository);

  @override
  Future<List<Article>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
