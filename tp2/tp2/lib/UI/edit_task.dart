import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/viewmodel/TaskViewModel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditTask extends StatelessWidget {
  final Task task;
  final _formKey = GlobalKey<FormBuilderState>();

  EditTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier la Tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'title': task.title,
            'description': task.description,
          },
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'title',
                decoration: const InputDecoration(labelText: 'Titre'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'description',
                decoration: const InputDecoration(labelText: 'Description'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState?.save();
                  if (_formKey.currentState?.validate() ?? false) {
                    final values = _formKey.currentState!.value;
                    
                    // On met à jour l'objet task existant
                    task.title = values['title'];
                    task.description = values['description'];

                    await context.read<TaskViewModel>().updateTask(task);
                    
                    if (context.mounted) {
                      Navigator.pop(context); // Retour aux détails
                    }
                  }
                },
                child: const Text("Enregistrer les modifications"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
