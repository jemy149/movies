import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters noParameters) async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}