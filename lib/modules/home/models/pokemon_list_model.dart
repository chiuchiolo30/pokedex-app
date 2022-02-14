import 'package:pokedex/modules/home/models/result_model.dart';

class PokemonList {
    PokemonList({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    int?          count;
    String?       next;
    String?       previous;
    List<Result>? results;

    factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );
}