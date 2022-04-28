part of 'similar_bloc.dart';

abstract class SimilarEvent extends Equatable {
  const SimilarEvent();

  @override
  List<Object> get props => [];
}

class GetSimilarEvent extends SimilarEvent {
  final int movieId;

  const GetSimilarEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
