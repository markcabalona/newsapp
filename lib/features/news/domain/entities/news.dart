
import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String source;
  final String imageUrl;
  final String category;
  final DateTime publishedAt;
  const News({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.imageUrl,
    required this.category,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        source,
        imageUrl,
        category,
        publishedAt
      ];
}
