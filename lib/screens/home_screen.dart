import 'package:flutter/material.dart';
import 'variables_screen.dart';
import 'file_screen.dart';
import 'prefs_screen.dart';
import 'list_map_screen.dart';
import 'datetime_screen.dart';
import 'async_screen.dart';
import 'class_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.code, 'title': 'Variables', 'screen': const VariablesScreen()},
      {'icon': Icons.file_copy, 'title': 'File Read/Write', 'screen': const FileScreen()},
      {'icon': Icons.storage, 'title': 'Shared Preferences', 'screen': const PrefsScreen()},
      {'icon': Icons.list, 'title': 'List & Map', 'screen': const ListMapScreen()},
      {'icon': Icons.calendar_today, 'title': 'Date & Time', 'screen': const DateTimeScreen()},
      {'icon': Icons.sync, 'title': 'Async Demo', 'screen': const AsyncScreen()},
      {'icon': Icons.person, 'title': 'Class Demo', 'screen': const ClassScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🧰 Flutter Toolbox'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              leading: Icon(item['icon'] as IconData, color: Colors.blue),
              title: Text(item['title'] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => item['screen'] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}