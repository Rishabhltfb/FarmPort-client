import 'dart:convert';

class UserModel {
  String id;
  String email;
  String userType;
  UserModel({
    required this.id,
    required this.email,
    required this.userType,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? userType,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      userType: map['userType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(id: $id, email: $email, userType: $userType)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.userType == userType;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ userType.hashCode;
}
