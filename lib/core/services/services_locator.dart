import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
final sl = GetIt.instance;
class ServicesLocator {

  void init() {
    /// In bloc I need
    /// 1- Object from BaseMovieRemoteDataSource
    /// 2- Object from BaseMovieRepository
    /// 3- Object from Usecase.

    /// [registerLazySingleton] --> give me ability to use the same object in all project.
    /// [registerFactory] --> when calling Bloc it creates new object from this bloc.

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));

    /// User Cases
    /// sl() in GetNowPlayingMoviesUsecase(sl())) --> when you call sl you will access an object from [MoviesRepository].
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));

    /// Repository
    /// sl() in MoviesRepository(sl())) --> when you call sl you will access an object from [MovieRemoteDataSource].
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl())); // only one repository for Module.

    /// Data Source
    /// once I called [MovieRemoteDataSource] call an object that I have been created here
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource()); // only one DataSource for Module.




  }
}
