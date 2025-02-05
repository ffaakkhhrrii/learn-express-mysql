import 'dart:io';

import 'package:comics/core/resources/data_state.dart';
import 'package:comics/features/comics/data/data_sources/remote/comics_api_service.dart';
import 'package:comics/features/comics/data/models/comics.dart';
import 'package:comics/features/comics/domain/entities/comics.dart';
import 'package:comics/features/comics/domain/repository/comics_repository.dart';
import 'package:dio/dio.dart';

class ComicsRepositoryImpl implements ComicsRepository {
  final ComicsApiService _comicsApiService;

  ComicsRepositoryImpl(this._comicsApiService);

  @override
  Future<DataState<List<ComicsModel>>> getComics() async{
    try{
      final httpResponse = await _comicsApiService.getAllComics();
      if(httpResponse.response.statusCode == HttpStatus.ok){
        final List<dynamic> jsonData = httpResponse.response.data["data"];
        final List<ComicsModel> comicsList = 
          jsonData.map((json) => ComicsModel.fromJson(json)).toList();
        print("response masbro ${comicsList}");
        return DataSuccess(comicsList);
      }else{
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    }on DioException catch(e){
      return DataFailed(e);
    }
  }
  
}