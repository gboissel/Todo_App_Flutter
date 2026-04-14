import 'package:flutter/material.dart';
import 'package:tp2/models/todo.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${todo.id}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Titre:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              todo.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Statut: '),
                Icon(
                  todo.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: todo.completed ? Colors.green : Colors.grey,
                ),
                Text(
                  todo.completed ? ' Terminé' : ' En cours',
                  style: TextStyle(
                    color: todo.completed ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
