import 'package:movie_app/movies/moive_dao.dart';

import '../movies/movie.dart';
import 'movie_api.dart';

class MovieRepository {
  final MoviesApi api = MoviesApi();
  final MovieDao _dao = MovieDao();
  Future<void> loadMovies({int page = 1}) async {
    final List<Movie> result = await api.getPopularMovies(page: page);
    await _dao.replaceAll(result);
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return await api.getTopRatedMovies(page: page);
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    return await api.getNowPlayingMovies(page: page);
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    return await api.getOutInCinema(page: page);
  }

  Stream<List<Movie>> allMovies() {
    return _dao.watchAllMovies();
  }
}
