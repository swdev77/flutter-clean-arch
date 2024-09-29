import 'package:flutter_clean_arch/core/usecases/use_case.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticle implements UseCase<List<Article>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticle(this._articleRepository);

  @override
  Future<List<Article>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
