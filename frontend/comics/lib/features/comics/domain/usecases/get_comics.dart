import 'package:comics/core/resources/data_state.dart';
import 'package:comics/core/usecases/usecase.dart';
import 'package:comics/features/comics/domain/entities/comics.dart';
import 'package:comics/features/comics/domain/repository/comics_repository.dart';

class GetComicsUsecase implements Usecase<DataState<List<ComicsEntity>>,void> {
  final ComicsRepository _comicsRepository;
  GetComicsUsecase(this._comicsRepository);
  
  @override
  Future<DataState<List<ComicsEntity>>> call({void params}) {
    print("data repository bro ${_comicsRepository.getComics().toString()}");
    return _comicsRepository.getComics();
  }

}