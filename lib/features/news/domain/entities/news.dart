import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String author, title, description, url, source;
  const News({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
  });

  @override
  List<Object?> get props => [author, title, description, url, source];
}
