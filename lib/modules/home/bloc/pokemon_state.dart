part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
  
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}
