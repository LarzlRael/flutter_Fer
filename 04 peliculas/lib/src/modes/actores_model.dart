class Cast {
  List<Actor> actores = [];

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJson(item);
      actores.add(actor);
    });
  }
}

class Actor {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.job,
  });

  Actor.fromJson(Map<String, dynamic> json) {
    this.adult = json['adult'];
    this.gender = json['gender'];
    this.id = json['id'];
    this.name = json['name'];
    this.originalName = json['original_name'];
    this.popularity = json['popularity'];
    this.profilePath = json['profile_path'];
    this.castId = json['cast_id'];
    this.character = json['character'];
    this.creditId = json['credit_id'];
    this.order = json['order'];
    this.job = json['job'];
  }

  String getPhoto() {
    if (profilePath == null) {
      return 'https://www.escapeauthority.com/wp-content/uploads/2116/11/No-image-found.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
// Generated by https://quicktype.io

class SingleActor {
  bool adult;

  String biography;
  String birthday;
  String deathday;
  int gender;
  dynamic homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  SingleActor({
    this.adult,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  SingleActor.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    this.adult = json['adult'];

    this.biography = json['biography'];
    this.birthday = json['birthday'];
    this.deathday = json['deathday'];
    this.gender = json['gender'];
    this.homepage = json['homepage'];
    this.id = json['id'];
    this.imdbId = json['imdb_id'];
    this.knownForDepartment = json['known_for_department'];
    this.name = json['name'];
    this.placeOfBirth = json['place_of_birth'];
    this.popularity = json['popularity'];
    this.profilePath = json['profile_path'];
  }

  String getPhoto() {
    if (profilePath == null) {
      return 'https://www.escapeauthority.com/wp-content/uploads/2116/11/No-image-found.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}

class ScreenArguments {
  final String idActor;
  final String actorName;

  ScreenArguments(this.idActor, this.actorName);
}
