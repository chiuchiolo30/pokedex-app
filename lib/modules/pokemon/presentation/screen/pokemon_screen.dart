import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  
  final String title;

  const PokemonScreen({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(
        children:  [
          
         Container(
           height: MediaQuery.of(context).size.height * 0.45,
           color: Colors.transparent,
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Expanded(
                 child: FadeInImage(
                  //  alignment: Alignment.topCenter, 
                      fit: BoxFit.cover,
                      // height: 500,
                      // width: 500,
                      // placeholderFit: BoxFit.cover,
                      placeholder: const AssetImage('assets/img/loading.gif'),
                      placeholderErrorBuilder: (_, __, ___) =>
                          const CircularProgressIndicator.adaptive(),
                      image:const NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png'),
                      imageErrorBuilder: (_, __, ___) => const _NoPicture(),
                    ),
               ),
             ],
           ),
         ),
          Padding(
            padding:  EdgeInsets.only( top:MediaQuery.of(context).size.height *0.32),
            child: Card(
              shadowColor: Colors.grey,
              elevation: 8.0,
              margin: const EdgeInsets.all(16),
              shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide( width: 0)
            ),
                  
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
            
              child: Container(
                height: MediaQuery.of(context).size.height *0.4,              
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    alignment: Alignment.center,
                                    decoration:  BoxDecoration(
                                      gradient: const  LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        stops: [
                                          0.1,
                                          0.4,
                                          0.6,
                                          0.9,
                                        ],
                                        colors: [
                                          // Colors.yellow,
                                          // Colors.red,
                                          // Colors.indigo,
                                          // Colors.teal,
                                          Color(0xffbfff00),
                                          Color(0xff80ff00),
                                          Color(0xff40ff00),
                                          Color(0xff00ff00),
                          
                                        ],
                                      ),
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(width: 4, color: const Color(0xff969696) ),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurStyle: BlurStyle.normal,
                                          color: Color(0xff9bcc50),
                                          blurRadius: 8.0,
                                          spreadRadius: 2.0,
                                          // offset:  Offset(
                                          //    5.0, // Move to right 10  horizontally
                                          //    5.0, // Move to bottom 10 Vertically
                                          //  ),
                                        )
                                      ]
                                    ),
                                    child: FadeInImage(
                                      fit: BoxFit.cover,
                                      placeholderFit: BoxFit.cover,
                                      height: 180.0,
                                      placeholder: const AssetImage('assets/img/loading.gif'),
                                      placeholderErrorBuilder: (_, __, ___) =>
                                          const CircularProgressIndicator.adaptive(),
                                      image:const NetworkImage(
                                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png',
                                      ),
                                      imageErrorBuilder: (_, __, ___) => const _NoPicture(),
                                    ),
                                  ),
                                  // const SizedBox(height: 18.0,),
                                  // Row(
                                  //   children: const  [
                                  //     DecoratedBox(
                                  //       decoration: BoxDecoration(
                                  //         color: Color(0xff9bcc50),
                                  //         borderRadius: BorderRadius.all(Radius.circular(4.0))
                                  //       ),
                                  //       child: Padding(
                                  //         padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                  //         child: Text('Planta', style: TextStyle( color: Colors.white),),
                                  //       )
                                  //     ),
                                  //     SizedBox(width: 4.0,),
                                  //     DecoratedBox(
                                  //       decoration: BoxDecoration(
                                  //         color: Color(0xffb97fc9),
                                  //         borderRadius: BorderRadius.all(Radius.circular(4.0))
                                  //       ),
                                  //       child: Padding(
                                  //         padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                  //         child: Text('Veneno', style: TextStyle( color: Colors.white),),
                                  //       )
                                  //     ),
                                      
                                      
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child:  ListTile(
                              title: Text('Bulbasaur N.°001', style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.w400)),
                              subtitle: Text('Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo.'),
                            
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Padding(
                          padding:  EdgeInsets.only(left: 20.0, bottom: 4.0),
                          child:  Text('Tipo', style: TextStyle(  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20.0, bottom: 10.0),
                          child: Row(
                                      children: const  [
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Color(0xff9bcc50),
                                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                            child: Text('Planta', style: TextStyle( color: Colors.white),),
                                          )
                                        ),
                                        SizedBox(width: 4.0,),
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Color(0xffb97fc9),
                                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                            child: Text('Veneno', style: TextStyle( color: Colors.white),),
                                          )
                                        ),
                                        
                                        
                                      ],
                                    ),
                        ),
                       const Padding(
                         padding:  EdgeInsets.only(left:20.0, bottom:4.0),
                         child:  Text('Debilidad', style: TextStyle(  fontWeight: FontWeight.w500)),
                       ),
                         Padding(
                           padding: const EdgeInsets.only(left:20.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                          children: const  [
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0xfffd7d24),
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                                child: Text('Fuego', style: TextStyle( color: Colors.white),),
                                              )
                                            ),
                                            SizedBox(width: 4.0,),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0xfff366b9),
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                                child: Text('Psíquico', style: TextStyle( color: Colors.white),),
                                              )
                                            ),
                                            SizedBox(width: 4.0,),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0xffbdb9b8),
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                                child: Text('Volador', style: TextStyle( color: Colors.white),),
                                              )
                                            ),
                                           
                                            
                                            
                                          ],
                                        ),
                                         const SizedBox(height: 4.0,),
                                       const  DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Color(0xff51c4e7),
                                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric( vertical:2.0, horizontal:20.0),
                                            child: Text('Hielo', style: TextStyle( color: Colors.white),),
                                          )
                                        ),
                             ],
                           ),
                         ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
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