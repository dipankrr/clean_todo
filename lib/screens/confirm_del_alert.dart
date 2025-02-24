import 'package:clean_todo/components/task_card.dart';
import 'package:clean_todo/data/dbhelper.dart';
import 'package:clean_todo/providers/db_provider.dart';
import 'package:clean_todo/providers/sel_day_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/textf_decoration.dart';

class ConfirmDelAlertbox extends StatelessWidget {
  final int indx;
  final int sno;

  const ConfirmDelAlertbox({super.key, required this.indx, required this.sno });

  @override
  Widget build(BuildContext context) {
    return Consumer<DBProvider>(
      builder: (context, prov, child) {
        final data = prov.allToDoData;
        if (indx >= data.length || indx < 0) {
          return SizedBox.shrink(); // Return empty widget if index is invalid
        }
        final String todo = data[indx][DBHelper.COLUMN_TODO] ;
        return  AlertDialog(
          // backgroundColor: Colors.black54,

           title: Center(child: Text('do you want to delete this task?', style: TextStyle(fontSize: 20),)),

            content: Consumer<SelDayProv>(
              builder: (context, dProv, child) {
                return
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TaskCard(indx: indx, todoText: todo, onIconTap: (){}, delFunc: (){}),

                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              } ,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text('cancel', style: TextStyle(color: Colors.white, fontSize: 20))),
                              ),
                            ),
                          ), SizedBox( width: 10,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Close the dialog FIRST
                                Future.delayed(Duration(milliseconds: 600), () { // Delay to let UI rebuild
                                  prov.deleteGoalP(sno); // THEN delete the item
                                });
                              },

                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text('delete', style: TextStyle(color: Colors.red, fontSize: 20))),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  );
              },
            )

        );
      },
    );
  }
}
