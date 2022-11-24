import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<Movie>,NoParameters> {
  /// injecting [BaseMoviesRepository in Constructor]
  /// as we can't initialize an object from an abstract class.
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUsecase(this.baseMoviesRepository);

  /// creating method to call getNowPlayingMovies that have been created in domain layer in repository.
  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters noParameters)async{
   return await baseMoviesRepository.getNowPlayingMovies();
 }
}
