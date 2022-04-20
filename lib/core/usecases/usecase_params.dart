class FetchNewsParams {
  final Categories? categories;
  final int? offset, limit;
  const FetchNewsParams({
    this.categories,
    this.offset,
    this.limit,
  });
}

enum Categories {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology
}

class SearchNewsParams {
  final String keyword;
  SearchNewsParams({
    required this.keyword,
  });
}
