import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUsecase extends BaseUsecase<List<Recommendation>,RecommendationParameters>{
final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }

}


class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id,];

}