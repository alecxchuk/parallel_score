import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/models/users.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/services/user_service.dart';
import 'package:parallel_score/utils/constants/storage_keys.dart';
import 'package:parallel_score/utils/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddUsersModel extends BaseViewModel {
  // User service
  final _userService = locator<UserService>();
  // Storage service
  final _storageService = locator<SharedPreferenceLocalStorage>();
  // Navigation Service
  final _navigationService = locator<NavigationService>();
  // Snackbar service
  final _snackbarService = locator<SnackbarService>();

  addUserToChat(User user) async {
    setBusy(true);
    // first User to be added
    final newUser = User(
        userId: _storageService.getString(StorageKeys.userId),
        email: _storageService.getString(StorageKeys.userEmail)!,
        name: _storageService.getString(StorageKeys.userName)!,
        avatarUrl: _storageService.getString(StorageKeys.userAvatar)!,
        chats: [user.userId]);

    // Second user to start chat
    final user2 = User(
        userId: user.userId,
        email: user.email,
        name: user.name,
        avatarUrl: user.avatarUrl,
        chats: [currentUserId]);

    // add users to chat
    var result = await _userService.addChats([newUser, user2]);
    // result is a string: error
    // result is bool: success
    if (result is String) {
      // show error message in snackbar
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.failure,
        message: 'Could not add user',
      );
    } else {
      // show success message in snackbar
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.success,
        message: 'User added',
      );
    }
    setBusy(false);
    // go back to previous page
    _navigationService.popRepeated(1);
  }

  // Function gets the id of the current user from shared preferences
  String get currentUserId => _storageService.getString(StorageKeys.userId)!;
}
