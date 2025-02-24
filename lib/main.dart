import 'package:clean_todo/pages/homepage.dart';
import 'package:clean_todo/providers/db_provider.dart';
import 'package:clean_todo/providers/sel_day_prov.dart';
import 'package:clean_todo/providers/theme_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DBProvider()),
        ChangeNotifierProvider(create: (_) => SelDayProv()),
        ChangeNotifierProvider(create: (_) => ThemeProv()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProv>(
      builder: (context, thProv, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: thProv.backgClr,
            //appBarTheme: AppBarTheme(backgroundColor:  Constants.backgColor),
            fontFamily: 'Diagramm',
            brightness: thProv.num == 1 ?Brightness.dark : Brightness.light,
            useMaterial3: true,
          ),
          home: const Homepage(),
        );
      },
    );
  }
}


// Consumer<Provider>(
// builder: (context, prov, child) {
// return ;
// },
// )