import '../entities/data_entity.dart';

abstract class DataRepository {
  Future<List<DataEntity>> getData();
}
