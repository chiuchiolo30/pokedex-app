part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class LoadPokemons extends PokemonEvent {}

class LoadMorePokemons extends PokemonEvent {

  const LoadMorePokemons();

}
