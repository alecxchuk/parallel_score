import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/app/app.router.dart';
import 'package:parallel_score/models/users.dart';
import 'package:parallel_score/services/authentication_service.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/services/user_service.dart';
import 'package:parallel_score/utils/constants/app_constants.dart';
import 'package:parallel_score/utils/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'signup_view.form.dart';

class SignupViewModel extends FormViewModel with ValidatorMixin {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  // Authentication service
  final _authenticationService = locator<AuthenticationService>();
  // storage service
  final _storageService = locator<SharedPreferenceLocalStorage>();

  // user service
  final _userService = locator<UserService>();

  // email field error message
  String _errorMessage = '';
  // password field error message
  String _passwordErrorMessage = '';
  // name field error message
  String _nameError = '';
  // getter for email field error message
  String get emailErrorMessage => _errorMessage;
  // getter for password field error message
  String get passwordErrorMessage => _passwordErrorMessage;
  // getter for name field error message
  String get nameErrorMessage => _nameError;
  // validate form
  bool validateForm = false;

  // check for invalid email
  checkEmail() {
    if (validateForm) {
      // set email error message
      _errorMessage = validateEmail(emailValue ?? '') ?? '';
      notifyListeners();
    }
  }

  // check for invalid email
  checkName() {
    if (validateForm) {
      // set email error message
      _nameError = validateNotEmptyField(fullnameValue ?? '', 'name') ?? '';
      // return _nameError;
      notifyListeners();
    }
  }

  // check for invalid password
  checkPassword() {
    if (validateForm) {
      // set password error message
      _passwordErrorMessage = validatePassword(passwordValue ?? '') ?? '';
      notifyListeners();
    }
  }

  // Starts form auto validation
  formValidate() {
    // start auto validation
    validateForm = true;
    checkName();
    checkEmail();
    checkPassword();
    notifyListeners();
  }

  // returns true if sign up form is valid
  formValid() {
    if (_errorMessage.isEmpty &&
        _nameError.isEmpty &&
        _passwordErrorMessage.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  void setFormStatus() {}

  // naviagte to main page
  nToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  nToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  // signup
  Future signup() async {
    setBusy(true);
    // start auto form validation
    formValidate();
    // sign user up if form is valid
    if (formValid()) {
      var result = await _authenticationService.signUpWithEmail(
          name: fullnameValue!, email: emailValue!, password: passwordValue!);
      if (result['success']) {
        String userId = result['user'].uid;

        // new user object for user info
        final newUser = User(
            userId: userId,
            email: emailValue!,
            name: fullnameValue!,
            avatarUrl: userAvatar);
        _userService.addUser(newUser, userId);

        // store user info in shared preferences
        _storageService.setUser(newUser);

        // navigate to home page
        nToHome();
      } else {
        // show error in dialog box
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: result['message'].message,
        );
      }
    }
    setBusy(false);
  }
}
