import 'package:dio/dio.dart';
import 'package:netflix_clone/features/movies/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'https://api.tvmaze.com/search/shows?q=')
abstract class MoviesRepository {
  factory MoviesRepository(Dio dio, {String? baseUrl}) = _MoviesRepository;

  @GET('all')
  Future< List<ShowModel>> getAllMovies();
  @GET('{query}')
  Future< List<ShowModel>> searchMovies(@Path() String query);
}
