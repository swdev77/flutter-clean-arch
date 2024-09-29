import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final Article? article;

  const LocalArticleEvent(this.article);
}
