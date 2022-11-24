import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetail,MovieDetailsParameters>{
final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUsecase(this.baseMoviesRepository);


  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}
class MovieDetailsParameters extends Equatable{
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}