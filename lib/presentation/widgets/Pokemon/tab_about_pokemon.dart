import 'package:flutter/material.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';

class TabAboutPokemonScreen extends StatelessWidget {
  final PokemonInfo pokemon;
  const TabAboutPokemonScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Column(children: [
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
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 50,
        ),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
