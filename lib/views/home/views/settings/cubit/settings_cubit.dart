import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:materialyou/views/home/views/home/cubit/home_cubit.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsInitial());

  Set temp = {};

  searchData(String text) {
    debugPrint("GLOBAL LENGTH ${HomeCubit.globalData.length}");
    temp.clear();
    emit(SettingsInitial());
    for (var i = 0; i < HomeCubit.globalData.length; i++) {
      if (text.isEmpty) {
        temp.clear();
        emit(SettingsInitial());
      } else if (HomeCubit.globalData[i]['attributes']['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        temp.add(HomeCubit.globalData[i]['attributes']);
        debugPrint('LENGTH ${temp.length.toString()}');
        emit(SettingsInitial());
      }
    }
  }
}
