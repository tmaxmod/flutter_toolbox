import 'package:flutter/material.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({super.key});

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  String _result = 'Press button to start';
  bool _loading = false;

  // Future example
  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return '✅ Data loaded successfully!';
  }

  // Multiple awaits
  Future<String> _multiStep() async {
    setState(() => _result = 'Step 1: Connecting...');
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _result = 'Step 2: Fetching...');
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _result = 'Step 3: Processing...');
    await Future.delayed(const Duration(seconds: 1));

    return '🎉 All steps completed!';
  }

  Future<void> _runAsync() async {
    setState(() {
      _loading = true;
      _result = 'Loading...';
    });

    final data = await _fetchData();

    setState(() {
      _result = data;
      _loading = false;
    });
  }

  Future<void> _runMultiStep() async {
    setState(() => _loading = true);

    final data = await _multiStep();

    setState(() {
      _result = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (_loading)
                      const CircularProgressIndicator()
                    else
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      _result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loading ? null : _runAsync,
              icon: const Icon(Icons.download),
              label: const Text('Fetch Data (2s)'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _loading ? null : _runMultiStep,
              icon: const Icon(Icons.sync),
              label: const Text('Multi-Step (3s)'),
            ),
          ],
        ),
      ),
    );
  }
}