class Movie {
  String? name;
  int? age;

  Movie({
    this.name,
    this.age,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }
}
