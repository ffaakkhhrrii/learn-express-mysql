import 'package:comics/core/resources/data_state.dart';
import 'package:comics/features/comics/domain/entities/comics.dart';

abstract class ComicsRepository {
  Future<DataState<List<ComicsEntity>>> getComics();
}