import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository{

  /// implementation stage.
  /// this stage call methods that have been found in datasource.
  /// in other words calls data from datasource.

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

/// how to return 2 object types in the same return type --> using Either from dartz
  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{

    final result =  await baseMovieRemoteDataSource.getNowPlayingMovies();

    try{

      return Right(result);

    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async{

    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}