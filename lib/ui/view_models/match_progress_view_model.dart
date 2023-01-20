import 'package:breeze_case/core/app/app.locator.dart';
import 'package:breeze_case/core/models/match.dart';
import 'package:breeze_case/core/services/match_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchProgressViewModel extends BaseViewModel {
  MatchProgressViewModel(this.matchId);

  final String matchId;

  Match get match => locator<MatchRepository>().matches.firstWhereOrNull((match) => match.id == matchId)!;



  Future<void> payForDate() async {
    if (isBusy) return;
    setBusy(true);
    await locator<MatchRepository>().payForMatchById(matchId);
    setBusy(false);
  }

  Future<void> provideAvailabilityForDate() async {
    if (isBusy) return;
    setBusy(true);
    await locator<MatchRepository>().setAvailabilityGivenForMatchById(matchId);
    setBusy(false);
  }

  Future<void> confirmPresenceForDate() async {
    if (isBusy) return;
    setBusy(true);
    await locator<MatchRepository>().setConfirmedAtForMatchById(matchId);
    setBusy(false);
  }

  void initialise() {
    locator<MatchRepository>().addListener(notifyListeners);
  }

  @override
  void dispose() {
    locator<MatchRepository>().removeListener(notifyListeners);
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) debugPrint('Could not launch $url');
  }
}
