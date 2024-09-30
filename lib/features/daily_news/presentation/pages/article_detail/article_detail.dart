import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';

import '../../../../../injection_container.dart';

class ArticleDetail extends HookWidget {
  final Article? article;

  const ArticleDetail({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        children: [
          Text(
            article!.title!,
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(
                Icons.timeline,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                article!.publishedAt!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(article!.urlToImage!, fit: BoxFit.cover),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 20,
      ),
      child: Text(
        '${article!.description ?? ''}\n\n${article!.content ?? ''}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButton(context),
        child: const Icon(
          Icons.bookmark,
          color: Colors.white,
        ),
      ),
    );
  }

  _onFloatingActionButton(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticleEvent(article!));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text('Article saved successfully'),
    ));
  }
}
