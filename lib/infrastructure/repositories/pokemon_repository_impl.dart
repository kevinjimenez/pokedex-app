import 'package:pokedex/domian/datasources/datasources.dart';
import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/domian/repositories/repositories.dart';

class PokemomRepositoryImpl extends PokemonsRespository {
  final PokemonsDatasource datasoure;

  PokemomRepositoryImpl(this.datasoure);

  @override
  Future<List<Pokemon>> getPokemons() {
    return datasoure.getPokemons();
  }
}
