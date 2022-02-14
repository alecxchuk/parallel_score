import 'package:parallel_score/models/chat_messages_model.dart';
import 'package:parallel_score/models/chat_users_model.dart';

const loginText = 'Login';
const signupText = 'Sign up';
const emailText = 'Email';
const passwordText = 'Password';
const forgotYourPasswordText = 'Forgot your Password';
const loginSocialAccount = 'Or Login with social account';
const nameText = 'Name';
const alreadyHaveAccount = 'Already have an account';

List<ChatUsers> chatUsers = [
  ChatUsers(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      imageURL: "images/userImage1.jpeg",
      time: "Now"),
  ChatUsers(
      name: "Glady's Murphy",
      messageText: "That's Great",
      imageURL: "images/userImage2.jpeg",
      time: "Yesterday"),
  ChatUsers(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      imageURL: "images/userImage3.jpeg",
      time: "31 Mar"),
  ChatUsers(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "images/userImage4.jpeg",
      time: "28 Mar"),
  ChatUsers(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      imageURL: "images/userImage5.jpeg",
      time: "23 Mar"),
  ChatUsers(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      imageURL: "images/userImage6.jpeg",
      time: "17 Mar"),
  ChatUsers(
      name: "Andrey Jones",
      messageText: "Can you please share the file?",
      imageURL: "images/userImage7.jpeg",
      time: "24 Feb"),
  ChatUsers(
      name: "John Wick",
      messageText: "How are you?",
      imageURL: "images/userImage8.jpeg",
      time: "18 Feb"),
];

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];
