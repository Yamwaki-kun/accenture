import 'package:accenture/domain/entities/data_entity.dart';

class DataState {
  final List<DataEntity> data;
  final int pageIndex;

  DataState(this.data, this.pageIndex);

  DataState copyWith({List<DataEntity>? data, int? pageIndex}) {
    return DataState(
      data ?? this.data,
      pageIndex ?? this.pageIndex,
    );
  }
}
