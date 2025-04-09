import 'package:flutter_app/constants/nav_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/mobile/menu-button.dart';

class DrawerMob extends StatelessWidget {
  const DrawerMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 34, 61),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
              child: IconButton(
                  color: const Color(0xffA6FAFF),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            MenuButton(
                title: navTitles[i], path: navPaths[i], icon: navIcons[i])
        ],
      ),
    );
  }
}
