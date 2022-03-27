import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/modules/home/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex/modules/home/presentation/screen/home_screen.dart';

import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => (sl<PokemonBloc>() ) ),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      // home: PokemonScreen(title: 'Pokemón'),
      home: HomeScreen(title: 'Home'),
      routes: {},
    );
  }
}
