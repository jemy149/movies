import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          nowPlayingMoviesList: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            )));
  }
}
