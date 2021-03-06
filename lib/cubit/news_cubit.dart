import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy1/cache/cache_helper.dart';

import 'package:udemy1/cubit/news_state.dart';
import 'package:udemy1/networks/dio_helper.dart';
import 'package:udemy1/screens/business_screen.dart';
import 'package:udemy1/screens/science_screen.dart';
import 'package:udemy1/screens/sports_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNanBar(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      business = value.data['articles'];
      print('${business[0]['title']}');
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print('${error.toString()}');
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      sports = value.data['articles'];
      print('${sports[0]['title']}');
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print('${error.toString()}');
      emit(NewsGetSportsErrorState(error));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      science = value.data['articles'];
      print('${science[0]['title']}');
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print('${error.toString()}');
      emit(NewsGetScienceErrorState(error));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      search = value.data['articles'];
      print('${search[0]['title']}');
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print('${error.toString()}');
      emit(NewsGetSearchErrorState(error));
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      print('${isDark.toString()}');
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        print('${isDark.toString()}');
        print('${fromShared.toString()}');
        emit(AppChangeModeState());
      });
    }
  }
}
