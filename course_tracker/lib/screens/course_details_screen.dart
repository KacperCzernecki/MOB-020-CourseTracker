import 'package:flutter/material.dart';

import "../models/course.dart";
import "../models/module.dart";
import '../services/database_service.dart';
import 'add_module_screen.dart';
import 'add_course_screen.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  final ValueChanged<Course> onCourseUpdate;
  const CourseDetailsScreen({
    super.key,
    required this.course,
    required this.onCourseUpdate,
  });
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final DatabaseService _db = DatabaseService();
  List<Module> _modules = [];
  bool _isLoading = true;
  late Course _course;

  @override
  void initState() {
    super.initState();
    _loadModules();
    _course = widget.course;
  }

  Future<void> _loadModules() async {
    final modules = await _db.getModules(widget.course.id);

    if (!mounted) return;

    setState(() {
      _modules = modules;
      _isLoading = false;
    });
  }

  Future<void> _addModule() async {
    final module = await Navigator.push<Module>(
      context,
      MaterialPageRoute(
        builder: (context) => AddModuleScreen(courseId: widget.course.id),
      ),
    );
    if (!mounted) return;
    if (module != null) {
      await _db.insertModule(module);
      await _loadModules();
    }
  }

  Future<void> _editCourse() async {
    final course = await Navigator.push<Course>(
      context,
      MaterialPageRoute(
        builder: (context) => AddCourseScreen(course: widget.course),
      ),
    );
    if (!mounted) return;
    if (course != null) {
      final updated = await _db.updateCourse(course);
      if (updated == 0) {
        return;
      }
      setState(() {
        _course = course;
      });
      widget.onCourseUpdate(course);
    }
  }

  Future<void> _deleteModule(String moduleId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Usunąć moduł?"),
          content: Text(
            "Element zostanie trwale usunięty. Tej operacji nie można cofnąć",
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                "Anuluj",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Usuń", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
    if (confirmed == true) {
      await _db.deleteModule(moduleId);
      if (!mounted) return;
      await _loadModules();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _course.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Źródło: ${_course.source}',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [IconButton(onPressed: _editCourse, icon: Icon(Icons.edit))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addModule,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : _modules.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_book),
                          Text("Ten kurs nie ma jeszcze modułów"),
                          Text("Dodaj pierwszy moduł, aby śledzić postępy"),
                        ],
                      )
                    : ListView.builder(
                        itemCount: _modules.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                '${_modules[index].order}. ${_modules[index].name}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                _modules[index].isCompleted
                                    ? "Ukończono"
                                    : "W trakcie",
                                style: TextStyle(
                                  color: _modules[index].isCompleted
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: _modules[index].isCompleted,
                                    onChanged: (bool? value) async {
                                      if (value == null) return;
                                      await _db.updateModule(
                                        _modules[index].id,
                                        value,
                                      );
                                      await _loadModules();
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      _deleteModule(_modules[index].id);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
