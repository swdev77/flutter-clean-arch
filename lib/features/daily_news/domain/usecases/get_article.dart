import '../../../../core/usecases/use_case.dart';
import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';
import '../repositories/article_repository.dart';

class GetArticlesUseCase implements UseCase<DataState<List<Article>>, void> {
  final ArticleRepository _articleRepository;

  GetArticlesUseCase(this._articleRepository);

  @override
  Future<DataState<List<Article>>> call({void params}) async {
    return await _articleRepository.getNewsArticles();
  }
}
