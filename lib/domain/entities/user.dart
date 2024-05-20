class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          avatar == other.avatar;

  @override
  int get hashCode =>
      id.hashCode ^ email.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ avatar.hashCode;

  @override
  String toString() {
    return 'id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar';
  }
}