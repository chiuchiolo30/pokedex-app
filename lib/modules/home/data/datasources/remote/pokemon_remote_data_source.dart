
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/core/api/dio.dart';
import 'package:pokedex/modules/home/data/model/pokemon_list_model.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon_list.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonList> getAll();
}

class PokemonRemoteDataSourceImpl extends ApiDio implements PokemonRemoteDataSource {
  

  

  @override
  Future<PokemonList> getAll({  Map<String, dynamic> queryParameters = const {} }) async {
    final result  = await request('pokemon', queryParameters: queryParameters);

    if (result is Response && result.statusCode == 200) { 
      log('pokemons ${result.data}');
      return PokemonListModel.fromJson(result.data);
    }
      return PokemonList();
  }
}