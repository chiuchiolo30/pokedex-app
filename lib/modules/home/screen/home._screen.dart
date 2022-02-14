import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/modules/home/models/models.dart';

import 'package:pokedex/shared/extensions/string_extension.dart';

import '../bloc/pokemon_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonBloc>(context).add(LoadPokemons());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _getMoreData();
        log('cargar más pokemons');
        BlocProvider.of<PokemonBloc>(context).add( const LoadMorePokemons());

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          log('test ${state.pokemons}');
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(              
              child: state.pokemons.isNotEmpty 
              ? GridView.count(
                controller: _scrollController,
                crossAxisCount: 2,
                children: List.generate(state.pokemons.length, (index) => _CustomCard(index, state.pokemons)),
              )
              :  const Center(child: CircularProgressIndicator.adaptive()),
            ),
          );
        },
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final int i;
  final List<Result> pokemons;
  const _CustomCard(this.i, this.pokemons) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_Image(i: i), _Information(pokemons[i])],
      ),
    );
  }
}

class _Information extends StatelessWidget {

  final Result pokemon;

  const _Information(this.pokemon) : super();

  @override
  Widget build(BuildContext context) {

    final id = pokemon.url!.split('/')[6].padLeft(4, '0');
    final name = pokemon.name!;
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, bottom: 0.0, top: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('N.°$id',
                style: const TextStyle(
                    color: Color(0xff919191), fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 4.0,
            ),
            Text(name.capitalize(), style: const TextStyle( fontWeight: FontWeight.w600),),
            // const SizedBox(
            //   height: 4.0,
            // ),
            // Row(
            //   children: [
            //     DecoratedBox(
            //         decoration: BoxDecoration(
            //             color: const Color(0xff9bcc50),
            //             borderRadius: BorderRadius.circular(4.0)),
            //         child: const Padding(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            //           child: Text('Planta'),
            //         )),
            //     const SizedBox(width: 4.0),
            //     DecoratedBox(
            //         decoration: BoxDecoration(
            //             color: const Color(0xffb97fc9),
            //             borderRadius: BorderRadius.circular(4.0)),
            //         child: const Padding(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            //           child: Text(
            //             'Veneno',
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         )),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        color: const Color(0xfff2f2f2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/img/loading.gif'),
              placeholderErrorBuilder: (_, __, ___) =>
                  const CircularProgressIndicator.adaptive(),
              image: NetworkImage(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'),
              imageErrorBuilder: (_, __, ___) => const _NoPicture(),
            )
          ],
        ),
      ),
    );
  }
}

class _NoPicture extends StatelessWidget {
  const _NoPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: const [
        Icon(Icons.no_photography, size: 80.0, color: Color(0xffB1B1B1)),
        Text('NO CONNECTION',
            style: TextStyle(fontSize: 10.0, letterSpacing: 1.0))
      ],
    ));
  }
}
