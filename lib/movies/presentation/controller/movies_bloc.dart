import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      /// on Adding an event to bloc

      final result = await getNowPlayingMoviesUsecase.execute();

      result.fold(
        (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          popularMessage: l.message,
        )),
        (r) => emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUsecase.execute();

      result.fold(
          (l) => emit(MoviesState(
                popularState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(MoviesState(
              popularMovies: r, popularState: RequestState.loaded)));
    });
  }
}
