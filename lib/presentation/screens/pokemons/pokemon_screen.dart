import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/config/helpers/capitalize_case.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';
import 'package:pokedex/presentation/providers/pokemon_info_provider.dart';
import 'package:pokedex/presentation/widgets/widgets.dart';

class PokemonScreen extends ConsumerStatefulWidget {
  static String name = 'pokemon_creen';
  final String no;
  const PokemonScreen({Key? key, required this.no}) : super(key: key);

  @override
  PokemonScreenState createState() => PokemonScreenState();
}

class PokemonScreenState extends ConsumerState<PokemonScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(getPokemonInfoProvider.notifier).loadPokemonInfo(widget.no);
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = ref.watch(getPokemonInfoProvider)[widget.no];

    if (pokemon == null) {
      return const Scaffold(
          body: Center(
              child: CircularProgressIndicator(
        strokeWidth: 2,
      )));
    }

    return DefaultTabController(
        length: 2,
        child: SafeArea(
          top: false,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.orange,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: Stack(children: [
              Container(
                color: Colors.orange,
              ),
              Column(
                children: [
                  _PokemonView(pokemon: pokemon),
                  //* tabs
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Container(
                      color: Colors.white,
                      child: const TabBar(
                          padding: EdgeInsets.only(top: 20),
                          tabs: [
                            Tab(
                              child: Text('About'),
                            ),
                            Tab(
                              child: Text('Base Stats'),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TabBarView(children: [
                        TabAboutPokemonScreen(pokemon: pokemon),
                        TabBaseStatsPokemonScreen(pokemon: pokemon)
                      ]),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}

class _PokemonView extends StatelessWidget {
  final PokemonInfo pokemon;

  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CapitalizeCase.titleCase(pokemon.name),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  _PokemonTypes(pokemon: pokemon)
                ],
              ),
              Text('#${pokemon.order}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white))
            ],
          ),
        ),
        //* imagen
        Center(
          child: Image.network(
            pokemon.sprites.frontDefault,
            width: 160,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}

class _PokemonTypes extends StatelessWidget {
  const _PokemonTypes({
    required this.pokemon,
  });

  final PokemonInfo pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: pokemon.types
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Chip(
                      visualDensity: VisualDensity.compact,
                      backgroundColor: const Color.fromARGB(255, 249, 183, 91),
                      label: Text(
                        e.type.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ))
            .toList());
  }
}
