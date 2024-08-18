import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/data_model.dart';
import '../../core/network/api_client.dart';

class DataRemoteDatasource {
  final ApiClient apiClient;

  DataRemoteDatasource(this.apiClient);

  Future<List<DataModel>> fetchData() async {
    final response = await apiClient
        .get('https://66bd572c74dfc195586c643a.mockapi.io/users');
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((data) => DataModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
