class PokemonInfo {
  final List<Ability> abilities;
  final int baseExperience;
  final int height;
  final int id;
  final bool isDefault;
  final String name;
  final int order;
  final Species species;
  final Sprites sprites;
  final List<Type> types;
  final List<Stat> stats;
  final int weight;

  PokemonInfo({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.species,
    required this.sprites,
    required this.types,
    required this.stats,
    required this.weight,
  });
}

class Ability {
  final Species ability;
  final bool isHidden;
  final int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
}

class Sprites {
  final String backDefault;
  final String? backFemale;
  final String backShiny;
  final String? backShinyFemale;
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
}

class Type {
  final int slot;
  final Species type;

  Type({
    required this.slot,
    required this.type,
  });
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });
}

class Stat {
  final int baseStat;
  final int effort;
  final Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}
