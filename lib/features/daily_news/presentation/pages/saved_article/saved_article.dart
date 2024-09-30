import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/config/routes/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter_clean_arch/injection_container.dart';

class SavedArticle extends HookWidget {
  const SavedArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticlesEvent()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      title: const Text(
        'Saved Article',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LocalArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LocalArticleLoaded) {
          return _buildArticlesList(state.articles!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text(
          'No saved articles',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleTileWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }

  _onRemoveArticle(BuildContext context, Article article) {
    BlocProvider.of<LocalArticleBloc>(context).add(
      RemoveArticleEvent(article),
    );
  }

  _onArticlePressed(BuildContext context, Article article) {
    Navigator.pushNamed(
      context,
      AppRoutes.toArticleDetails,
      arguments: article,
    );
  }
}
