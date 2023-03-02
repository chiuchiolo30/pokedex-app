import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/shared/extensions/string_extension.dart';
import 'package:pokedex/modules/home/domain/entities/pokemon.dart';
import 'package:pokedex/modules/home/presentation/bloc/pokemon_bloc.dart';


class HomeScreen extends StatefulWidget {
  
  final String title;

  const HomeScreen({Key? key, required this.title }) : super(key: key);

  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final  _scrollController = ScrollController();
   final dataKey =  GlobalKey();
  late bool upScroll = false;

   @override
  void initState() {
    super.initState();

    context.read<PokemonBloc>().add(LoadPokemon());

    _scrollController.addListener(() {

      log('pixels: ${_scrollController.position.pixels.toString()}' );
      log('minScroll ${_scrollController.position.minScrollExtent.toString()}');

      if (_scrollController.position.pixels > _scrollController.position.minScrollExtent) {
        setState(() => upScroll = true);
      } else {
        setState(() => upScroll = false);
      }

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PokemonBloc>().add(LoadMorePokemon());
      }
    });
  }
  void _animateToIndex() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    setState(() => upScroll = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: Text(widget.title),
      ),
      floatingActionButton: upScroll ? _UpButton(_animateToIndex) : null,
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.symmetric( vertical:8.0),
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

class _UpButton extends StatelessWidget {

  final Function _callback;
  const _UpButton(this._callback) : super();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _callback(),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(Icons.arrow_upward, size: 28,),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.blue,
          width: 2.0,
        ),
        shape: const CircleBorder(),
        backgroundColor: Colors.transparent,
        
      
      ),
      );
  }
}

class _CustomCard extends StatelessWidget {
  final int index;
  final List<Pokemon> pokemons;

  const _CustomCard(this.index, this.pokemons);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_Image(i: index), _Information(pokemons[index])],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  final Pokemon pokemon;

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
          children: <Widget>[
            Text('N.°$id', style: const TextStyle(color: Color(0xff919191), fontWeight: FontWeight.w600)),
            const SizedBox(height: 4.0),
            Text(name.capitalize(), style: const TextStyle( fontWeight: FontWeight.w600),),
          ],
        ),
      )
      );
    
  }
}

class _Image extends StatelessWidget {
  final int i;

  const _Image({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        color: const Color(0xfff2f2f2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
      )
    );
  }
}

class _NoPicture extends StatelessWidget {
  const _NoPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const <Widget>[
          Icon(Icons.no_photography, size: 80.0, color: Color(0xffB1B1B1)),
        Text('NO CONNECTION',
            style: TextStyle(fontSize: 10.0, letterSpacing: 1.0))
        ],
      ),
    );
  }
}
  

  

  
