class PokemonsResponse {
    final int count;
    final String next;
    final dynamic previous;
    final List<PokemonDb> results;

    PokemonsResponse({
        required this.count,
        required this.next,
        this.previous,
        required this.results,
    });

    factory PokemonsResponse.fromJson(Map<String, dynamic> json) => PokemonsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonDb>.from(json["results"].map((x) => PokemonDb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class PokemonDb {
    final String name;
    final String url;

    PokemonDb({
        required this.name,
        required this.url,
    });

    factory PokemonDb.fromJson(Map<String, dynamic> json) => PokemonDb(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
