import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy1/components/components.dart';
import 'package:udemy1/cubit/news_cubit.dart';
import 'package:udemy1/cubit/news_state.dart';
import 'package:udemy1/screens/search_screen.dart';

class NewLayout extends StatelessWidget {
  const NewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var _cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                onPressed: () => navigateTo(
                  context,
                  SearchScreen(),
                ),
                icon: Icon(Icons.search),
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body: _cubit.screens[_cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _cubit.currentIndex,
            onTap: (index) => _cubit.changeBottomNanBar(index),
            items: _cubit.bottomItem,
          ),
        );
      },
    );
  }
}
