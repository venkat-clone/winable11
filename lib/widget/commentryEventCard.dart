import 'package:flutter/material.dart';

class CommentaryEventCard extends StatelessWidget {
  final Map<String, dynamic> eventData;

  CommentaryEventCard(this.eventData);

  @override
  Widget build(BuildContext context) {
    final String event = eventData['event'];
    final String commentary = eventData['commentary'];
    final String batsmanName = eventData['batsmen'][0]['batsman_id'];
    final String bowlerName = eventData['bowlers'][0]['bowler_id'];
    final String score = eventData['score'].toString();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              commentary,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  '$batsmanName to $bowlerName, ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  score,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
