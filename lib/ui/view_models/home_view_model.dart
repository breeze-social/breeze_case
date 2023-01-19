import 'package:breeze_case/core/app/app.locator.dart';
import 'package:breeze_case/core/models/match.dart';
import 'package:breeze_case/core/services/match_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({required this.onRefreshCompleted});

  final void Function() onRefreshCompleted;

  List<Match> get matches => locator<MatchRepository>().matches;

  void initialise() async {
    locator<MatchRepository>().addListener(notifyListeners);
    await updateMatches();
    onRefreshCompleted();
  }

  Future<void> updateMatches() async {
    setBusy(true);
    final bool success = await locator<MatchRepository>().getMatches();
    if (!success) debugPrint('Error while updating matches');
    setBusy(false);
  }
}
