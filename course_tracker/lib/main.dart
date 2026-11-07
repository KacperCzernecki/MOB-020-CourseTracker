import 'package:flutter/material.dart';

import 'screens/add_course_screen.dart';
import 'screens/course_details_screen.dart';
import 'models/course.dart';
import 'widgets/course_list.dart';
import 'services/database_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CourseTracker MOB-020',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courses = <Course>[];
  final db = DatabaseService();

  Future<void> _loadCourses() async {
    final data = await db.getCourses();
    if (!mounted) return;
    setState(() {
      courses.addAll(data);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CourseTracker")),
      body: CourseList(
        courses: courses,
        onCourseTap: (course) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsScreen(course: course),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCourse = await Navigator.push<Course>(
            context,
            MaterialPageRoute(builder: (context) => const AddCourseScreen()),
          );

          if (newCourse != null) {
            await db.insertCourse(newCourse);
            if (!mounted) return;
            setState(() {
              courses.add(newCourse);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
