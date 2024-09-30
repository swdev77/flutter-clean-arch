import 'package:equatable/equatable.dart';
import '../../../../domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<Article>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object?> get props => [articles];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleLoaded extends LocalArticleState {
  const LocalArticleLoaded(
    List<Article> articles,
  ) : super(articles: articles);
}
