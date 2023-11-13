import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Menu',
              style: TextStyle(fontSize: 22),
            ),
            const Padding(
              padding: EdgeInsets.all(50),
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
