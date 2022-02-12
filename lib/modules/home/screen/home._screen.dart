import 'dart:developer';

import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:8.0),
        child: SizedBox(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(50, (index) => _CustomCard(index) ),
          ),
        
        ),
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final int i;
  const _CustomCard(this.i) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
               child: Column(
                 children: [
                  _Image(i: i),
                  const _Information()
                 ],
               ),
             );
  }
}

class _Information extends StatelessWidget {
  const _Information({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom:0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Text('N.°001', style: TextStyle(color: Color(0xff919191), fontWeight: FontWeight.w600 )),
             const SizedBox(height: 8.0,),
             const Text('Bulbasaur'),
             const SizedBox(height: 4.0,),
             Row(
               children:  [
                 DecoratedBox(
                   decoration: BoxDecoration(
                     color: const Color(0xff9bcc50),
                     borderRadius: BorderRadius.circular(4.0)
                   ),
                   child: const Padding(
                     padding: EdgeInsets.symmetric(vertical:2.0, horizontal: 16.0),
                     child: Text('Planta'),
                   )
                 ),
                 const SizedBox(width:4.0),
                 DecoratedBox(
                   decoration: BoxDecoration(
                     color: const Color(0xffb97fc9),
                     borderRadius: BorderRadius.circular(4.0)
                   ),
                   child: const Padding(
                     padding: EdgeInsets.symmetric(vertical:2.0, horizontal: 16.0),
                     child: Text('Veneno', style: TextStyle(color: Colors.white),),
                   )
                 ),
               ],
             )
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
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        color: const Color(0xfff2f2f2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           FadeInImage(
             placeholder: const  AssetImage('assets/img/loading.gif'),
             placeholderErrorBuilder:(_, __, ___) => const CircularProgressIndicator.adaptive(),
             image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'),
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
    return SizedBox(child: Column(
      children: const [
        Icon(Icons.no_photography, size:80.0, color: Color(0xffB1B1B1)),
        Text('NO CONNECTION', style: TextStyle( fontSize: 10.0, letterSpacing: 1.0) )
      ],
    ) );
  }
}