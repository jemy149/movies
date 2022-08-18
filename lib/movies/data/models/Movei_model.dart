import 'dart:convert';

import 'package:movies/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    /// attribute name --> ["name of attribute"].
        id: json["id"],
        title: json["title"],
         backdropPath: json["backdrop_path"],
        genreIds:  List<int>.from(json["genre_ids"].map((x) => x)), /// return list of integer
        overview: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
      );
}