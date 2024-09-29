import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.id,
    this.author,
    this.title,
    this.description,
    this.content,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  List<Object?> get props => [
        id,
        author,
        title,
        description,
        content,
        url,
        urlToImage,
        publishedAt,
      ];
}
