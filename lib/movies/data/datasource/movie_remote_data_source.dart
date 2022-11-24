import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/models/Movei_model.dart';
import 'package:movies/movies/data/models/movie_detail_model.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<Recommendation>> getRecommendationMovies(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    /// this method calls api endpoint
    /// this method returns Lint<MovieModel> not List<Movie> as to be able to access from json.

    final response = await Dio().get(
      ApiConstants.nowPlayingMoviesPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (x) => MovieModel.fromJson(x),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.nowPopularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (x) => MovieModel.fromJson(x),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.nowTopRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (x) => MovieModel.fromJson(x),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (x) => RecommendationModel.fromJson(x),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
