class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "7af41aa3dc238779b02388496f77bc6b";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String nowPopularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String nowTopRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  /// this path depending on movieId;
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  /// this path depending on movieId;
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static  String imageUrl(String path) => "$baseImageUrl$path";
}
