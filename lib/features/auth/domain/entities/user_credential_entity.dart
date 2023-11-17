class UserCredentialEntity {
  String name;
  String email;
  String password;

  UserCredentialEntity({
    this.name = "",
    this.email = "",
    this.password = "",
  });

  UserCredentialEntity copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserCredentialEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
