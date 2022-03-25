import 'package:pokedex/modules/home/domain/entities/pokemon.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon_list.dart';

abstract class GetAllPokemonRepository {
  
  Future<PokemonList> getAll();

}