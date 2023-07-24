import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/helpers/capitalize_case.dart';
import 'package:pokedex/domian/entities/pokemon.dart';

class ItemPokemon extends StatelessWidget {
  final String no;
  final Pokemon pokemon;

  const ItemPokemon({Key? key, required this.pokemon, required this.no})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/pokemon/$no');
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              color: Colors.orange,
              child: Stack(
                children: [
                  //* foto pokemon
                  _PokemonImg(no: no),
                  //* no pokemon
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      '#$no',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  //* nombre pokemon
                  _PokemonName(pokemon: pokemon),
                ],
              ))),
    );
  }
}

class _PokemonName extends StatelessWidget {
  const _PokemonName({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Text(
      CapitalizeCase.titleCase(pokemon.name),
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}

class _PokemonImg extends StatelessWidget {
  const _PokemonImg({
    required this.no,
  });

  final String no;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Image.network(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$no.png',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          return child;
        },
      ),
    );
  }
}
