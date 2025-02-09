import 'package:flutter/material.dart';

import './countdown_clock.dart';

class Player extends StatelessWidget {
  final String name;
  final int? rating;
  final String? title;
  final Duration clock;
  final bool active;

  const Player(
      {required this.name,
      this.title,
      this.rating,
      required this.active,
      required this.clock,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: const TextStyle(fontSize: 18, color: Colors.orange),
                ),
                const SizedBox(width: 5),
              ],
              Flexible(
                  child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              const SizedBox(width: 3),
              if (rating != null)
                Text(
                  rating.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
            ]),
          )),
          CountdownClock(
            duration: clock,
            active: active,
          ),
        ],
      ),
    );
  }
}
