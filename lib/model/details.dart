class DetailsOn {
  int? id;
  String? name;
  String? posterpath;
  String? backdroppath;

  DetailsOn({this.id, this.name, this.posterpath, this.backdroppath});

  DetailsOn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterpath = json['poster_path'];
    backdroppath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterpath;
    data['backdrop_path'] = backdroppath;
    return data;
  }
}

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProductionCompany {
  int? id;
  String? logopath;
  String? name;
  String? origincountry;

  ProductionCompany({this.id, this.logopath, this.name, this.origincountry});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logopath = json['logo_path'];
    name = json['name'];
    origincountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['logo_path'] = logopath;
    data['name'] = name;
    data['origin_country'] = origincountry;
    return data;
  }
}

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({this.iso31661, this.name});

  ProductionCountry.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}


class Details {
  bool? adult;
  String? backdroppath;
  DetailsOn? belongstocollection;
  int? budget;
  List<Genre?>? genres;
  String? homepage;
  int? id;
  String? imdbid;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  List<ProductionCompany?>? productioncompanies;
  List<ProductionCountry?>? productioncountries;
  String? releasedate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage?>? spokenlanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteaverage;
  int? votecount;

  Details({this.adult, this.backdroppath, this.belongstocollection, this.budget, this.genres, this.homepage, this.id, this.imdbid, this.originallanguage, this.originaltitle, this.overview, this.popularity, this.posterpath, this.productioncompanies, this.productioncountries, this.releasedate, this.revenue, this.runtime, this.spokenlanguages, this.status, this.tagline, this.title, this.video, this.voteaverage, this.votecount});

  Details.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    belongstocollection = json['belongs_to_collection'] != null ? DetailsOn?.fromJson(json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres!.add(Genre.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbid = json['imdb_id'];
    originallanguage = json['original_language'];
    originaltitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterpath = json['poster_path'];
    if (json['production_companies'] != null) {
      productioncompanies = <ProductionCompany>[];
      json['production_companies'].forEach((v) {
        productioncompanies!.add(ProductionCompany.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productioncountries = <ProductionCountry>[];
      json['production_countries'].forEach((v) {
        productioncountries!.add(ProductionCountry.fromJson(v));
      });
    }
    releasedate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenlanguages = <SpokenLanguage>[];
      json['spoken_languages'].forEach((v) {
        spokenlanguages!.add(SpokenLanguage.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteaverage = json['vote_average'];
    votecount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdroppath;
    data['belongs_to_collection'] = belongstocollection!.toJson();
    data['budget'] = budget;
    data['genres'] =genres != null ? genres!.map((v) => v?.toJson()).toList() : null;
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbid;
    data['original_language'] = originallanguage;
    data['original_title'] = originaltitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterpath;
    data['production_companies'] = productioncompanies != null ? productioncompanies!.map((v) => v?.toJson()).toList() : null;
    data['production_countries'] =productioncountries != null ? productioncountries!.map((v) => v?.toJson()).toList() : null;
    data['release_date'] = releasedate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['spoken_languages'] =spokenlanguages != null ? spokenlanguages!.map((v) => v?.toJson()).toList() : null;
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteaverage;
    data['vote_count'] = votecount;
    return data;
  }

  Details.empty();
}


class SpokenLanguage {
  String? englishname;
  String? iso6391;
  String? name;

  SpokenLanguage({this.englishname, this.iso6391, this.name});

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    englishname = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['english_name'] = englishname;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    return data;
  }
}
