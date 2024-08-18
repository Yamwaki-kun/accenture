import 'package:accenture/data/models/app_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<AppThemeModel> {
  ThemeCubit()
      : super(AppThemeModel(primaryColor: Colors.black, backgroundColor: Colors.white));

  void changeTheme(AppThemeModel newTheme) => emit(newTheme);
}
