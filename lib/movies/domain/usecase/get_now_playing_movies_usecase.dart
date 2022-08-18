import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUsecase {
  /// injecting [BaseMoviesRepository in Constructor]
  /// as we can't initialize an object from an abstract class.
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUsecase(this.baseMoviesRepository);

  /// creating method to call getNowPlayingMovies that have been created in domain layer in repository.
  Future<Either<Failure,List<Movie>>> execute()async{
   return await baseMoviesRepository.getNowPlayingMovies();
 }
}
