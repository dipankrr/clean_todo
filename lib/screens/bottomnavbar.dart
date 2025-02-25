import 'package:clean_todo/providers/theme_prov.dart';
import 'package:clean_todo/screens/add_task_alertbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  final controller = TextEditingController();
   BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50, width: 50,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
            ),

            child: Icon(Icons.person_add_alt_1_rounded, size: 25,),
          ),

          GestureDetector(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return
                      AddTaskAlertbox(controller: controller);
                  }
              );
            },
            child: Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)
              ),

              child: Icon(Icons.add, size: 35,),
            ),
          ),

          Consumer<ThemeProv>(
            builder: (context, thProv, child) {
              return GestureDetector(
                onTap: (){
                  //thProv.num == 1 ? 2 : 1;
                  //thProv.num == 1 ? thProv.changeToDark() : thProv.changeToLight();
                  thProv.toggleTheme();
                },
                child: Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: thProv.num == 1 ? Icon(Icons.nights_stay, size: 25,) : Icon(Icons.light_mode, size: 25,),
                ),
              );
            },
          ),


        ],
      ),
    );
  }
}
