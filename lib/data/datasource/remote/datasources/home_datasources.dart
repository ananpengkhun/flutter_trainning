import 'package:flutter_trainning/core/result/app_result.dart';
import 'package:flutter_trainning/data/model/home_model.dart';


abstract class HomeDatasource{
  Future<AppResult<List<HomeModel>>> getListPokemon(int offset);
}