
import 'package:flutter_clean_arch/core/usecases/use_case.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class RemoveArticle implements UseCase<void, Article> {
  final ArticleRepository _articleRepository;

  RemoveArticle(this._articleRepository);

  @override
  Future<void> call({Article? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
