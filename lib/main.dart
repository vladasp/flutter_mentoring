import 'package:flutter/material.dart';
import 'package:flutter_mentoring/api/api_service.dart';
import 'package:flutter_mentoring/main_app.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton<IApiService>(ApiService());
  runApp(const MainApp());
}
