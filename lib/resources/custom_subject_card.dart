import 'package:flutter/material.dart';
import 'package:scrolling_tabs/constants.dart';

class CustomSubjectCard extends StatelessWidget {

  bool active;
  String text;

  CustomSubjectCard(this.active, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: 200,
      decoration: BoxDecoration(
        color: active ? primary_color : secondary_color,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              color: active ? Colors.white : Colors.black,
            ),
          )
      ),
    );
  }
}
