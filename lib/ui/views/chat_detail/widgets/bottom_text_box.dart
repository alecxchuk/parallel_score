import 'package:flutter/material.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';

class MessageBox extends StatelessWidget {
  final VoidCallback sendMessage;
  final TextEditingController controller;
  const MessageBox(
      {Key? key, required this.sendMessage, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            UIHelper.customHorizontalSpace(15),
            Expanded(
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            UIHelper.customHorizontalSpace(15),
            FloatingActionButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  sendMessage();
                  controller.clear();
                }
              },
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
