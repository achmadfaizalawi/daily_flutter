import 'package:flutter/material.dart';
import '../../pokemon_data/pokemon_data.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  
  final PokemonData pokemonData = PokemonData();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Pokedex",
          style: GoogleFonts.aclonica(fontSize: 25)),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.info_outline)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.search)),
          ],
        ),
        body: GridView.builder(         
          itemCount: pokemonData.dataImage.length,
          padding: const EdgeInsets.only(
            left: 16, 
            right: 16, 
            top: 20, 
            bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ), 
          itemBuilder: (context, index) {
            final item = pokemonData.textImage[index];
            return Container(
              margin: const EdgeInsets.all(2),
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                  onPressed: (){},
                  child: GridTile(
                    footer: Container(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Center(
                        child: Text(item,
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w600
                          )))),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        pokemonData.dataImage[index], 
                        scale: 8)),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: CircleAvatar(
          backgroundColor: Colors.green,
          maxRadius: 30,
          child: IconButton(
            iconSize: 35,
            splashColor: Colors.green,
            color: Colors.white,
            onPressed: (){} , 
            icon: const Icon(
              Icons.add,
            )),
        ),
    )
    );
  }
}