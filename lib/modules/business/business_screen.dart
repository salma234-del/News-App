import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/componants.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List articles = NewsCubit.get(context).business;
        return articleBuilder(articles , context);
      },
    );
  }
}
