class Result {
    Result({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

}