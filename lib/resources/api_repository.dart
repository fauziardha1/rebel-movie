import '../models/now_playing.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<NowPlaying> getNowPlaying() => _provider.getNowPlaying();

  Future<NowPlaying> getSimilar(int movieId) => _provider.getSimilar(movieId);
}

class NetworkError extends Error {}
