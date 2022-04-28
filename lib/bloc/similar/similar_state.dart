part of 'similar_bloc.dart';

abstract class SimilarState extends Equatable {
  const SimilarState();

  @override
  List<Object> get props => [];
}

class SimilarInitial extends SimilarState {}

class SimilarLoading extends SimilarState {}

class SimilarLoaded extends SimilarState {
  final NowPlaying similar;

  const SimilarLoaded({required this.similar});

  @override
  List<Object> get props => [similar];
}

class SimilarError extends SimilarState {
  final String error;

  const SimilarError({required this.error});

  @override
  List<Object> get props => [error];
}
