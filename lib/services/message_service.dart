import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:parallel_score/models/msg.dart';

class DataRepository {
  // Create the controller that will broadcast the messages
  final StreamController<List<Message>> _messageController =
      StreamController<List<Message>>.broadcast();

  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('messages');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.orderBy("date", descending: false).snapshots();
  }

  Stream listenToMessagesRealTime() {
    // Register the handler for when the message data changes
    collection.snapshots().listen((messageSnapshot) {
      if (messageSnapshot.docs.isNotEmpty) {
        var messages = messageSnapshot.docs
            .map((snapshot) => Message.fromSnapshot(snapshot))
            .where((mappedItem) => mappedItem.message != null)
            .toList();
        // Add the message onto the controller
        _messageController.add(messages);
      }
    });

    // Return the stream underlying our _postsController.
    return _messageController.stream;
  }

  // 3
  /*Future<DocumentReference>*/ addMessage(Message message) async {
    try {
      await collection.add(message.toJson());
      return true;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  // 4
  void updateMessage(Message message) async {
    await collection.doc(message.messageId).update(message.toJson());
  }

  // 5
  void deleteMessage(Message message) async {
    await collection.doc(message.messageId).delete();
  }

  void getLastMessage(String id, String senderId) async {
    var ll = await collection
        .where('receiverId', isEqualTo: id)
        .where('senderId', isEqualTo: senderId)
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    print('$ll mmkm');
  }
}
