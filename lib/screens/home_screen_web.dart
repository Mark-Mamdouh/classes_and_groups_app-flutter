import 'dart:convert';
import 'package:classes_and_groups_app/utilities/constants.dart';
import 'package:classes_and_groups_app/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_subject_card.dart';
import '../widgets/custom_teacher_card.dart';
import 'package:http/http.dart' as http;


class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {

  List _items = [];
  List _teachers = [];
  int clickedItem = 0;

  // Fetch content from the json file
  Future<void> readLocalJson() async {
    final String response = await rootBundle.loadString('data.json');
    // print(response);
    final data = await json.decode(response);
    setState(() {
      _items = data["subjects"];
      _teachers = _items[clickedItem]['courses'];
    });
  }

  // Fetch content from fake api
  Future<void> readFakeApiJson() async {
    final response = await http.get(Uri.parse("${(apiUrl)}$token"));
    print(response);
    // print(response);
    final data = await json.decode(response.body);
    setState(() {
      _items = data["subjects"];
      _teachers = _items[clickedItem]['courses'];
    });
  }

  @override
  void initState() {
    super.initState();
    // read data from json file
    readFakeApiJson();
  }

  @override
  Widget build(BuildContext context) {

    // initialize media query object
    SizeConfig().init(context);

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
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal * 5),
                        bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 5),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // vertical space
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 10),
                        child: Text(
                          "Classes and Groups",
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
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
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockVertical * 2, top: SizeConfig.safeBlockVertical * 3),
                  color: kBodyColor,
                  child: Row(
                    children: [
                      // subject horizontal list
                      Expanded(
                        flex: 2,
                        child: _items.isNotEmpty ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: ListView.builder(
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // update clicked item
                                    clickedItem = index;
                                    // update teachers list according to clicked subject
                                    readFakeApiJson();
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: CustomSubjectCard(
                                      clickedItem == index ? true : false,
                                      _items[index]["title"]
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        : Container(),
                      ),

                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "List of courses",
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                              ),
                            ),

                            // teacher vertical listview
                            Expanded(
                              child: _teachers.isNotEmpty ? ListView.builder(

                                itemCount: _teachers.length,
                                itemBuilder: (context, index) {
                                  return CustomTeacherCard(
                                    _teachers[index]["teacher_name"],
                                    _teachers[index]["starting_date"],
                                  );
                                },
                              )
                              : Container(),
                            ),
                          ],
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
