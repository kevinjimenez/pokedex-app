import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/infrastructure/models/models.dart';

class PokemonMapper {
  static Pokemon pokemonDbToEntity( PokemonDb pokemon ) => Pokemon(name: pokemon.name);
}