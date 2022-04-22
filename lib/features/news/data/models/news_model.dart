import 'dart:developer';

import 'package:newsapp/features/news/domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel({
    required String author,
    required String description,
    required String source,
    required String title,
    required String url,
    required String imageUrl,
    required String category,
    required DateTime publishedAt,
  }) : super(
          author: author,
          description: description,
          source: source,
          title: title,
          url: url,
          imageUrl: imageUrl,
          category: category,
          publishedAt: publishedAt,
        );

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'source': source,
      'image': imageUrl,
      'category': category,
      'published_at': publishedAt.toString(),
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      author: map['author'] ?? 'Not Specified',
      title: map['title'] ?? 'Untitled',
      description: map['description'] ?? 'Unavailable',
      url: map['url'] ?? 'Unavailable',
      source: map['source'] ?? 'Not Specified',
      imageUrl: map['image'] ?? 'assets/images/news_default.jpg',
      category: map['category'] ?? 'general',
      publishedAt: map['published_at'] != null
          ? DateTime.parse(map['published_at'])
          : DateTime.now(),
    );
  }
}
