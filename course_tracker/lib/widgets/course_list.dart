import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseList extends StatelessWidget {
  final List<Course> courses;
  final Function(Course) onCourseTap;

  const CourseList({
    super.key,
    required this.courses,
    required this.onCourseTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(courses[index].name),
            subtitle: Text(courses[index].source),
            onTap: () => onCourseTap(courses[index]),
          ),
        );
      },
    );
  }
}
