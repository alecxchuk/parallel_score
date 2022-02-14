import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:parallel_score/models/msg.dart';
import 'package:parallel_score/ui/views/chat_detail/chat_detail.form.dart';
import 'package:parallel_score/ui/views/chat_detail/widgets/app_bar.dart';
import 'package:parallel_score/ui/views/chat_detail/widgets/bottom_text_box.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_detail_vm.dart';

@FormView(fields: [
  FormTextField(name: 'message'),
])
class ChatDetailView extends HookWidget with $ChatDetailView {
  final String receiverId;
  final String avatarUrl;
  final String chatName;
  ChatDetailView(
      {Key? key,
      required this.receiverId,
      required this.avatarUrl,
      required this.chatName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return ViewModelBuilder<ChatDetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ChatDetailAppbar(
          avatarUrl: avatarUrl,
          chatName: chatName,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: model.getStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              }
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                if (scrollController.hasClients) {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                }
              });

              var messageSnapshot = snapshot.data?.docs ?? [];

              messageSnapshot.retainWhere((msg) =>
                  Message.fromSnapshot(msg).users.contains(receiverId) &&
                  Message.fromSnapshot(msg)
                      .users
                      .contains(model.currentUserId));
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 58.0),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: messageSnapshot.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Align(
                            alignment: (Message.fromSnapshot(
                                            messageSnapshot[index])
                                        .receiverId ==
                                    model
                                        .currentUserId // messages[index].messageType == "receiver"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (Message.fromSnapshot(
                                                messageSnapshot[index])
                                            .receiverId ==
                                        model
                                            .currentUserId //messages[index].messageType == "receiver"
                                    ? Colors.grey.shade200
                                    : Colors.blue[200]),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                Message.fromSnapshot(messageSnapshot[index])
                                    .message, // messages[index].messageContent,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MessageBox(
                    sendMessage: () =>
                        model.sendMessage(receiverId, messageController.text),
                    controller: messageController,
                  )
                ],
              );
            }),
      ),
      viewModelBuilder: () => ChatDetailViewModel(),
    );
  }
}
