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
  bool _isLoading = true;
  String? _errorMessage;

  Future<void> _loadCourses() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final data = await db.getCourses();
      if (!mounted) return;
      setState(() {
        courses
          ..clear()
          ..addAll(data);
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _errorMessage = error.toString();
      });
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
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
      body: _isLoading
          ? CircularProgressIndicator()
          : _errorMessage != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _errorMessage.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: _loadCourses,
                    child: Icon(Icons.refresh),
                  ),
                ],
              ),
            )
          : CourseList(
              courses: courses,
              onCourseTap: (course) async {
                final deleted = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsScreen(
                      course: course,
                      onCourseUpdate: (updatedCourse) {
                        final index = courses.indexWhere(
                          (item) => item.id == updatedCourse.id,
                        );
                        if (index != -1) {
                          setState(() {
                            courses[index] = updatedCourse;
                          });
                        }
                      },
                    ),
                  ),
                );
                if (deleted == true) {
                  setState(() {
                    courses.removeWhere((item) => item.id == course.id);
                  });
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final messenger = ScaffoldMessenger.of(context);
          final newCourse = await Navigator.push<Course>(
            context,
            MaterialPageRoute(builder: (context) => const AddCourseScreen()),
          );

          if (newCourse != null) {
            try {
              await db.insertCourse(newCourse);
              if (!mounted) return;
              setState(() {
                courses.add(newCourse);
              });
            } catch (error) {
              if (!mounted) return;
              messenger.showSnackBar(
                SnackBar(
                  content: Text(
                    "Nie udało się zapisać kursu. Spróbuj ponownie",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
