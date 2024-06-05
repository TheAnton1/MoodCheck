import 'package:flutter/material.dart';
import 'package:mood_test/features/calendar/presentation/notifier/calendar_notifier.dart';
import 'package:mood_test/features/calendar/presentation/ui/calendar_screen.dart';
import 'package:mood_test/features/main_screen/presentation/notifier/main_notifier.dart';
import 'package:mood_test/features/main_screen/presentation/ui/main_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Mood',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: "/main",
      routes: {
        "/main": (context) => ChangeNotifierProvider(
            create: (_) => MainScreenChangeNotifier(),
            child: const MainScreen()),
        "/calendar": (context) => ChangeNotifierProvider(
              create: (_) => CalendarNotifier(),
              child: const CalendarScreen(),
            )
      },
    );
  }
}
