import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';
import 'package:pokedex/presentation/providers/pokemons_repository_provider.dart';

final getPokemonInfoProvider =
    StateNotifierProvider<PokemonInfoNotifier, Map<String, PokemonInfo>>((ref) {
  final fetchPokemonInfo = ref.watch(pokemonsRepositoryProvider).getPokemonByNo;
  return PokemonInfoNotifier(fetchPokemomInfo: fetchPokemonInfo);
});

typedef PokemonInfoCallback = Future<PokemonInfo> Function(String no);

class PokemonInfoNotifier extends StateNotifier<Map<String, PokemonInfo>> {
  PokemonInfoCallback fetchPokemomInfo;

  PokemonInfoNotifier({required this.fetchPokemomInfo}) : super({});

  Future<void> loadPokemonInfo(String no) async {
    final pokemon = await fetchPokemomInfo(no);
    state = {...state, no: pokemon};
  }
}
