import 'package:ForDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class SurveyItem extends StatelessWidget {
  final SurveyViewModel viewModel;

  SurveyItem(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '20 ago 2020',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              viewModel.question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
