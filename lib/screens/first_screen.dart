import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentoring/generated/l10n.dart';
import 'package:flutter_mentoring/main_app.dart';
import 'package:flutter_mentoring/models/todo_model.dart';
import 'package:flutter_mentoring/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  static const routeName = 'first';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TodoModel? selectedTodo;

  void _callBack(BuildContext c) async {
    final result =
        await rootNavigatorKey.currentState!.pushNamed(SecondScreen.routeName);

    if (result != null && c.mounted) {
      setState(() {
        selectedTodo = result as TodoModel;
      });
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).simpleSample),
            Text(S.of(context).welcomeName('Ben')),
            Text(S.of(context).welcomeGender('men')),
            Text(S.of(context).welcomeRole('admin')),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => _callBack(context),
              child: const Text('GO TO 2nd SCREEN'),
            ),
            if (selectedTodo != null)
              ListTile(
                title: Text(selectedTodo!.title),
                trailing: selectedTodo!.completed
                    ? const Icon(
                        Icons.check_box_outlined,
                        color: Colors.green,
                      )
                    : const Icon(Icons.check_box_outline_blank),
              ),
          ],
        )),
      ),
    );
  }
}
