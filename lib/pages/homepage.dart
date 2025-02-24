import 'package:clean_todo/screens/SomedayTasks.dart';
import 'package:clean_todo/screens/bottomnavbar.dart';
import 'package:flutter/material.dart';

import '../screens/TodayTasks.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white54,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 8),
          child: Column(
           children: [
             TodayTasks(dayTitle: 'today',),

             SizedBox(height: 20,),

             SomedayTasks(dayTitle: 'someday'),
             BottomNavbar()

           ]),
        ),
      ),
    );
  }
}
