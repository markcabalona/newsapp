import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/core/errors/exceptions.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/data/datasources/news_remote_datasource.dart';
import 'package:newsapp/features/news/data/models/news_model.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

class MediaStackApi implements NewsRemoteDataSource {
  final String _root = 'http://api.mediastack.com/v1/news?&countries=ph';

  const MediaStackApi();
  @override
  Future<List<News>> fetchNews(FetchNewsParams params) async {
    try {
      final String _category;
      if (params.categories == Categories.business) {
        _category = 'business';
      } else if (params.categories == Categories.entertainment) {
        _category = 'entertainment';
      } else if (params.categories == Categories.health) {
        _category = 'health';
      } else if (params.categories == Categories.science) {
        _category = 'science';
      } else if (params.categories == Categories.sports) {
        _category = 'sports';
      } else if (params.categories == Categories.technology) {
        _category = 'technology';
      } else {
        _category = 'general';
      }

      http.Response response = await http.get(
        Uri.parse(
          _root +
              '&access_key=${dotenv.env['MEDIASTACK_API_KEY']}&limit=${params.limit ?? ''}&offset=${params.offset ?? ''}&categories = $_category',
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> newsList = jsonDecode(response.body)['data'];
        try {
          return newsList
              .map(
                (newsMap) => NewsModel.fromMap(jsonDecode(jsonEncode(newsMap))),
              )
              .toList();
        } catch (e) {
          log(e.toString());
          throw ParsingException();
        }
      } else {
        throw RequestDeniedException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<News>> searchNews(SearchNewsParams params) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          _root +
              '&access_key=${dotenv.env['MEDIASTACK_API_KEY']}&keywords=${params.keyword}',
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        List<Map<String, dynamic>> newsList =
            jsonDecode(jsonDecode(response.body)['data']);
        try {
          return newsList
              .map(
                (newsMap) => NewsModel.fromMap(newsMap),
              )
              .toList();
        } catch (e) {
          throw ParsingException();
        }
      } else {
        throw RequestDeniedException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
