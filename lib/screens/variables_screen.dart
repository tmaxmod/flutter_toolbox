import 'package:flutter/material.dart';

class VariablesScreen extends StatefulWidget {
  const VariablesScreen({super.key});

  @override
  State<VariablesScreen> createState() => _VariablesScreenState();
}

class _VariablesScreenState extends State<VariablesScreen> {
  // Get/Set variables
  String _name = 'Rahim';
  int _age = 20;
  double _height = 5.8;
  bool _isStudent = true;
  final String _constant = 'Flutter';

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
  }

  void _updateName() {
    setState(() {
      _name = _nameController.text;
    });
  }

  void _incrementAge() {
    setState(() {
      _age++;
    });
  }

  void _toggleStudent() {
    setState(() {
      _isStudent = !_isStudent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Variables Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // String
            const Text('String (Get/Set):',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _updateName,
              child: const Text('Update Name'),
            ),
            Text('Name: $_name', style: const TextStyle(fontSize: 18)),
            const Divider(height: 32),

            // Int
            const Text('Int (Increment):',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Age: $_age', style: const TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: _incrementAge,
              child: const Text('+1 Year'),
            ),
            const Divider(height: 32),

            // Double
            const Text('Double:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Height: $_height ft',
                style: const TextStyle(fontSize: 18)),
            const Divider(height: 32),

            // Bool
            const Text('Boolean (Toggle):',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('Is Student: $_isStudent',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 16),
                Switch(
                  value: _isStudent,
                  onChanged: (value) => _toggleStudent(),
                ),
              ],
            ),
            const Divider(height: 32),

            // Final
            const Text('Final (Constant):',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Framework: $_constant',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}