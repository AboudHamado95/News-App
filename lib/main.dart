import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy1/cubit/bloc_observe.dart';
import 'package:udemy1/networks/dio_helper.dart';
import 'package:udemy1/new_layouts.dart';

main(List<String> args) {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
      ),
    ),
    home: Directionality(textDirection: TextDirection.rtl, child: NewLayout()),
  ));
}
