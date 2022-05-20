import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../utilities/size_config.dart';

class CustomTeacherCard extends StatelessWidget {

  String teacherName;
  String startingDate;

  CustomTeacherCard(this.teacherName, this.startingDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1.5),
      color: kSecondaryColor,
      child: Row(
          children:[
            Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
              child: Image(
                image: AssetImage("images/teacher.png"),
                width: SizeConfig.safeBlockHorizontal * 8,
                height: SizeConfig.safeBlockVertical * 8,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  teacherName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
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
