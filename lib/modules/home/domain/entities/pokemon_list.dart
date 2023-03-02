import 'package:pokedex/modules/home/domain/entities/pokemon.dart';

class PokemonList {
  final int? count;
  final String? next;
  final String? previous;
  final List<Pokemon>? pokemon;

  PokemonList({
    this.count,
    this.next,
    this.previous,
    this.pokemon,
  });
}