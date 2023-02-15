import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/componants.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({super.key});

  var searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextField(
                      controller: searchCon,
                      type: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                      label: 'Search',
                      preIcon: Icons.search,
                      onChange: (value) {
                        cubit.getSearch(value);
                      }),
                ),
                Expanded(child: articleBuilder(cubit.search, context)),
              ],
            ),
          );
        });
  }
}
