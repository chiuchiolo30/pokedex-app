import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/modules/home/models/models.dart';
import 'package:pokedex/modules/home/resources/repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  final repository = HomeRepository();
  PokemonList? pokemonsRes;

  PokemonBloc() : super(const PokemonInitial( pokemons: [])) {
    
    on<LoadPokemons>((_, emit) async {
      final result = await _loadPokemons();
      emit(state.copyWith( pokemons: result.results, total: result.count ));
    });

    on<LoadMorePokemons>((event, emit) async {
      final result = await _loadPokemons(offset: state.pokemons.length);  
      emit(state.copyWith( pokemons: [... state.pokemons, ...result.results ] ));
    });
  
  }


  _loadPokemons({int offset = 0, int limit = 20}) async {
    pokemonsRes = await repository.getAllPokemon(queryParameters: {"offset": offset, "limit": limit});
    return pokemonsRes;

  }

}
