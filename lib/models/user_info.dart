class User {
  final String imagePath;
  final String firstname;
  final String lastname;
  final String email;
  final String about;
  final String phone;
  final bool isDarkModeEnabled;

  const User({
    required this.imagePath,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.about,
    required this.phone,
    this.isDarkModeEnabled = false,
  });

  User copy({
    String? imagePath,
    String? firstname,
    String? lastname,
    String? email,
    String? about,
    String? phone,
    bool? isDarkModeEnabled,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        about: about ?? this.about,
        phone: phone ?? this.phone,
        isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    email: json['email'],
    about: json['about'],
    phone: json['phone'],
    isDarkModeEnabled: json['isDarkModeEnabled'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'firstname': firstname,
    'lastname': lastname,
    'email': email,
    'about': about,
    'phone': phone,
    'isDarkModeEnabled': isDarkModeEnabled,
  };
}
