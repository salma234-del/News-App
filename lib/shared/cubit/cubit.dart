import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool dark = true;
  void changeAppMode({fromCach}) {
    if (fromCach == null) {
      dark = !dark;
      CacheHelper.putData(key: 'dark', value: dark)
          .then((value) => emit(AppModeState()));
    } else {
      dark = fromCach;
      emit(AppModeState());
    }
  }
}
