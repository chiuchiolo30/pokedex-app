import 'package:pokedex/modules/home/data/model/pokemon_model.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon_list.dart';

class PokemonListModel extends PokemonList {
  PokemonListModel({
    required List<Pokemon> pokemons,
    required int count,
    required String next,
    required String previous,
  }) : super(
    pokemon: pokemons,
    count: count,
    next: next,
    previous: previous,
  );

  factory PokemonListModel.fromJson(Map<String, dynamic> json) => PokemonListModel(
    pokemons: List<Pokemon>.from(json['results'].map((x) => PokemonModel.fromJson(x))),
    count: json['count'],
    next: json['next'],
    previous: json['previous'] ?? '',
  );
}