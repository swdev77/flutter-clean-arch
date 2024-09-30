import 'package:flutter_clean_arch/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repositories/article_repository.dart';
import 'features/daily_news/domain/repositories/article_repository.dart';
import 'features/daily_news/domain/usecases/get_article.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<NewsApiService>(
    NewsApiService(),
  );
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl(), sl()),
  );

  sl.registerSingleton<GetArticlesUseCase>(
    GetArticlesUseCase(sl()),
  );

  sl.registerSingleton<SaveArticle>(SaveArticle(sl()));
  sl.registerSingleton<RemoveArticle>(RemoveArticle(sl()));
  sl.registerSingleton<GetSavedArticles>(GetSavedArticles(sl()));

  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl()),
  );

  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(), sl(), sl()),
  );
}
