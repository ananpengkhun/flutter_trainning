

import 'package:flutter_trainning/data/response/item_response.dart';
import 'package:flutter_trainning/domain/entitie/home_entity.dart';

class HomeModel extends HomeEntity{
  HomeModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.url
  });

  factory HomeModel.fromResponse(ItemResponse itemResponse) => HomeModel(
      id: itemResponse.id ?? -1,
      name: itemResponse.name ?? "",
      imageUrl: itemResponse.imageUrl ?? "",
      url: itemResponse.url ?? ""
  );
}