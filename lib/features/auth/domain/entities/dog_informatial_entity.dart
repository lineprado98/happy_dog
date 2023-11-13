class DogInformatial {
  String name;
  int age;
  String breed;
  String gender;
  String size;
  DateTime? birthday;
  List<String>? temperament;
  List<String>? interests;

  DogInformatial({
    this.name = "",
    this.age = 0,
    this.breed = "",
    this.gender = "",
    this.size = "",
    this.birthday,
    this.temperament,
    this.interests,
  });

  DogInformatial copyWith({
    String? name,
    int? age,
    String? breed,
    String? gender,
    String? size,
    DateTime? birthday,
    List<String>? temperament,
    List<String>? interests,
  }) {
    return DogInformatial(
      name: name ?? this.name,
      age: age ?? this.age,
      breed: breed ?? this.breed,
      gender: gender ?? this.gender,
      size: size ?? this.size,
      birthday: birthday ?? this.birthday,
      temperament: temperament ?? this.temperament,
      interests: interests ?? this.interests,
    );
  }
}
