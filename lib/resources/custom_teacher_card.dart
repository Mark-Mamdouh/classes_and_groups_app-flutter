import 'package:flutter/material.dart';
import 'package:scrolling_tabs/constants.dart';

class CustomTeacherCard extends StatelessWidget {

  String teacherName;
  String startingDate;

  CustomTeacherCard(this.teacherName, this.startingDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: 200,
      color: secondary_color,
      child: Row(
          children:[
            const Padding(
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage("images/teacher.png"),
                width: 40,
                height: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  teacherName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  startingDate,
                  style: const TextStyle(
                    color: Colors.grey
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
