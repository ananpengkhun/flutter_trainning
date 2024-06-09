

import 'package:flutter_trainning/data/response/item_response.dart';

class HomeResponse{
  late final bool lastPage;
  late final int offset, countPage;
  late final List<ItemResponse> listData;

  HomeResponse.fromJson(Map<String, dynamic> parsedJson, {int offsetParam = 0}){
    lastPage = parsedJson['results'].isEmpty ? true : false;
    offset = offsetParam;
    countPage = parsedJson['count'] ?? 0;

    listData = [];
    int countId = 1;
    for(Map<String, dynamic> item in parsedJson['results']){
      listData.add(ItemResponse(
          id: countId + offsetParam,
          name: item['name'],
          imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${countId + offsetParam}.png',
          url: item['url']
      ));

      countId++;
    }
  }
}

