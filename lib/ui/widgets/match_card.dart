import 'package:breeze_case/core/constants/icons.dart';
import 'package:breeze_case/core/extensions/datetime.dart';
import 'package:breeze_case/core/models/match.dart';
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
          child: Row(children: [
            CachedNetworkImage(
                imageUrl: match.matchedUsers.first.photo,
                errorWidget: (_, __, ___) => const SizedBox(width: 100, height: 100, child: Icon(Icons.error)),
                imageBuilder: (_, imageProvider) => Container(
                    width: 201,
                    height: 343,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover)))),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Date details'),
                for (final info in itemsForDate) _DateDetailItem(info),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text('Name'),
                  Text('Age'),
                  Text('Location'),
                ]),
                const Icon(Icons.favorite_border),
              ],
            )
          ]),
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
