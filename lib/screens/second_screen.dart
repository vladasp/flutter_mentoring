import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  static const routeName = 'second';

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
                  Navigator.of(context).pop(42);
                },
                child: const Text('Return 42'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop('AbErVaLlG');
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
