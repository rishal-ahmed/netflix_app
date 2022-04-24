import 'package:netflix_app/core/constants/base_url.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const trending = '$baseUrl/trending/all/day?api_key=$apiKey';
  static const search = '$baseUrl/search/movies?api_key=$apiKey';
}
