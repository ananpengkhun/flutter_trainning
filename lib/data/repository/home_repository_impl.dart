import 'package:flutter_trainning/core/result/app_result.dart';
import 'package:flutter_trainning/data/datasource/remote/datasources/home_datasources.dart';
import 'package:flutter_trainning/domain/entitie/home_entity.dart';
import 'package:flutter_trainning/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
  HomeDatasource homeDatasource;

  HomeRepositoryImpl({required this.homeDatasource});

  @override
  Future<AppResult<List<HomeEntity>>> getListPokemon(int offset) {
    return homeDatasource.getListPokemon(offset);
  }


}