import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/infrastructure/datasources/pokemonsdb_datasource.dart';
import 'package:pokedex/infrastructure/repositories/pokemon_repository_impl.dart';

final pokemonInfoRepositoryProvider = Provider((ref) {
  return PokemomRepositoryImpl(PokemonsDbDatasource());
});