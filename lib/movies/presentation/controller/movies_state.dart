part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMoviesList;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMoviesList = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  /// checking value in state if null return attribute data if != null --> save new value.
  MoviesState copyWith({
    List<Movie>? nowPlayingMoviesList,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
        nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage);
  }

  @override
  List<Object?> get props => [
        nowPlayingMoviesList,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
