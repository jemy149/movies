import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository{
  /// request from api to fetch data.
  /// ---->> Contract in domain layer.

  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters
      );

}
/// retrieve data from server detected by category,
/// and every category denoted by abstract method.