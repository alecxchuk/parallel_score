import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:parallel_score/models/users.dart';

class UserService {
  // Create the controller that will broadcast the messages
  final StreamController<List<User>> _userController =
      StreamController<List<User>>.broadcast();

  // Collection called reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  // stream of snapshots
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Stream listenToUsersRealTime() {
    // Register the handler for when the user data changes
    collection.snapshots().listen((userSnapshot) {
      if (userSnapshot.docs.isNotEmpty) {
        var users = userSnapshot.docs
            .map((snapshot) => User.fromSnapshot(snapshot))
            .where((mappedItem) => mappedItem.userId != null)
            .toList();
        // Add the users onto the controller
        _userController.add(users);
      }
    });
    // Return the stream underlying our _userController.
    return _userController.stream;
  }

  // adds a new user to firestore
  Future<void> addUser(User user, userId) {
    return collection.doc(userId).set(user.toJson());
  }

  // updates user
  void updateUser(User user) async {
    await collection.doc(user.userId).update(user.toJson());
  }

  // deletes user
  void deleteUser(User user) async {
    await collection.doc(user.userId).delete();
  }

  addChats(List<User> users) async {
    try {
      for (var user in users) {
        DocumentReference docRef = collection.doc(user.userId);
        DocumentSnapshot doc = await docRef.get();

        docRef.update({'chats': FieldValue.arrayUnion(user.chats)});
      }

      return true;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
