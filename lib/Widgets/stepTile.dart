import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget stepTile(int index, bool isLast, IconData icon, String title, List<String> lines, bool isActive) {
  return TimelineTile(
    alignment: TimelineAlign.manual,
    // lineX: 0.1,
    isFirst: index == 0,
    isLast: isLast,
    indicatorStyle: IndicatorStyle(
      width: 22,
      indicator: Icon(icon, color: isActive ? Colors.green : Colors.grey, size: 22),
    ),
    beforeLineStyle: LineStyle(color: isActive ? Colors.green : Colors.grey.shade300),
    startChild: Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ...lines.map((l) => Text(l, style: const TextStyle(fontSize: 12, color: Colors.grey))),
        ],
      ),
    ),
  );
}
