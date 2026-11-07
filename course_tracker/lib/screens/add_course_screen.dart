import 'package:flutter/material.dart';

import '../models/course.dart';

import 'package:uuid/uuid.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});
  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _nameController = TextEditingController();
  final _sourceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _uuid = Uuid();

  @override
  void dispose() {
    _nameController.dispose();
    _sourceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dodaj kurs")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: ("Nazwa kursu")),
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return "Podaj nazwę kursu";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _sourceController,
                decoration: InputDecoration(labelText: ("Źródło kursu")),
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return "Podaj źródło kursu";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  var name = _nameController.text;
                  var source = _sourceController.text;

                  if (_formKey.currentState!.validate()) {
                    final newCourse = Course(
                      id: _uuid.v4(),
                      name: name,
                      source: source,
                    );
                    Navigator.pop(context, newCourse);
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
