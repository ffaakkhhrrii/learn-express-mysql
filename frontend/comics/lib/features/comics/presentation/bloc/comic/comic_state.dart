import 'package:comics/features/comics/domain/entities/comics.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class ComicState extends Equatable {
  final List<ComicsEntity>? comics;
  final DioException? error;
  const ComicState({this.comics,this.error});

  @override
  List<Object> get props => [comics!,error!];
}

class ComicLoading extends ComicState{
  const ComicLoading();
}

class ComicDone extends ComicState{
  const ComicDone(List<ComicsEntity> comics): super(comics: comics);
}

class ComicError extends ComicState{
  const ComicError(DioException error): super(error: error);
}