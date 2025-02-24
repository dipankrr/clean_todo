import 'package:clean_todo/components/task_card.dart';
import 'package:clean_todo/data/dbhelper.dart';
import 'package:clean_todo/screens/edit_todo_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';
import 'confirm_del_alert.dart';

class SomedayTasks extends StatelessWidget {
  final String dayTitle;

   const SomedayTasks({super.key, required this.dayTitle});

  @override
  Widget build(BuildContext context) {
    return
      Consumer<DBProvider>(
        builder: (context, prov, child) {
          final data = prov.allToDoData;
          int somedayCount = data.where((todo) => todo[DBHelper.columnIsToday] == 0 && todo[DBHelper.columnIsDone] == 0).length;

          return
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 20,),
                        SizedBox(width: 5,),
                        Text(dayTitle, style: TextStyle(fontSize: 25),),
                        SizedBox(width: 8,),
                        Container(
                          height: 20, width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white24
                          ),
                          child: Center(child: Text(somedayCount.toString())),
                        )
                      ],
                    ),

                    SizedBox(height: 5,),

                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          //margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 18,),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: data.length,
                                    itemBuilder: (_, index){

                                      final String todo = data[index][DBHelper.COLUMN_TODO];
                                      final int d = data[index][DBHelper.columnIsToday];
                                      final int dd = data[index][DBHelper.columnIsDone];
                                      final int sno = data[index][DBHelper.columnSNO];

                                      final controller = TextEditingController(text: todo.toString());

                                      return  d == 0 ? Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 12),
                                        child: TaskCard(
                                          todoText: todo,
                                          onIconTap: (){ prov.updateCheckP(snoP: sno, isDoneP: dd == 0 ? true : false);},
                                          indx: index,
                                          delFunc: (){
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context){
                                                return
                                                  ConfirmDelAlertbox(indx: index, sno: sno,);
                                              }
                                          );
                                            },

                                          tapTextFunc: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context){
                                                  return
                                                    EditTaskAlertbox(
                                                      changeToSomedayF: (){prov.updateDayP(snoP: sno, isTodayP: false);},
                                                      changeToTodayF: (){prov.updateDayP(snoP: sno, isTodayP: true);},
                                                      controller: controller,
                                                      snoUp: sno,
                                                    );
                                                }
                                            );
                                            // prov.deleteGoalP(sno);
                                          },
                                        ),
                                      ) : SizedBox.shrink() ;

                                    }
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            );
        },
      );


  }
}
