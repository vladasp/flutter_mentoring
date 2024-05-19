import 'package:flutter/material.dart';
import 'package:flutter_mentoring/api/api_service.dart';
import 'package:flutter_mentoring/main_app.dart';
import 'package:get_it/get_it.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  static const routeName = 'second';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late IApiService apiService = GetIt.I.get<IApiService>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos list'),
            elevation: 2,
          ),
          body: FutureBuilder(
            future: apiService.fetchTodos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final model = snapshot.data![index];
                      return ListTile(
                        title: Text(model.title),
                        trailing: model.completed
                            ? const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              )
                            : const Icon(Icons.check_box_outline_blank),
                        onTap: () {
                          rootNavigatorKey.currentState!.pop(model);
                        },
                      );
                    },
                  );
                }

                return const Center(
                  child: Text('Todos list is empty'),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
