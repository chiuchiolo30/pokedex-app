
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/home/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/modules/home/data/repositories/get_all_pokemon_impl.dart';
import 'package:pokedex/modules/home/domain/repositories/get_all_pokemon_repository.dart';
import 'package:pokedex/modules/home/domain/usecases/get_all_pokemon.dart';
import 'package:pokedex/modules/home/presentation/bloc/pokemon_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  
  //* Features - Home

  //? Bloc
    sl.registerFactory(() => PokemonBloc(pokemons: sl() ) );
    
  //? Use cases
    sl.registerLazySingleton(() => GetAllPokemon( sl() ));

  //? Repository
    sl.registerLazySingleton<GetAllPokemonRepository>(() => GetAllPokemonRepositoryImpl( sl() ));

  //? Data sources
    sl.registerLazySingleton<PokemonRemoteDataSource>(() => PokemonRemoteDataSourceImpl() );
  
  //? Core

  //? External

}