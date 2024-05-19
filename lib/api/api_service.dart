import 'package:dio/dio.dart';
import 'package:flutter_mentoring/helpers/constants.dart';
import 'package:flutter_mentoring/models/todo_model.dart';

abstract class IApiService {
  Future<List<TodoModel>> fetchTodos();
}

class ApiService implements IApiService {
  late Dio dio;

  ApiService() {
    dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    dio.options.baseUrl = Constants.baseUrl;
  }

  @override
  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get('todos');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => TodoModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
