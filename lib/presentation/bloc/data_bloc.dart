import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/data_entity.dart';
import '../../domain/usecases/get_data_usecase.dart';

class DataCubit extends Cubit<List<DataEntity>> {
  final GetDataUseCase getDataUseCase;

  DataCubit(this.getDataUseCase) : super([]);

  Future<void> fetchData() async {
    try {
      final data = await getDataUseCase();
      emit(data);
    } catch (e) {
      emit([]);
      print('Error: $e');
    }
  }
}
