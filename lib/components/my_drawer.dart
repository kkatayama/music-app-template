import 'package:flutter/material.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            ),
          ),

          // home list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: () {
                // pop the drawer
                Navigator.pop(context);
              },
            ),
          ),

          // settings list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                // pop the drawer
                Navigator.pop(context);

                // navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
