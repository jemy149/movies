import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository{
  /// request from api to fetch data.
  /// ---->> Contract in domain layer.

  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

}
/// retrieve data from server detected by category,
/// and every category denoted by abstract method.