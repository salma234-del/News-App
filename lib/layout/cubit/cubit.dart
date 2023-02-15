import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/layout/cubit/states.dart';
import '../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '0c767415499d42fba579bd81482ad3e8',
      },
    ).then((value) {
      business = value.data['articles'];
      debugPrint(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(NewsGetBusinessErrorState(e));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '0c767415499d42fba579bd81482ad3e8',
        },
      ).then((value) {
        sports = value.data['articles'];
        debugPrint(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((e) {
        debugPrint(e.toString());
        emit(NewsGetSportsErrorState(e));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '0c767415499d42fba579bd81482ad3e8',
        },
      ).then((value) {
        science = value.data['articles'];
        debugPrint(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((e) {
        debugPrint(e.toString());
        emit(NewsGetScienceErrorState(e));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '0c767415499d42fba579bd81482ad3e8',
      },
    ).then((value) {
      search = value.data['articles'];
      debugPrint(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(NewsGetSearchErrorState(e));
    });
  }
}
