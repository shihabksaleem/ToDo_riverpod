import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  final Color progressColor;
  final String Title;
  final int numberOfTasks;

  const CategoryCard(
      {super.key,
      required this.progressColor,
      required this.Title,
      required this.numberOfTasks});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: MediaQuery.of(context).size.width * .25,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$numberOfTasks Tasks',
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 10,
            ),
            Text(
              Title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              padding: EdgeInsets.zero,
              lineHeight: 5,
              percent: 0.5,
              progressColor: progressColor,
              backgroundColor: Colors.white30,
            ),
          ],
        ),
      ),
    );
  }
}
