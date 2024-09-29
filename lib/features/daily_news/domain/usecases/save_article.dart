import 'package:flutter_clean_arch/core/usecases/use_case.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class SaveArticle implements UseCase<void, Article> {
  final ArticleRepository _articleRepository;

  SaveArticle(this._articleRepository);

  @override
  Future<void> call({Article? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
