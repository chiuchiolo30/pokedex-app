part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  // const PokemonState();

  final List<Pokemon> pokemons;
  final int? total;

  const PokemonState({ required this.pokemons, this.total });
  
  @override
  List<Object> get props => [ pokemons ];

  PokemonState copyWith({ List<Pokemon>? pokemons, int? total }) 
    => PokemonState(
        pokemons: pokemons ?? this.pokemons,
        total: total ?? this.total,
    );

}

class PokemonInitial extends PokemonState {
  
  const PokemonInitial({ required List<Pokemon> pokemons }) : super( pokemons: pokemons );

}
