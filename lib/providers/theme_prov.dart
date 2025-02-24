import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ThemeProv extends ChangeNotifier {
  int num = 1;

  Color backgClr = Colors.black;
  Color textClr = Colors.white;
  Color taskCardClr = Colors.black;
  Color mainCardClr = Colors.white.withOpacity(0.08);
  Color doneIconClr = Colors.black;
  Color textFldBckClr = Colors.black;
  Color dayOrSmDayClr = Colors.white54;
  Color ff = Colors.white54;


  void toggleTheme () {
    num = num == 1 ? 2 : 1;

    backgClr = num == 1 ? Colors.black : Colors.grey;
    taskCardClr = num == 1 ? Colors.black : Colors.grey.shade600;
    mainCardClr = num == 1 ? Colors.white.withOpacity(0.1 ) : Colors.white.withOpacity(0.2);
    textFldBckClr = num == 1 ? Colors.black : Colors.white;
    dayOrSmDayClr = num == 1 ? Colors.white54 : Colors.black;






    // Update system UI colors dynamically
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgClr, // Match status bar with theme background
      statusBarIconBrightness: num == 1 ? Brightness.light : Brightness.dark, // Change icon color
      systemNavigationBarColor: backgClr, // Match navigation bar with theme
      systemNavigationBarIconBrightness: num == 1 ? Brightness.light : Brightness.dark, // Navigation icons
    ));

    notifyListeners();
  }


}