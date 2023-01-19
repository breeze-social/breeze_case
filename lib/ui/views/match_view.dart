import 'package:breeze_case/core/extensions/datetime.dart';
import 'package:breeze_case/ui/view_models/match_overview_view_model.dart';
import 'package:breeze_case/ui/widgets/match_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchOverviewView extends StatelessWidget {
  const MatchOverviewView(this.matchId, {super.key});

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MatchOverviewViewModel>.reactive(
        viewModelBuilder: () => MatchOverviewViewModel(matchId),
        builder: (context, model, _) => Scaffold(
            appBar: AppBar(),
            body: Column(children: [
              MatchCard(model.match),
              for (final phase in [
                _MatchPhase(
                    date: model.match.createdAt,
                    title: 'You matched with ${model.match.matchedUsers.first.name}',
                    isUnlocked: true),
                _MatchPhase(
                    date: model.match.paidAt,
                    title: model.match.paidAt == null ? 'You pay for your date' : 'You paid for your date',
                    isActive: model.match.paidAt == null),
                _MatchPhase(
                    date: model.match.availabilityGivenAt,
                    title: model.match.paidAt == null
                        ? 'Date is picked'
                        : model.match.plannedOn == null
                            ? 'Pick a date'
                            : 'You picked a date',
                    isUnlocked: model.match.paidAt != null,
                    isActive: model.match.plannedOn == null),
                _MatchPhase(
                    date: model.match.confirmedAt,
                    title: model.match.plannedOn == null
                        ? 'Waiting on location reveal'
                        : model.match.confirmedAt == null
                            ? 'Confirm the date'
                            : 'The date is confirmed',
                    isUnlocked: model.match.plannedOn != null,
                    isActive: model.match.plannedOn!.isToday()),
                _MatchPhase(
                    date: model.match.plannedOn,
                    title:
                        model.match.plannedOn?.isAfter(DateTime.now()) == true ? 'You’re done!' : 'The day of the date',
                    isUnlocked: model.match.confirmedAt != null)
              ])
                Text(phase.title)
            ]),
            floatingActionButton: FloatingActionButton(
                onPressed: model.updateMatches, tooltip: 'Refresh', child: const Icon(Icons.refresh))));
  }

  Future<void> _launchDummyUrl() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) debugPrint('Could not launch $url');
  }
}

class _MatchPhase {
  const _MatchPhase({required this.title, this.date, this.isActive = false, this.isUnlocked = false, this.hasAction});

  final String title;
  final DateTime? date;
  final bool isActive;
  final bool isUnlocked;
  final void Function()? hasAction;
}
