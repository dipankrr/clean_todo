import 'package:clean_todo/data/dbhelper.dart';
import 'package:clean_todo/providers/theme_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';

class TaskCard extends StatelessWidget {
  final String todoText;
  final dynamic onIconTap;
  final dynamic delFunc;
  final dynamic tapTextFunc;
  final int indx;
  const TaskCard({super.key, required this.indx, required this.todoText, required this.onIconTap, required this.delFunc,  this.tapTextFunc, });

  @override
  Widget build(BuildContext context) {
    return
      Consumer<ThemeProv>(
        builder: (context, thProv, child) {
          return Consumer<DBProvider>(
            builder: (context, prov, child) {
              final data = prov.allToDoData;
              final dd = data[indx][DBHelper.columnIsDone];
              return
                GestureDetector(

                  onLongPress: delFunc,
                  child: Container(
                    width: double.infinity, height: 50,
                    decoration: BoxDecoration(
                      color: thProv.taskCardClr,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 15),
                          child: GestureDetector(
                              onTap: onIconTap,
                              child: dd == 0 ? Icon(Icons.circle_outlined, color: Colors.white24,) : Icon(Icons.check_circle, color: Colors.white24,)

                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                              onDoubleTap: tapTextFunc,
                              child: Text(todoText.toString(),
                                style: TextStyle(
                                  // letterSpacing: .3,
                                  height: 0.99,
                                  fontSize: 20, color: dd == 0 ? Colors.white : Colors.white38,
                                  decoration: dd == 0 ? TextDecoration.none : TextDecoration.lineThrough, decorationColor: Colors.white38, ),
                                maxLines: 2, overflow: TextOverflow.ellipsis,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
            },
          );
        },
      );
  }
}
