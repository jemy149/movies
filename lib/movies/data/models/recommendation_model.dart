import 'package:movies/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath: json["backdrop_path"] ??
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAkYv5zjrnF56iLYHlp4AZ3rGliAg2k1ZFRue56h-f7TcIG8-89DFswc1mkzebNhTWhwc&usqp=CAU',
          id: json["id"]);
}
