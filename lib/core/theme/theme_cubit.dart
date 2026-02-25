import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  Future<void> loadTheme() async {
    final box = await Hive.openBox('settings');
    final isDark = box.get('isDarkMode', defaultValue: false) as bool;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme() async {
    final isDark = state == ThemeMode.dark;
    final box = await Hive.openBox('settings');
    await box.put('isDarkMode', !isDark);
    emit(!isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
