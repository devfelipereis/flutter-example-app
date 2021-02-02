import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../themes/app_theme_provider.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';
import 'characters_screen.dart';
import 'posts_screen.dart';

final tabIndexProvider = StateProvider((ref) => 0);

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
        title: const Text(
          'Basic Example',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(
                        children: <Widget>[
                          ListTile(
                            title: const Text('Light'),
                            onTap: () {
                              context.read(themeDataProvider).state =
                                  lightThemeData;
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('Dark'),
                            onTap: () {
                              context.read(themeDataProvider).state =
                                  darkThemeData;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Consumer(builder: (context, watch, _) {
        final index = watch(tabIndexProvider).state;
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Characters',
            ),
          ],
          currentIndex: index,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (int index) => context.read(tabIndexProvider).state = index,
        );
      }),
      body: Consumer(builder: (context, watch, _) {
        final index = watch(tabIndexProvider).state;
        return IndexedStack(
          index: index,
          children: _screens,
        );
      }),
    );
  }
}
