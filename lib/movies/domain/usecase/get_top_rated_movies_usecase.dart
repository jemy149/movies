import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUsecase{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute() async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}