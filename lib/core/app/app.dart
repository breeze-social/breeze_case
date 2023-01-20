import 'package:breeze_case/core/api/api.dart';
import 'package:breeze_case/core/services/match_repo.dart';
import 'package:breeze_case/core/services/user_repo.dart';
import 'package:breeze_case/ui/views/home_view.dart';
import 'package:breeze_case/ui/views/match_progress_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  CupertinoRoute(page: HomeView, initial: true),
  CupertinoRoute(page: MatchProgressView),
], dependencies: [
  LazySingleton(classType: Api),
  LazySingleton(
    classType: NavigationService,
    environments: {Environment.dev},
  ),
  Singleton(classType: MatchRepository),
  Singleton(classType: UserRepository),
])
class App {
  /** This class has no purpose besides housing the annotation that generates the required functionality **/
}
