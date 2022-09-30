import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/core/constants/apiBase.dart';
import 'package:materialyou/views/home/views/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(const HomeInitialState());

  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();

  TextEditingController get name => _name;
  TextEditingController get id => _id;

  static List<dynamic> globalData = [];

  Future delateData(String id, context) async {
    try {
      Response res = await Dio().delete(
        '${ApiBase.instance.products}/$id',
      );
      if (res.statusCode == 200) {
        getData();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('data has been delated'),
          backgroundColor: CupertinoColors.systemRed,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future addData(
      {required context, required String name, required int id}) async {
    try {
      Response res = await Dio().post(ApiBase.instance.products, data: {
        "data": {"name": name, "product_id": id}
      });

      if (res.statusCode == 200) {
        getData();
        _name.clear();
        _id.clear();
        Navigator.pop(context);
        emit(HomeCompletedState(data: globalData));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('data has been added'),
          backgroundColor: CupertinoColors.systemGreen,
        ));
      }
    } catch (e) {
      debugPrint('ERROR $e');
    }
  }

  Future getData() async {
    try {
      Response res = await Dio().get(ApiBase.instance.products);
      if (res.statusCode == HttpStatus.ok) {
        globalData = res.data['data'];
        debugPrint(globalData.toString());
        emit(HomeCompletedState(data: globalData));
      } else {
        emit(const HomeErrorState());
      }
    } catch (e) {
      emit(const HomeErrorState());
      debugPrint(e.toString());
    }
  }
}
