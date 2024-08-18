import '../models/data_model.dart';
import '../datasources/data_remote_datasource.dart';
import '../../domain/entities/data_entity.dart';
import '../../domain/repositories/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final DataRemoteDatasource remoteDatasource;

  DataRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<DataEntity>> getData() async {
    final dataModels = await remoteDatasource.fetchData();
    return dataModels
        .map((model) => DataEntity(
            title: model.title, imageURL: model.imageURL, itemId: model.itemId))
        .toList();
  }
}
