import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? userId;
  final String email;
  final String name;
  final String avatarUrl;
  final List chats;

  User({
    required this.email,
    required this.name,
    required this.avatarUrl,
    this.userId,
    this.chats = const [],
  });

  // Creates a user from a Firestore DocumentSnapshot. Save id
  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    final newUser = User.fromJson(snapshot.data() as Map<String, dynamic>);
    newUser.userId = snapshot.reference.id;
    return newUser;
  }

  // Creates a user from Json
  factory User.fromJson(Map<String, dynamic> json) => _userFromJson(json);

  // Converts the User class into a map of key/value pairs
  Map<String, dynamic> toJson() => _userToJson(this);

  @override
  String toString() => 'Message<$name>';
}

// Turns a map of values from firestore into a USer class
User _userFromJson(Map<String, dynamic> json) {
  return User(
    userId: (json['userId'] as String),
    email: (json['email'] as String),
    name: (json['name'] as String),
    avatarUrl: (json['avatarUrl'] as String),
    chats: (json['chats'] as List),
  );
}

Map<String, dynamic> _userToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'chats': instance.chats,
    };
