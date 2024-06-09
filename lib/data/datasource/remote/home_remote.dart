import 'package:dio/dio.dart';
import 'package:flutter_trainning/core/result/app_result.dart';
import 'package:flutter_trainning/data/datasource/remote/datasources/home_datasources.dart';
import 'package:flutter_trainning/data/model/home_model.dart';

import '../../response/home_response.dart';

class HomeRemote implements HomeDatasource{

  final Dio dio;

  HomeRemote({required this.dio});

  final String _getListPokemon = 'pokemon?limit=12';

  @override
  Future<AppResult<List<HomeModel>>> getListPokemon(int offset) async {
    try{
      Response dioResponse = await dio.get('$_getListPokemon&offset=$offset');
      HomeResponse response = HomeResponse.fromJson(dioResponse.data);
      List<HomeModel> dataModel = [];
      response.listData.forEach((element) {
        dataModel.add(HomeModel.fromResponse(element));
      });

      return Success(value: dataModel);
    }on DioException catch(e){
      return Error(dioException: e, errorObject: e.response?.data);
    }
  }
}