import 'package:flutter/material.dart';

import 'screens/catatan_screen.dart';
import 'screens/tentang_screen.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const PanenApp());

class PanenApp extends StatelessWidget {
  const PanenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PANEN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final _pages = const [
    HomeScreen(),
    CatatanScreen(),
    EdukasiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Beranda'),
          NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'Catatan'),
          NavigationDestination(
              icon: Icon(Icons.people_outlined),
              selectedIcon: Icon(Icons.people),
              label: 'Tentang'),
        ],
      ),
    );
  }
}
