import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/app/app.router.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/utils/constants/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _navigationService = locator<NavigationService>();

  // logout
  logout() async {
    await _storageService.clearStorage();
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }

  // get user data from shared preferences
  String get userEmail =>
      _storageService.getString(StorageKeys.userEmail) ?? '';
  String get userName => _storageService.getString(StorageKeys.userName) ?? '';
  String get userAvatar =>
      _storageService.getString(StorageKeys.userAvatar) ?? '';
}
