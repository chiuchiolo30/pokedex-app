import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/api/dio.dart';
import 'package:pokedex/modules/home/models/models.dart';

class HomeRepository extends ApiDio {
  


  Future<PokemonList> getAllPokemon({  Map<String, dynamic> queryParameters = const {} }) async {
    
    final result  = await request('pokemon', queryParameters: queryParameters);

    if (result is Response && result.statusCode == 200) { 
      log('pokemons ${result.data}');
      return PokemonList.fromJson(result.data);
    }
      return PokemonList();
  }


}