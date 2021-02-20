import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../themes/app_theme_provider.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';
import 'characters_screen.dart';
import 'posts_screen.dart';

final tabIndexProvider = RM.inject<int>(() => 0);

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  static const List<Widget> _screens = <Widget>[
    PostsScreen(),
    CharactersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home_title'.tr(),
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext _) {
                    return Wrap(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Light'),
                          onTap: () {
                            theme.themeMode = ThemeMode.light;
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: const Text('Dark'),
                          onTap: () {
                            theme.themeMode = ThemeMode.dark;
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext _) {
                    return Wrap(
                      children: <Widget>[
                        ListTile(
                          title: const Text('pt-BR'),
                          onTap: () {
                            context.locale = const Locale('pt', 'BR');
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: const Text('en-US'),
                          onTap: () {
                            context.locale = const Locale('en', 'US');
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(
                Icons.translate,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: On(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard),
              label: 'tab_posts'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.people),
              label: 'tab_characters'.tr(),
            ),
          ],
          currentIndex: tabIndexProvider.state,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (int index) => tabIndexProvider.setState((s) => index),
        ),
      ).listenTo(tabIndexProvider),
      body: On(
        () => IndexedStack(
          index: tabIndexProvider.state,
          children: _screens,
        ),
      ).listenTo(tabIndexProvider),
    );
  }
}
