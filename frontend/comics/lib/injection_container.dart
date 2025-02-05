import 'package:comics/core/constants/constans.dart';
import 'package:comics/features/comics/data/data_sources/remote/comics_api_service.dart';
import 'package:comics/features/comics/data/repository/comics_repository_impl.dart';
import 'package:comics/features/comics/domain/repository/comics_repository.dart';
import 'package:comics/features/comics/domain/usecases/get_comics.dart';
import 'package:comics/features/comics/presentation/bloc/comic/comic_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  final dio = Dio(
  BaseOptions(baseUrl: baseUrl),
);
  // dio
  sl.registerSingleton<Dio>(dio);

  // api service
  sl.registerSingleton<ComicsApiService>(ComicsApiService(sl()));

  //repos
  sl.registerSingleton<ComicsRepository>(
    ComicsRepositoryImpl(sl())
  );
  
  //usecase
  sl.registerSingleton<GetComicsUsecase>(
    GetComicsUsecase(sl())
  );

  // bloc
  sl.registerFactory<ComicBloc>(
    ()=> ComicBloc(sl())
  );
}