import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'event_card.dart';

class MyTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;

  const MyTimeLine({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    this.eventCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Color(0xFFCE6A6B) : Color(0xFFCE6A6B),
        ),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? Color(0xFFCE6A6B) : Color(0xFFCE6A6B),
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Color(0xFFCE6A6B),
          ),
        ),
        endChild: EventCard(
          isPast: isPast,
          isFirst: isFirst,
          isLast: isLast,
          child: eventCard,
        ),
      ),
    );
  }
}
