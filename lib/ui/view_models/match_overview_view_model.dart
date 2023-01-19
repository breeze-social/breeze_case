import 'package:breeze_case/core/app/app.locator.dart';
import 'package:breeze_case/core/models/match.dart';
import 'package:breeze_case/core/services/match_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class MatchOverviewViewModel extends BaseViewModel {
  MatchOverviewViewModel(this.matchId);

  final String matchId;

  Match get match => locator<MatchRepository>().matches.firstWhereOrNull((match) => match.id == matchId)!;

  void initialise() async {
    locator<MatchRepository>().addListener(notifyListeners);
    await updateMatches();
  }

  Future<void> updateMatches() async {
    setBusy(true);
    final bool success = await locator<MatchRepository>().getMatches();
    if (!success) debugPrint('Error while updating matches');
    setBusy(false);
  }
}
