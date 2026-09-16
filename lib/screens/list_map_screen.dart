import 'package:flutter/material.dart';

class ListMapScreen extends StatefulWidget {
  const ListMapScreen({super.key});

  @override
  State<ListMapScreen> createState() => _ListMapScreenState();
}

class _ListMapScreenState extends State<ListMapScreen> {
  // List
  final List<String> _items = ['Apple', 'Banana', 'Mango'];
  final TextEditingController _controller = TextEditingController();

  // Map
  final Map<String, int> _scores = {
    'Rahim': 100,
    'Karim': 85,
    'Fatima': 95,
  };

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List & Map')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List Section
            const Text('📝 List Operations:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Add item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add_circle),
                  color: Colors.green,
                  iconSize: 36,
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...List.generate(_items.length, (index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(_items[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeItem(index),
                  ),
                ),
              );
            }),
            const Divider(height: 32),

            // Map Section
            const Text('🏆 Map Operations:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ..._scores.entries.map((entry) {
              return ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: Text(entry.key),
                trailing: Text(
                  '${entry.value} pts',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}