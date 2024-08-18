import '../repositories/data_repository.dart';
import '../entities/data_entity.dart';

class GetDataUseCase {
  final DataRepository repository;

  GetDataUseCase(this.repository);

  Future<List<DataEntity>> call() async {
    return await repository.getData();
  }
}
