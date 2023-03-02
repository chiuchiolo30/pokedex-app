import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon.dart';

import 'package:pokedex/modules/home/domain/usecases/get_all_pokemon.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  
  final GetAllPokemon getAllPokemon;

  PokemonBloc({ required GetAllPokemon pokemons }) : getAllPokemon = pokemons, super( const PokemonInitial(pokemons: []) ) {

    on<LoadPokemon>((event, emit) async { 
        final res = await getAllPokemon();
        emit( state.copyWith( pokemons: res.pokemon, total: res.count ) );
    });

    on<LoadMorePokemon>((event, emit) async { 
        final res = await getAllPokemon( offset: state.pokemons.length );
        emit( state.copyWith( pokemons: [...state.pokemons,...res.pokemon!] ) );
    });

  }
}
