import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/pages/saved_article/saved_article.dart';

class AppRoutes {
  static const toHome = '/';
  static const toArticleDetails = '/ArticleDetails';
  static const toSavedArticles = '/SavedArticles';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case toHome:
        return _materialRoute(const DailyNews());
      case toArticleDetails:
        return _materialRoute(
          ArticleDetail(
            article: settings.arguments as Article,
          ),
        );
      case toSavedArticles:
        return _materialRoute(const SavedArticle());
      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
