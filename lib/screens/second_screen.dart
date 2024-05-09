import 'package:flutter/material.dart';
import 'package:flutter_mentoring/main_app.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  static const routeName = 'second';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second screen'),
          elevation: 2,
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  rootNavigatorKey.currentState!.pop(42);
                },
                child: const Text('Return 42'),
              ),
              TextButton(
                onPressed: () async {
                  rootNavigatorKey.currentState!.pop('AbErVaLlG');
                },
                child: const Text('Return AbErVaLlG'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
