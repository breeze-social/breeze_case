import 'package:breeze_case/core/api/api.dart';
import 'package:breeze_case/core/services/match_repo.dart';
import 'package:breeze_case/core/services/user_repo.dart';
import 'package:breeze_case/ui/views/home_view.dart';
import 'package:breeze_case/ui/views/match_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  CupertinoRoute(page: HomeView, initial: true),
  CupertinoRoute(page: MatchOverviewView),
], dependencies: [
  LazySingleton(classType: Api),
  Singleton(classType: MatchRepository),
  Singleton(classType: UserRepository),
])
class App {
  /** This class has no purpose besides housing the annotation that generates the required functionality **/
}
