import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';
import 'package:pokedex/presentation/providers/pokemon_info_provider.dart';

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
        length: 4,
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
                            Tab(
                              child: Text('Evolution'),
                            ),
                            Tab(
                              child: Text('Moves'),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            child: Column(children: [
                              Row(
                                children: [
                                  const Text(
                                    'Height',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Text('${pokemon.height} cm',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        const Icon(Icons.directions_transit),
                        const Icon(Icons.directions_bike),
                        const Icon(Icons.directions_bike),
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
                    pokemon.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Row(
                      children: pokemon.types
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Chip(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    label: Text(e.type.name),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ))
                          .toList())
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
