class DoctorModel {
  DoctorModel({
    required this.email,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.specialization,
    required this.rating,
  });

  DoctorModel.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String,
          name: json['name']! as String,
          surname: json['surname']! as String,
          patronymic: json['patronymic']! as String,
          specialization: json['specialization']! as String,
          rating: json['rating']! as num,
        );

  final String email;
  final String name;
  final String surname;
  final String patronymic;
  final String specialization;
  final num rating;

  Map<String, Object> toJson() {
    return {
      'email': email,
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'specialization': specialization,
      'rating': rating,
    };
  }
}
