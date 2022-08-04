class AnimalListDart {
  AnimalListDart(
      {this.imageName1,
      this.imageName2,
      this.imageName3,
      this.name,
      this.scientificName,
      this.familyName,
      this.kingdom,
      this.weight,
      this.height,
      this.lifeSpan,
      this.otherName,
      this.nbrOfSpieces,
      this.location,
      this.detail});

  final String imageName1;
  final String imageName2;
  final String imageName3;
  final String name;
  final String scientificName;
  final String familyName;
  final String kingdom;
  final String weight;
  final String height;
  final String lifeSpan;
  final String otherName;
  final String nbrOfSpieces;
  final String location;
  final String detail;

  factory AnimalListDart.fromJson(Map<String, dynamic> json) {
    return new AnimalListDart(
      imageName1: json['imageName1'] as String,
      imageName2: json['imageName2'] as String,
      imageName3: json['imageName3'] as String,
      name: json['name'] as String,
      scientificName: json['scientificName'] as String,
      familyName: json['familyName'] as String,
      kingdom: json['kingdom'] as String,
      weight: json['weight'] as String,
      height: json['height'] as String,
      lifeSpan: json['lifeSpan'] as String,
      otherName: json['otherName'] as String,
      nbrOfSpieces: json['nbrOfSpieces'] as String,
      location: json['location'] as String,
      detail: json['detail'] as String,
    );
  }
}
