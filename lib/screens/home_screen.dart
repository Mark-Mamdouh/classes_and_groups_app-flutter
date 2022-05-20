import 'dart:convert';
import 'package:classes_and_groups_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/custom_subject_card.dart';
import '../resources/custom_teacher_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List _items = [];
  List _teachers = [];
  int clickedItem = 0;

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data.json');
    // print(response);
    final data = await json.decode(response);
    setState(() {
      _items = data["subjects"];
      _teachers = _items[clickedItem]['courses'];
    });
  }

  @override
  void initState() {
    super.initState();
    // read data from json file
    readJson();
  }

  @override
  Widget build(BuildContext context) {
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
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          "Classes and Groups",
                          style: TextStyle(
                            fontSize: 30,
                            color: kSecondaryColor,
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
                  color: kBodyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // subject horizontal list
                      _items.isNotEmpty ? SizedBox(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickedItem = index;
                                  readJson();
                                });
                              },
                              child: CustomSubjectCard(
                                true,
                                _items[index]["title"]
                              ),
                            );

                          },
                        ),
                        height: 80,
                      )
                      : Container(),

                      const Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                        child: Text(
                          "List Of Courses",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),


                      // teacher vertical listview
                      _teachers.isNotEmpty ? Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: _teachers.length,
                          itemBuilder: (context, index) {
                            return CustomTeacherCard(
                              _teachers[index]["teacher_name"],
                              _teachers[index]["starting_date"],
                            );
                          },
                        ),
                      )
                      : Container(),
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
