part of 'nowplaying_bloc.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final NowPlaying nowPlaying;

  const NowPlayingLoaded({required this.nowPlaying});

  @override
  List<Object> get props => [nowPlaying];
}

class NowPlayingError extends NowPlayingState {
  final String error;

  const NowPlayingError({required this.error});

  @override
  List<Object> get props => [error];
}
