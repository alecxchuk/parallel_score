import 'package:flutter/material.dart';
import 'package:parallel_score/models/msg.dart';
import 'package:parallel_score/models/users.dart';

import 'package:parallel_score/ui/views/chat_page/widgets/conversation_list.dart';
import 'package:parallel_score/ui/views/chat_page/widgets/search_bar.dart';
import 'package:parallel_score/utils/utilities.dart';
import 'package:stacked/stacked.dart';
import 'chat_page_vm.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatPageViewModel>.reactive(
      onModelReady: (model) {
        model.listenToMessages();
        model.listenToUsers();
      },
      builder: (context, model, child) {
        return Scaffold(
            body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Conversations",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: model.nToAddUsers,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[50],
                          ),
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.pink,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Add New",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SearchBar(),
              model.openChats.isEmpty
                  ? const Center(child: Text('No Chats'))
                  : ListView.builder(
                      itemCount: model.openChats.length, // chatUsers.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<User> users = model.users;
                        List<Message> messages = model.messages;
                        var user = users.firstWhere(
                            (user) => user.userId == model.openChats[index]);
                        var lastMessage = messages.where((message) =>
                            message.users.contains(model.openChats[index]) &&
                            message.users.contains(model.currentUserId));

                        return ConversationList(
                          name: user.name,
                          messageText: lastMessage.isNotEmpty
                              ? model.latest(lastMessage).message
                              : '',
                          imageUrl: user.avatarUrl,
                          time: lastMessage.isNotEmpty
                              ? getTime(model.latest(lastMessage).date)
                              : '', // chatUsers[index].time,
                          isMessageRead:
                              (index == 0 || index == 3) ? true : false,
                          nToChatDetail: () => model.nToChatDetail(
                              model.openChats[index],
                              user.avatarUrl,
                              user.name),
                        );
                      },
                    ),
            ],
          ),
        ));
      },
      viewModelBuilder: () => ChatPageViewModel(),
    );
  }
}
