import 'package:classes_and_groups_app/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../resources/custom_subject_card.dart';
import '../resources/custom_teacher_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {

    List<Widget> subjects = [];

    subjects.add(CustomSubjectCard(true, "item1"));

    for(int i = 2; i < 7; i++) {
      subjects.add(CustomSubjectCard(false, "item$i"));
    }

    List<Widget> teachers = [];
    for(int i = 1; i <= 20; i++) {
      teachers.add(CustomTeacherCard("Teacher$i", "Starting Date"));
    }

    return MaterialApp(
      home: Scaffold(
        // be aware of notches
        body: SafeArea(
          child: Column(
            children: [
              // title bar
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: primary_color,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          "Classes and Groups",
                          style: TextStyle(
                            fontSize: 30,
                            color: secondary_color,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // body
              Expanded(
                flex: 4,
                child: Container(
                  color: body_color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: subjects,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        child: Text(
                          "List Of Courses",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: teachers,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
