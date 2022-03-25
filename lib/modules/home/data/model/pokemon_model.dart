import 'package:pokedex/modules/home/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  

  PokemonModel({
    required String name,
    required String url,
  }) : super(
    name: name,
    url: url,
  );

  factory PokemonModel.fromJson(Map<String, dynamic> json) 
    => PokemonModel(
        name: json['name'],
        url: json['url']
    );
}