
import 'package:clean_todo/data/dbhelper.dart';
import 'package:flutter/material.dart';


class SelDayProv extends ChangeNotifier {
    int dayNum = 0;

    void changeToday () {
      dayNum = 0;
      notifyListeners();
    }

    void changeSomeday () {
      dayNum = 1;
      notifyListeners();
    }


}