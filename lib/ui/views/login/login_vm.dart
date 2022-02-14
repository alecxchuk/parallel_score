import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/app/app.router.dart';
import 'package:parallel_score/models/users.dart';
import 'package:parallel_score/services/authentication_service.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/utils/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';

class LoginVm extends FormViewModel with ValidatorMixin {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  // Authentication service
  final _authenticationService = locator<AuthenticationService>();
  // storage service
  final _storageService = locator<SharedPreferenceLocalStorage>();
  @override
  void setFormStatus() {}

  // navigate to signup
  nToSignup() {
    _navigationService.navigateTo(Routes.signupView);
    notifyListeners();
  }

  // naviagte to main page
  nToMainPage() {}

  // naviagte to main page
  nToForgotPassword() {
    // _navigationService.navigateTo(Routes.forgotPasswordView);
    notifyListeners();
  }

  // email field error message
  String _errorMessage = '';
  // password field error message
  String _passwordErrorMessage = '';
  // getter for email field error message
  String get msg => _errorMessage;
  // getter for password field error message
  String get passwordErrorMessage => _passwordErrorMessage;
  // validate form
  bool validateForm = false;

  // check for invalid email
  checkEmail() {
    // set email error message
    _errorMessage = validateEmail(emailValue!) ?? '';
    notifyListeners();
  }

// check for invalid password
  checkPassword() {
    // set password error message
    _passwordErrorMessage = validatePassword(passwordValue!) ?? '';
    notifyListeners();
  }

  // Starts form auto validation
  formValidate() {
    // start auto validation
    validateForm = true;
    checkEmail();
    checkPassword();
    notifyListeners();
  }

  // returns true if login form is valid
  formValid() {
    if (_errorMessage.isEmpty && _passwordErrorMessage.isEmpty) {
      return true;
    }
    return false;
  }

  // navigates to home page
  nToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  // login
  login() async {
    setBusy(true);

    // start form validation
    formValidate();

    // login user if form is valid
    if (formValid()) {
      var result = await _authenticationService.loginWithEmail(
          email: emailValue!, password: passwordValue!);
      // check for success
      if (result['success']) {
        String userId = result['user'].uid;
        String displayName = result['user'].displayName;
        String avatarUrl = result['user'].photoURL;

        // user object for user information
        final user = User(
            email: emailValue!,
            name: displayName,
            avatarUrl: avatarUrl,
            userId: userId);

        // Store email, id, name and avatar in shared preferences
        _storageService.setUser(user);
        // navigate to home page.
        nToHome();
      } else {
        // Dialog box error
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: result['message'].message,
        );
      }
    }
    setBusy(false);
  }
}
