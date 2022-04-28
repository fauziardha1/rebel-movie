import 'package:dio/dio.dart';
import 'package:rebel_movie/models/now_playing.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String _apiKey = '?api_key=c410263697615899edf2bdf7903a1a05';

  Future<NowPlaying> getNowPlaying() async {
    try {
      final response = await _dio.get(_baseUrl + 'now_playing' + _apiKey);
      return NowPlaying.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace:$stacktrace');
      return NowPlaying.withError('$error');
    }
  }

  Future<NowPlaying> getSimilar(int movieId) async {
    try {
      final response =
          await _dio.get(_baseUrl + '${movieId}/similar' + _apiKey);
      return NowPlaying.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace:$stacktrace');
      return NowPlaying.withError('$error');
    }
  }
}
