import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentoring/main_app.dart';
import 'package:flutter_mentoring/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  static const routeName = 'first';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void _callBack(BuildContext c) async {
    final result =
        await rootNavigatorKey.currentState!.pushNamed(SecondScreen.routeName);

    if (result != null && c.mounted) {
      showDialog(
        context: c,
        builder: (context) => AlertDialog(
          content: Text('Result from second screen: ${result.toString()}'),
          actions: [
            TextButton(
                onPressed: () {
                  rootNavigatorKey.currentState!.pop();
                },
                child: const Text('Ok'))
          ],
        ),
      );
    }
  }

  void _tryNavigateBack(didPop) async {
    if (didPop) return;
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Do you want to exit an app?'),
        actions: [
          TextButton(
              onPressed: () {
                rootNavigatorKey.currentState!.pop(true);
              },
              child: const Text('Ok')),
          TextButton(
              onPressed: () {
                rootNavigatorKey.currentState!.pop(false);
              },
              child: const Text('Cancel'))
        ],
      ),
    );
    if (result is bool && result) {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _tryNavigateBack,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('First screen'),
          elevation: 2,
        ),
        body: Center(
          child: TextButton(
            onPressed: () => _callBack(context),
            child: const Text('Go next'),
          ),
        ),
      ),
    );
  }
}
