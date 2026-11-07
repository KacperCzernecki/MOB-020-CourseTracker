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
}
