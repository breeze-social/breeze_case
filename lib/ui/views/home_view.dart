import 'package:breeze_case/core/app/app.locator.dart';
import 'package:breeze_case/core/app/app.router.dart';
import 'package:breeze_case/ui/view_models/home_view_model.dart';
import 'package:breeze_case/ui/widgets/match_card.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final RefreshController _refreshController = RefreshController(initialRefresh: true);

  /// Called when the user pulls down to refresh.
  void _refreshCompleted() => _refreshController.refreshCompleted();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(onRefreshCompleted: _refreshCompleted),
        onViewModelReady: (model) => model.initialise(),
        builder: (context, model, _) => Scaffold(
            body: SmartRefresher(
                controller: _refreshController,
                onRefresh: model.updateMatches,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    physics: const BouncingScrollPhysics(),
                    itemCount: model.matches.length,
                    itemBuilder: (context, index) => MatchCard(model.matches[index],
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        onPressed: () => locator<NavigationService>().navigateTo(Routes.matchProgressView,
                            arguments: MatchProgressViewArguments(matchId: model.matches[index].id)))))));
  }
}
