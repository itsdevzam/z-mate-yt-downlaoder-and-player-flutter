import 'package:yt_down/core/entities/VideoEntity.dart';

abstract class SearchRepo {
  ///search with query
  Future<List<VideoEntity>?> getSearchSuggestions({required String query});

}