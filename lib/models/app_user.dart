class AppUser {
  const AppUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.city,
    required this.phone,
    this.address = '',
  });

  final String firstName;
  final String lastName;
  final String email;
  final String city;
  final String phone;
  final String address;

  String get fullName => '$firstName $lastName'.trim();

  Map<String, String> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'city': city,
      'phone': phone,
      'address': address,
    };
  }

  factory AppUser.fromMap(Map<String, String> map) {
    return AppUser(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      city: map['city'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
    );
  }

  AppUser copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? city,
    String? phone,
    String? address,
  }) {
    return AppUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
