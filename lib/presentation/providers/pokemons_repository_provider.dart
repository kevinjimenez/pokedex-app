import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/infrastructure/datasources/datasources.dart';
import 'package:pokedex/infrastructure/repositories/pokemon_repository_impl.dart';

final pokemonsRepositoryProvider = Provider((ref) {
  return PokemomRepositoryImpl(PokemonsDbDatasource());
});