import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy1/components/components.dart';
import 'package:udemy1/cubit/news_cubit.dart';
import 'package:udemy1/cubit/news_state.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var listCubit = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: NewsCubit.get(context).isDark
                        ? Colors.grey
                        : Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              Expanded(child: articleBuilder(context, listCubit))
            ],
          ),
        );
      },
    );
  }
}
