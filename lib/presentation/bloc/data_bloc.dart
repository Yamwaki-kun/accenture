import 'package:accenture/presentation/bloc/datasetate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/data_entity.dart';
import '../../domain/usecases/get_data_usecase.dart';

class DataCubit extends Cubit<DataState> {
  final GetDataUseCase getDataUseCase;

  DataCubit(this.getDataUseCase) : super(DataState([], 0));

  Future<void> fetchData() async {
    try {
      final data = await getDataUseCase();
      emit(state.copyWith(data: data));
    } catch (e) {
      emit(DataState([], 0));
      print('Error: $e');
    }
  }

  void setPageIndex(int index) {
    emit(state.copyWith(pageIndex: index));
  }
}
