import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rebel_movie/models/now_playing.dart';

import '../../resources/api_repository.dart';

part 'similar_event.dart';
part 'similar_state.dart';

class SimilarBloc extends Bloc<SimilarEvent, SimilarState> {
  SimilarBloc() : super(SimilarInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetSimilarEvent>((event, emit) async {
      try {
        emit(SimilarLoading());
        final nowPlaying = await _apiRepository
            .getSimilar(event.movieId)
            .then((value) => value);
        if (nowPlaying.error.isNotEmpty) {
          emit(SimilarError(error: nowPlaying.error));
        }
        emit(SimilarLoaded(similar: nowPlaying));
      } on NetworkError {
        emit(const SimilarError(
            error:
                "Failed to fetch data from server, please check your internet connection"));
      }
    });
  }
}
