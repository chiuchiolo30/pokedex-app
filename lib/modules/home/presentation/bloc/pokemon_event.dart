part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class LoadPokemon extends PokemonEvent {}
class LoadMorePokemon extends PokemonEvent {}
