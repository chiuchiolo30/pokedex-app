import 'package:pokedex/modules/home/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon_list.dart';
import 'package:pokedex/modules/home/domain/repositories/get_all_pokemon_repository.dart';

class GetAllPokemonRepositoryImpl extends GetAllPokemonRepository {
  final PokemonRemoteDataSourceImpl remoteDataSource;

  GetAllPokemonRepositoryImpl( this.remoteDataSource );

  @override
  Future<PokemonList> getAll() async {
    
    final result = await remoteDataSource.getAll();
    return result;
  }
}