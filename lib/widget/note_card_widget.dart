import 'package:belajardasarflutter/model/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final _lightColors = [
  Colors.lightBlue.shade400,
  Colors.lightBlue.shade300,
  Colors.lightBlue.shade200,
  Colors.lightBlue.shade600,
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.dateTimeCreated?? 'default value',
              style: TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 4),
            Text(
              note.judul,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 14),
            Text(
              note.isi,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}