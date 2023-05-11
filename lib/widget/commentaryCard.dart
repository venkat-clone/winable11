import 'package:flutter/material.dart';

class CommentaryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String commentary;

  CommentaryCard({required this.title, required this.subtitle, required this.commentary});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(commentary),
          ),
        ],
      ),
    );
  }
}
