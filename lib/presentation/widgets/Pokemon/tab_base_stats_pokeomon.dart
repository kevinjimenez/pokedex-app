import 'package:flutter/material.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';

class TabBaseStatsPokemonScreen extends StatelessWidget {
  final PokemonInfo pokemon;
  const TabBaseStatsPokemonScreen({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemCount: pokemon.stats.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              pokemon.stats[index].stat.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Row(
              children: [
                Text('${pokemon.stats[index].baseStat}'),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: LinearProgressIndicator(
                      value: pokemon.stats[index].baseStat / 100),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
