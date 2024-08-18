import 'package:accenture/presentation/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/data_repository_impl.dart';
import 'data/datasources/data_remote_datasource.dart';
import 'domain/usecases/get_data_usecase.dart';
import 'presentation/bloc/data_bloc.dart';
import 'presentation/bloc/card_bloc.dart'; // Importe o CardBloc
import 'core/network/api_client.dart';
import 'presentation/pages/paginaPrincipal.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(http.Client());
    final dataRemoteDatasource = DataRemoteDatasource(apiClient);
    final dataRepository = DataRepositoryImpl(dataRemoteDatasource);
    final getDataUseCase = GetDataUseCase(dataRepository);

    //Inicia os providers dos blocs
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataCubit(getDataUseCase),
        ),
        BlocProvider(
          create: (context) => CardBloc(),
        ),
        BlocProvider(
          create: (_) => MenuBloc(),
          child: PaginaPrincipal(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PaginaPrincipal(),
      ),
    );
  }
}
