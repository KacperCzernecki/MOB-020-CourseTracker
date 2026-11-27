import 'package:course_tracker/services/database_service.dart';
import 'package:flutter/material.dart';

import '../models/module.dart';

import 'package:uuid/uuid.dart';

class AddModuleScreen extends StatefulWidget {
  final String courseId;
  const AddModuleScreen({super.key, required this.courseId});
  @override
  State<AddModuleScreen> createState() => _AddModuleScreenState();
}

class _AddModuleScreenState extends State<AddModuleScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _uuid = Uuid();
  final DatabaseService _db = DatabaseService();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dodaj moduł")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: ("Nazwa Modułu")),
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return "Podaj nazwę Modułu";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  var name = _nameController.text;

                  if (_formKey.currentState!.validate()) {
                    final order = await _db.getLastNumber(widget.courseId);
                    final newModule = Module(
                      id: _uuid.v4(),
                      name: name,
                      parentId: widget.courseId,
                      order: order,
                      isCompleted: false,
                    );
                    if (!context.mounted) return;
                    Navigator.pop(context, newModule);
                  }
                },
                child: Text("Zapisz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
