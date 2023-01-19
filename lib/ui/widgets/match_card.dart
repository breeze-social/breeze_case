import 'package:breeze_case/core/constants/icons.dart';
import 'package:breeze_case/core/extensions/datetime.dart';
import 'package:breeze_case/core/models/match.dart';
import 'package:breeze_case/ui/shared/theme.dart';
import 'package:breeze_case/ui/shared/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MatchCard extends StatelessWidget {
  const MatchCard(this.match, {this.onPressed, Key? key}) : super(key: key);

  final Match match;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final List<_DateDetailData> itemsForDate = [
      if (match.plannedOn != null) _DateDetailData(match.plannedOn!.toDateFormatOrTodayTomorrow(), AppIcons.calendar),
      _DateDetailData(match.city, AppIcons.location),
      _DateDetailData(match.dealType, AppIcons.calendar),
      if (match.deal != null) _DateDetailData(match.deal!, AppIcons.checkmark)
    ];

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: screenWidth() * .9,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 23),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CachedNetworkImage(
                    imageUrl: match.otherUser.photo,
                    errorWidget: (_, __, ___) => const SizedBox(width: 100, height: 100, child: Icon(Icons.error)),
                    imageBuilder: (_, imageProvider) => Container(
                        width: 134,
                        height: 176,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)))),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(height: 10),
                    Text('Date details', style: BreezeTheme.themeData.textTheme.headline2),
                    const SizedBox(height: 10),
                    for (final info in itemsForDate) _DateDetailItem(info),
                  ]))
            ]),
          ),
        ),
      ),
    );
  }
}

class _DateDetailItem extends StatelessWidget {
  const _DateDetailItem(this.data, {Key? key}) : super(key: key);

  final _DateDetailData data;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(data.icon),
      const SizedBox(width: 10),
      Text(data.title),
    ]);
  }
}

class _DateDetailData {
  const _DateDetailData(this.title, this.icon);

  final String title;
  final String icon;
}
