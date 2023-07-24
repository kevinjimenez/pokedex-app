import 'package:flutter/material.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';

class TabAboutPokemonScreen extends StatelessWidget {
  final PokemonInfo pokemon;
  const TabAboutPokemonScreen({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          _PokemonDetails(label: 'Species', text: pokemon.species.name),
          const SizedBox(
            height: 10,
          ),
          _PokemonDetails(
              label: 'Base Experience', text: '${pokemon.baseExperience}'),
          const SizedBox(
            height: 10,
          ),
          _PokemonDetails(label: 'Height', text: '${pokemon.height} cm'),
          const SizedBox(
            height: 10,
          ),
          _PokemonDetails(label: 'Weight', text: '${pokemon.weight} kg'),
          const SizedBox(
            height: 10,
          ),
          _PokemonDetails(
              label: 'Abilities',
              text:
                  '${pokemon.abilities.map((e) => e.ability.name).toList().join(', ')} '),
        ]),
      ),
    );
  }
}

class _PokemonDetails extends StatelessWidget {
  final String label;
  final String text;

  const _PokemonDetails({
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.star_outlined, color: Colors.amber),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(text),
    );
  }
}
