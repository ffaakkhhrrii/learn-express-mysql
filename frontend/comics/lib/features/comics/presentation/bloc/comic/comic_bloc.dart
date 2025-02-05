import 'package:comics/core/resources/data_state.dart';
import 'package:comics/features/comics/domain/usecases/get_comics.dart';
import 'package:comics/features/comics/presentation/bloc/comic/comic_event.dart';
import 'package:comics/features/comics/presentation/bloc/comic/comic_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicBloc extends Bloc<ComicEvent,ComicState> {

  final GetComicsUsecase _getComicsUsecase;

  ComicBloc(this._getComicsUsecase): super(const ComicLoading()){
    on <GetComics> (onGetComics);
  }

  void onGetComics(GetComics event,Emitter<ComicState> emit) async{
    final dataState = await _getComicsUsecase();
    print("datastate mas ${dataState.data}");
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(
        ComicDone(dataState.data!)
      );
    }

    if(dataState is DataFailed){
      emit(
        ComicError(dataState.error!)
      );
    }
  }
}