import 'package:flutter_trainning/core/result/app_result.dart';
import 'package:flutter_trainning/data/model/home_model.dart';
import 'package:flutter_trainning/domain/entitie/home_entity.dart';

abstract class HomeRepository{
  Future<AppResult<List<HomeEntity>>> getListPokemon(int offset);
}