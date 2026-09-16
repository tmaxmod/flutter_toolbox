import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({super.key});

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  final TextEditingController _controller = TextEditingController();
  String _content = '';
  String _filePath = '';

  Future<void> _writeFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/myfile.txt');
      await file.writeAsString(_controller.text);
      setState(() {
        _filePath = file.path;
      });
      _showSnack('File saved!');
    } catch (e) {
      _showSnack('Error: $e');
    }
  }

  Future<void> _readFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/myfile.txt');
      if (await file.exists()) {
        final data = await file.readAsString();
        setState(() {
          _content = data;
        });
      } else {
        setState(() {
          _content = 'File not found!';
        });
      }
    } catch (e) {
      _showSnack('Error: $e');
    }
  }

  Future<void> _deleteFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/myfile.txt');
      if (await file.exists()) {
        await file.delete();
        setState(() {
          _content = '';
          _filePath = '';
        });
        _showSnack('File deleted!');
      }
    } catch (e) {
      _showSnack('Error: $e');
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Read/Write')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Write something',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _writeFile,
                    icon: const Icon(Icons.save),
                    label: const Text('Write'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _readFile,
                    icon: const Icon(Icons.file_open),
                    label: const Text('Read'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _deleteFile,
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_content.isNotEmpty) ...[
              const Text('📄 File Content:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_content),
              ),
            ],
            if (_filePath.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text('📂 Path: $_filePath',
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ],
        ),
      ),
    );
  }
}