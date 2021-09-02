import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy1/cubit/news_cubit.dart';
import 'package:udemy1/cubit/news_state.dart';
import 'package:udemy1/networks/dio_helper.dart';

class NewLayout extends StatelessWidget {
  const NewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var _cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                )
              ],
            ),
            body: _cubit.screens[_cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _cubit.getBusiness();
              },
              child: Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _cubit.currentIndex,
              onTap: (index) => _cubit.changeBottomNanBar(index),
              items: _cubit.bottomItem,
            ),
          );
        },
      ),
    );
  }
}
