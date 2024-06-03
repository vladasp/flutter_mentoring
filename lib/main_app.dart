import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mentoring/generated/l10n.dart';
import 'package:flutter_mentoring/screens/map_screen.dart';
import 'package:flutter_mentoring/screens/home_screen.dart';
import 'package:flutter_mentoring/screens/video_player_screen.dart';
import 'package:flutter_mentoring/screens/web_view_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        WebViewScreen.routeName: (context) => const WebViewScreen(),
        MapsScreen.routeName: (context) => const MapsScreen(),
        VideoPlayerScreen.routeName: (context) => const VideoPlayerScreen(),
      },
    );
  }
}
