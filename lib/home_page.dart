import 'package:flutter/material.dart';
import 'package:satagromini/poligons/views/map_page.dart';
import 'package:satagromini/table/views/table_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MapPage(),
                  ),
                );
              },
              child: const Text('Map'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TablePage(),
                  ),
                );
              },
              child: const Text('Table'),
            ),
          ],
        ),
      ),
    );
  }
}
