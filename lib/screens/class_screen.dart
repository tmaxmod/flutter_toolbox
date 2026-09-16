import 'package:flutter/material.dart';

// Class example
class Player {
  final String name;
  int score;
  final String role;

  Player({
    required this.name,
    this.score = 0,
    this.role = 'Hider',
  });

  // Named constructor
  Player.guest()
      : name = 'Guest',
        score = 0,
        role = 'Hider';

  void addScore(int points) {
    score += points;
  }

  // Getter
  String get info => '$name ($role) - $score pts';

  @override
  String toString() => info;
}

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final List<Player> _players = [
    Player(name: 'Rahim', score: 100, role: 'Seeker'),
    Player(name: 'Karim', score: 80),
    Player.guest(),
  ];

  void _addScore(Player player) {
    setState(() {
      player.addScore(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Class Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('🎮 Player Class Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._players.map((player) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        player.role == 'Seeker' ? Colors.red : Colors.blue,
                    child: Text(
                      player.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(player.name),
                  subtitle: Text('Role: ${player.role}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${player.score}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Colors.green),
                        onPressed: () => _addScore(player),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}