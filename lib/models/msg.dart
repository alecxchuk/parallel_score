import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String receiverId;
  String? messageId;
  final String message;
  final String urlAvatar;
  final DateTime date;
  final List users;
  final bool isMessageRead;

  Message(
      {required this.users,
      required this.senderId,
      required this.receiverId,
      this.messageId,
      required this.message,
      required this.urlAvatar,
      required this.date,
      this.isMessageRead = false});

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    final newMessage =
        Message.fromJson(snapshot.data() as Map<String, dynamic>);
    newMessage.messageId = snapshot.reference.id;
    return newMessage;
  }

  factory Message.fromJson(Map<String, dynamic> json) => _messageFromJson(json);

  // Converts the Message class into a map of key/value pairs
  Map<String, dynamic> toJson() => _messageToJson(this);

  @override
  String toString() => 'Message<$message>';
}

// Turns a map of values from firestore into a Message class
Message _messageFromJson(Map<String, dynamic> json) {
  return Message(
    senderId: (json['senderId'] ?? '' as String),
    receiverId: (json['receiverId'] ?? '' as String),
    urlAvatar: (json['urlAvatar'] ?? '' as String),
    message: (json['message'] ?? '' as String),
    date: (json['date'] as Timestamp).toDate(),
    isMessageRead: json['isMessageRead'] ?? false as bool,
    users: json['users'] ?? [] as List,
  );
}

Map<String, dynamic> _messageToJson(Message instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'urlAvatar': instance.urlAvatar,
      'message': instance.message,
      'date': instance.date,
      'isMessageRead': instance.isMessageRead,
      'users': instance.users,
    };
