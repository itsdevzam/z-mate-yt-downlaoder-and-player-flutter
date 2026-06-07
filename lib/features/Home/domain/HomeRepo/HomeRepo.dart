


import '../../../../core/entities/VideoEntity.dart';

abstract class HomeRepo{
  //to get Homepage Feed
  Future<List<VideoEntity>?> getHomePageFeed();

  //search on Homepage
  Future<List<VideoEntity>?> searchOnHomePage(String query);
}