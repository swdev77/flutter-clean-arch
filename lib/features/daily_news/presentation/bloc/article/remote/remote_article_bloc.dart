import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/resources/data_state.dart';

import '../../../../domain/usecases/get_article.dart';
import 'remote_article_event.dart';
import 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticleBloc(this._getArticlesUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase.call();

    if (dataState is DataFailed) {
      print(dataState.error!);

      emit(
        RemoteArticleError(dataState.error!),
      );
    }

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticleDone(dataState.data!),
      );
    }
  }
}
