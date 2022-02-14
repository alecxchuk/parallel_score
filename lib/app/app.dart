import 'package:parallel_score/services/authentication_service.dart';
import 'package:parallel_score/services/local_storage_service.dart';
import 'package:parallel_score/services/message_service.dart';
import 'package:parallel_score/services/user_service.dart';
import 'package:parallel_score/ui/views/add_users/add_users.dart';
import 'package:parallel_score/ui/views/chat_detail/chat_detail.dart';
import 'package:parallel_score/ui/views/chat_page/chat_page.dart';
import 'package:parallel_score/ui/views/home/home.dart';
import 'package:parallel_score/ui/views/home/home_vm.dart';
import 'package:parallel_score/ui/views/login/login_view.dart';
import 'package:parallel_score/ui/views/signup/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(
      page: SignupView,
    ),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ChatPageView),
    MaterialRoute(page: ChatDetailView),
    MaterialRoute(page: AddUsers),
    // CupertinoRoute(page: SecondView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HomeViewModel),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DataRepository),
    LazySingleton(classType: UserService),
    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
// flutter pub run build_runner build --delete-conflicting-outputs