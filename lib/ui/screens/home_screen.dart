import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        title: const Text('Basic Example'),
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
