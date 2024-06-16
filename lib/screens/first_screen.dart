import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentoring/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  static const routeName = 'first';

  void _callBack(BuildContext context) async {
    final result =
        await Navigator.of(context).pushNamed(SecondScreen.routeName);

    if (result != null && context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Result from second screen: ${result.toString()}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'))
          ],
        ),
      );
    }
  }

  void _tryNavigateBack(bool didPop, BuildContext context) async {
    if (didPop) return;
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Do you want to exit an app?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Ok')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          )
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
      onPopInvoked: (didPop) => _tryNavigateBack(didPop, context),
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
