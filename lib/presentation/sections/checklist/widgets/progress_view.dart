import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressView extends StatelessWidget {
  final double progress;
  const ProgressView({
    Key key,
    @required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width,
          progressColor: Colors.lightGreen,
          percent: progress,
        ),
      ],
    );
  }
}
