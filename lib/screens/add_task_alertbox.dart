import 'package:clean_todo/providers/db_provider.dart';
import 'package:clean_todo/providers/sel_day_prov.dart';
import 'package:clean_todo/providers/theme_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/textf_decoration.dart';

class AddTaskAlertbox extends StatelessWidget {
  final TextEditingController controller;

  const AddTaskAlertbox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
   return Consumer<ThemeProv>(
     builder: (context, thProv, child) {
       return  Consumer<DBProvider>(
         builder: (context, prov, child) {
           return  AlertDialog(
             // backgroundColor: Colors.black54,

              title: TextField(
                controller: controller,
                decoration: customTextFieldDecoration(
                    hintText: "write task ✎",
                    bColor: thProv.textFldBckClr
                ),
                maxLines: 2,
                 cursorColor: Colors.white60,
               ),

               content: Consumer<SelDayProv>(
                 builder: (context, dProv, child) {
                   return
                     Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Row(
                           children: [
                             Expanded(
                               child: GestureDetector(
                                 onTap: (){
                                   dProv.changeToday();
                                 } ,
                                 child: Container(
                                   height: 30,
                                   decoration: BoxDecoration(
                                       color: Colors.black38,
                                       borderRadius: BorderRadius.circular(10),
                                       border: Border.all(color: dProv.dayNum == 0 ? thProv.dayOrSmDayClr : Colors.transparent, width: 1.5 )
                                   ),
                                   child: Center(child: Text('today', style: TextStyle(color: Colors.white, fontSize: 15))),
                                 ),
                               ),
                             ), SizedBox( width: 10,),
                             Expanded(
                               child: GestureDetector(
                                 onTap: (){
                                   dProv.changeSomeday();

                                 } ,
                                 child: Container(
                                   height: 30,
                                   decoration: BoxDecoration(
                                       color: Colors.black38,
                                       borderRadius: BorderRadius.circular(10),
                                       border: Border.all(color: dProv.dayNum == 1 ? thProv.dayOrSmDayClr : Colors.transparent, width: 1.5 )
                                   ),
                                   child: Center(child: Text('someday', style: TextStyle(color: Colors.white, fontSize: 15))),
                                 ),
                               ),
                             ),
                           ],
                         ),

                         SizedBox(height: 10,),

                         SizedBox(
                           width: double.infinity,
                           child: TextButton(
                             onPressed: () {
                               String todo = controller.text;
                               if (todo.isNotEmpty) {
                                 prov.addToDoP(todoP: todo.toString(), isTodayP: dProv.dayNum == 0 ? true : false);
                                 Navigator.pop(context);
                                 controller.clear();
                               }
                             },
                             style: TextButton.styleFrom(backgroundColor: Colors.black38),
                             child: const Text('Create Task', style: TextStyle(color: Colors.white, fontSize: 20),),
                           ),
                         ),
                       ],
                     );
                 },
               )

           );
         },
       ) ;
     },
   );
  }
}
