// visibility_cubit.dart
import 'package:bloc/bloc.dart';

class MenuBloc extends Cubit<bool> {
  MenuBloc() : super(false);

  void show() => emit(true);
  void hide() => emit(false);
}
