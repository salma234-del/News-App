abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBarState extends NewsStates {}


class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final dynamic error;
  NewsGetBusinessErrorState(this.error);
}


class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final dynamic error;
  NewsGetSportsErrorState(this.error);
}


class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final dynamic error;
  NewsGetScienceErrorState(this.error);
}


class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final dynamic error;
  NewsGetSearchErrorState(this.error);
}
