
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_saved_article.dart';
import '../../../../domain/usecases/remove_article.dart';
import '../../../../domain/usecases/save_article.dart';
import 'local_article_event.dart';
import 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticles getSavedArticles;
  final RemoveArticle removeArticleUseCase;
  final SaveArticle saveArticleUseCase;

  LocalArticleBloc(
    this.getSavedArticles,
    this.removeArticleUseCase,
    this.saveArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticlesEvent>(onGetSavedArticles);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<SaveArticleEvent>(onSaveArticle);
  }

  void onGetSavedArticles(
    GetSavedArticlesEvent event,
    Emitter<LocalArticleState> emit,
  ) async {
    final articles = await getSavedArticles.call();
    emit(LocalArticleLoaded(articles));
  }

  void onRemoveArticle(
    RemoveArticleEvent event,
    Emitter<LocalArticleState> emit,
  ) async {
    await removeArticleUseCase.call(params: event.article);
    final articles = await getSavedArticles.call();
    emit(LocalArticleLoaded(articles));
  }

  void onSaveArticle(
    SaveArticleEvent event,
    Emitter<LocalArticleState> emit,
  ) async {
    await saveArticleUseCase.call(params: event.article);
    final articles = await getSavedArticles.call();
    emit(LocalArticleLoaded(articles));
  }
}
