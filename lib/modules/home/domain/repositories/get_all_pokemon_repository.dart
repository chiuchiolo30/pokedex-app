import 'package:pokedex/modules/home/domain/entities/pokemon_list.dart';

abstract class GetAllPokemonRepository {
  
  Future<PokemonList> getAll({int offset = 0, int limit = 20});

}