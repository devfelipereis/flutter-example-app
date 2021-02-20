import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:example_app/hive_storage.dart';
import 'package:example_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:states_rebuilder/states_rebuilder.dart';

import 'service_locator.dart';
import 'ui/screens/home_screen.dart';
import 'ui/themes/app_theme_provider.dart';

// ignore: avoid_void_async
void main() async {
  const envFile = String.fromEnvironment('ENVFILE', defaultValue: '.env');
  // ignore: avoid_redundant_argument_values
  await dot_env.load(fileName: envFile);
  setupLocator();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'US')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TopAppWidget(
      waiteFor: () => [
        //Plugins can be initialized, to display our Splash screen
        RM.storageInitializer(HiveStorage()),
        // can be removed... just here to show the splash screen
        Future.delayed(
          const Duration(seconds: 3),
        ),
      ],
      injectedTheme: theme,
      onWaiting: () => const SplashScreen(),
      builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          themeMode: theme.themeMode,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const HomeScreen(),
        );
      },
    );
  }
}
