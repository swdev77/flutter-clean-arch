import 'package:equatable/equatable.dart';
import '../../../../domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final Article? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class GetSavedArticlesEvent extends LocalArticleEvent {
  const GetSavedArticlesEvent();
}

class RemoveArticleEvent extends LocalArticleEvent {
  const RemoveArticleEvent(Article article) : super(article: article);
}

class SaveArticleEvent extends LocalArticleEvent {
  const SaveArticleEvent(Article article) : super(article: article);
}
