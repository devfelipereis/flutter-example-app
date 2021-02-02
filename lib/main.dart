import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_riverpod/all.dart';

import 'ui/screens/home_screen.dart';
import 'ui/themes/app_theme_provider.dart';

// ignore: avoid_void_async
void main() async {
  const envFile = String.fromEnvironment('ENVFILE', defaultValue: '.env');
  // ignore: avoid_redundant_argument_values
  await dot_env.load(fileName: envFile);

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = watch(themeDataProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme.state,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const HomeScreen(),
    );
  }
}
