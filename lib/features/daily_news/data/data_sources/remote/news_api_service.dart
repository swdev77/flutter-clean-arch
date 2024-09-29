import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';
import '../../models/article.dart';

class NewsApiService {
  Future<List<ArticleModel>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    var newsApiUri = Uri.https(
      ApiConstants.baseUrl,
      '/v2/top-headlines',
      {
        'apiKey': ApiConstants.key,
        'country': ApiConstants.country,
        'category': ApiConstants.category
      },
    );

    final httpClient = http.Client();
    try {
      final response = await httpClient.get(newsApiUri);

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body);
        final articlesData = data['articles'] as List;

        final articles =
            articlesData.map((value) => ArticleModel.fromJson(value)).toList();

        return Future.value(articles);
      } else {
        throw Exception(
          'Failed to load articles: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }
}
