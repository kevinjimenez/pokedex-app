import 'package:pokedex/domian/entities/pokemon_info.dart';
import 'package:pokedex/infrastructure/models/pokemon_info_response.dart';

class PokemonInfoMapper {
  static PokemonInfo pokemonInfoToEntity(PokemonInfoResponse pokemon) =>
      PokemonInfo(
          baseExperience: pokemon.baseExperience,
          weight: pokemon.weight,
          height: pokemon.height,
          id: pokemon.id,
          isDefault: pokemon.isDefault,
          name: pokemon.name,
          order: pokemon.order,
          stats: pokemon.stats
              .map((e) => Stat(
                  baseStat: e.baseStat,
                  effort: e.effort,
                  stat: Species(name: e.stat.name, url: e.stat.url)))
              .toList(),
          species:
              Species(name: pokemon.species.name, url: pokemon.species.url),
          abilities: pokemon.abilities
              .map((e) => Ability(
                  ability: Species(name: e.ability.name, url: e.ability.url),
                  isHidden: e.isHidden,
                  slot: e.slot))
              .toList(),
          sprites: Sprites(
              backDefault: pokemon.sprites.backDefault,
              backFemale: pokemon.sprites.backFemale,
              backShinyFemale: pokemon.sprites.backShinyFemale,
              frontFemale: pokemon.sprites.frontFemale,
              frontShinyFemale: pokemon.sprites.frontShinyFemale,
              backShiny: pokemon.sprites.backShiny,
              frontDefault: pokemon.sprites.frontDefault,
              frontShiny: pokemon.sprites.frontShiny),
          types: pokemon.types
              .map((e) => Type(
                  slot: e.slot,
                  type: Species(name: e.type.name, url: e.type.url)))
              .toList());
}
