import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/models/msg.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/services/message_service.dart';
import 'package:parallel_score/utils/constants/app_constants.dart';
import 'package:parallel_score/utils/constants/storage_keys.dart';
import 'package:parallel_score/utils/enums.dart';
import 'package:parallel_score/utils/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatDetailViewModel extends FormViewModel {
  final _messageService = locator<DataRepository>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _snackbarService = locator<SnackbarService>();

  @override
  void setFormStatus() {}

  // Send a message
  // requires the id of the recipient and
  // the message
  sendMessage(String receiverId, String message) async {
    String userId = _storageService.getString(StorageKeys.userId)!;
    // Ensures the ids are always added the same way everytime
    final idHash = getConversationID(userId, receiverId);
    var _id = idHash.split('_');
    if (message.isNotEmpty) {
      // Message object
      final newMessage = Message(
          isMessageRead: false,
          senderId: userId,
          receiverId: receiverId,
          message: message,
          urlAvatar: userAvatar,
          date: DateTime.now(),
          users: [_id[0], _id[1]]);
      var result = await _messageService.addMessage(newMessage);
      // if error show error message in snackbar
      if (result is String) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(milliseconds: 1500),
          variant: SnackbarType.failure,
          message: 'Message sending failed',
        );
      }
    }
    notifyListeners();
  }

  // message stream
  getStream() {
    return _messageService.getStream();
  }

  // returns the id of the current user
  String get currentUserId => _storageService.getString(StorageKeys.userId)!;
}
