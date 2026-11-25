import 'package:course_tracker/models/module.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import "../models/course.dart";

class DatabaseService {
  Database? _database;
  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    }
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'course_tracker.db');

    _database = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE courses(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        source TEXT NOT NULL)
        ''');

        await db.execute('''
        CREATE TABLE modules(
        id TEXT PRIMARY KEY,
        parent_id TEXT NOT NULL,
        name TEXT NOT NULL,
        module_order INTEGER NOT NULL,
        is_completed INTEGER NOT NULL,
        FOREIGN KEY (parent_id) REFERENCES courses(id),
        UNIQUE (parent_id, module_order)
        )
        ''');
      },
    );
    return _database!;
  }

  Future<int> insertCourse(Course course) async {
    final db = await getDatabase();

    return db.insert('courses', {
      'id': course.id,
      'name': course.name,
      'source': course.source,
    });
  }

  Future<int> insertModule(Module module) async {
    final db = await getDatabase();

    return db.insert("modules", {
      'id': module.id,
      'parent_id': module.parentId,
      'name': module.name,
      'module_order': module.order,
      'is_completed': module.isCompleted ? 1 : 0,
    });
  }

  Future<List<Course>> getCourses() async {
    final db = await getDatabase();

    final courses = await db.query("courses");

    return courses.map((course) {
      return Course(
        id: course['id'] as String,
        name: course['name'] as String,
        source: course['source'] as String,
      );
    }).toList();
  }

  Future<List<Module>> getModules(String courseId) async {
    final db = await getDatabase();

    final modules = await db.query(
      "modules",
      where: 'parent_id = ?',
      whereArgs: [courseId],
      orderBy: 'module_order ASC',
    );

    return modules.map((module) {
      return Module(
        id: module['id'] as String,
        parentId: module["parent_id"] as String,
        name: module["name"] as String,
        order: module["module_order"] as int,
        isCompleted: module["is_completed"] == 1,
      );
    }).toList();
  }

  Future<void> updateModule(String moduleId, bool isCompleted) async {
    final db = await getDatabase();

    await db.update(
      'modules',
      {'is_completed': isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [moduleId],
    );
  }

  Future<int> getLastNumber(String courseId) async {
    final modules = await getModules(courseId);

    if (modules.isEmpty) {
      return 1;
    }
    final lastOrder = modules
        .map((module) => module.order)
        .reduce((a, b) => a > b ? a : b);

    return lastOrder + 1;
  }

  Future<int> deleteModule(String moduleId) async {
    final db = await getDatabase();

    return await db.delete('modules', where: 'id = ?', whereArgs: [moduleId]);
  }
}
