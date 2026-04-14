import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/viewmodel/TaskViewModel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddTask extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'title',
                  decoration: const InputDecoration(labelText: 'Nom de la tâche'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'description',
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState?.validate() ?? false) {
                      // 1. On attend (await) que la tâche soit ajoutée et la liste rafraîchie
                      await context.read<TaskViewModel>().addTask(
                        Task.addTask(
                          _formKey.currentState?.value['title'] ?? '',
                          _formKey.currentState?.value['description'] ?? '',
                          5,
                        ),
                      );
                      
                      // 2. Une fois que c'est fait, on ferme la page
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text("Ajouter une Task"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
