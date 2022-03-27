
import 'package:pokedex/modules/home/domain/entities/pokemon_list.dart';
import 'package:pokedex/modules/home/domain/repositories/get_all_pokemon_repository.dart';

class GetAllPokemon {
  
  final GetAllPokemonRepository _getAllPokemonRepository;

  GetAllPokemon(this._getAllPokemonRepository);

  Future<PokemonList> call({ int offset = 0, int limit = 20}) async {
    return await _getAllPokemonRepository.getAll(offset:offset, limit:limit);
  }
}
  
