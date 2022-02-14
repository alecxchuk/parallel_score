import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/app/app.router.dart';
import 'package:parallel_score/models/msg.dart';
import 'package:parallel_score/models/users.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/services/message_service.dart';
import 'package:parallel_score/services/user_service.dart';
import 'package:parallel_score/utils/constants/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _messageService = locator<DataRepository>();
  final _userService = locator<UserService>();

  final _storageService = locator<SharedPreferenceLocalStorage>();

  int get activeChats => _activeChats;
  int _activeChats = 0;

  List _openChats = [];
  List get openChats => _openChats;

  // Navigate to chat detail page
  nToChatDetail(String receiverId, String avatarUrl, String chatName) {
    _navigationService.navigateTo(Routes.chatDetailView,
        arguments: ChatDetailViewArguments(
            receiverId: receiverId, avatarUrl: avatarUrl, chatName: chatName));
    notifyListeners();
  }

  nToAddUsers() {
    _navigationService.navigateTo(Routes.addUsers);
  }

  getStream() {
    return _messageService.getStream();
  }

  getUserStream() {
    return _userService.getStream();
  }

  List<Message> _messages = [];
  List<Message> get messages => _messages;
  void listenToMessages() {
    setBusy(true);
    _messageService.listenToMessagesRealTime().listen((messageData) {
      List<Message> updatedMessage = messageData;
      if (updatedMessage != null && updatedMessage.isNotEmpty) {
        _messages = updatedMessage;
        notifyListeners();
      }
      setBusy(false);
    });
  }

  List<User> _users = [];
  List<User> get users => _users;
  void listenToUsers() {
    setBusy(true);
    _userService.listenToUsersRealTime().listen((userData) {
      List<User> updatedUser = userData;
      if (updatedUser != null && updatedUser.isNotEmpty) {
        _users = updatedUser;
        getOpenChats();
        notifyListeners();
      }
      setBusy(false);
    });
  }

  getOpenChats() {
    Iterable<User> userx =
        _users.where((element) => element.userId == currentUserId);
    _openChats = userx.first.chats;
    notifyListeners();
  }

  Message latest(Iterable<Message> latest) {
    final now = DateTime.now();
    return latest.reduce((value, element) {
      // print('$value $element kkkk');
      return value.date.difference(now).abs() <
              element.date.difference(now).abs()
          ? value
          : element;
    });
  }

  String get userAvatar => _storageService.getString(StorageKeys.userAvatar)!;
  String get currentUserId => _storageService.getString(StorageKeys.userId)!;
}
