import 'package:pokedex/domian/datasources/pokemons_datasource.dart';
import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';
import 'package:pokedex/domian/repositories/pokemons_repository.dart';

class PokemomRepositoryImpl extends PokemonsRespository {
  final PokemonsDatasource datasoure;

  PokemomRepositoryImpl(this.datasoure);

  @override
  Future<List<Pokemon>> getPokemons() {
    return datasoure.getPokemons();
  }

  @override
  Future<PokemonInfo> getPokemonByNo(String no) {
    return datasoure.getPokemonByNo(no);
  }
}
