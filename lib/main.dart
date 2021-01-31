import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_riverpod/all.dart';

import 'ui/screens/home_screen.dart';

// ignore: avoid_void_async
void main() async {
  const envFile = String.fromEnvironment('ENVFILE', defaultValue: '.env');
  // ignore: avoid_redundant_argument_values
  await dot_env.load(fileName: envFile);

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const HomeScreen(),
    );
  }
}
