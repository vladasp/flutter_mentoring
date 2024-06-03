import 'package:flutter/material.dart';
import 'package:flutter_mentoring/main_app.dart';
import 'package:flutter_mentoring/screens/map_screen.dart';
import 'package:flutter_mentoring/screens/video_player_screen.dart';
import 'package:flutter_mentoring/screens/web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async => {
                await rootNavigatorKey.currentState!
                    .pushNamed(WebViewScreen.routeName)
              },
              child: const Text('Open WebView screen'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () async => {
                await rootNavigatorKey.currentState!
                    .pushNamed(MapsScreen.routeName)
              },
              child: const Text('Open Maps screen'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () async => {
                await rootNavigatorKey.currentState!
                    .pushNamed(VideoPlayerScreen.routeName)
              },
              child: const Text('Open VideoPlayer screen'),
            ),
          ],
        ),
      ),
    );
  }
}
