import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget child;

  const EventCard({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Colors.white60 : Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
