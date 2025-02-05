
import 'package:comics/core/constants/constans.dart';
import 'package:comics/features/comics/data/models/comics.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'comics_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ComicsApiService {
  factory ComicsApiService(Dio dio) = _ComicsApiService;

  @GET('/comics')
  Future<HttpResponse<ComicResponse>> getAllComics();
}