import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'event_card.dart';

class MyTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;

  const MyTimeLine({
    Key? key, // Corrected key declaration
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
            color: isPast ? Colors.pinkAccent : Colors.deepPurpleAccent.shade100),
        indicatorStyle: IndicatorStyle(
            width: 40,
            color: isPast ? Colors.pinkAccent : Colors.deepPurpleAccent.shade100,
            iconStyle: IconStyle(
              iconData: Icons.done,
              color: isPast ? Colors.white : Colors.deepPurpleAccent.shade100,
            )),
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
