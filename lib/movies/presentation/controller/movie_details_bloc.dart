import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsParameters(movieId: event.id));

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsMessage: l.message,
        movieDetailsState: RequestState.error,
      )),
      (r) => emit(state.copyWith(
        movieDetail: r,
        movieDetailsState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result =
    await getRecommendationUsecase(RecommendationParameters(id: event.id));
    print(result);
    result.fold(
          (l) => emit(state.copyWith(
        recommendationMessage: l.message,
        recommendationState: RequestState.error,
      )),
          (r) => emit(state.copyWith(
        recommendation: r,
        recommendationState: RequestState.loaded,
      )),
    );
  }
}
