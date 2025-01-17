// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mhami/core/const_colors.dart';

import '../model/taskModel.dart';
class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task?.color??0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task?.title??"",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: task!.isCompleted == 1 ?TextDecoration.lineThrough:null,),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${task!.startTime} - ${task!.endTime}",
                      style: TextStyle(fontSize: 13, color: Colors.grey[100]),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  task?.note??"",
                  style:TextStyle(fontSize: 15, color: Colors.grey[100],
                    decoration: task!.isCompleted == 1 ?TextDecoration.lineThrough:null,),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task!.isCompleted == 1 ? "اكتملت" : "قيد التنفيذ",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Constants.primaryColor;
      case 1:
        return Constants.GREEN;
      case 2:
        return Constants.OrangeIcon;
      case 3:
        return Constants.PurpleAccent;
      case 4:
        return Constants.PurpleShadow;
      case 5:
        return Constants.YellowIcon;
      default:
        return Constants.PurpleAccent;
    }
  }
}