import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rebel_movie/resources/api_repository.dart';

import '../../models/now_playing.dart';

part 'nowplaying_event.dart';
part 'nowplaying_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingInitial()) {
    on<NowPlayingFetch>((event, emit) async {
      // TODO: implement event handler
      final ApiRepository _apiRepository = ApiRepository();
      try {
        emit(NowPlayingLoading());

        final nowPlaying =
            await _apiRepository.getNowPlaying().then((value) => value);

        if (nowPlaying.error.isNotEmpty) {
          emit(NowPlayingError(error: nowPlaying.error));
        }

        emit(NowPlayingLoaded(nowPlaying: nowPlaying));
      } on NetworkError {
        emit(NowPlayingError(
            error:
                "Failed to fetch data from server, please check your internet connection"));
      }
    });
  }
}
