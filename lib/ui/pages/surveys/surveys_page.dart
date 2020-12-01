import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

class SurveysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.strings.surveys),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: CarouselSlider(
          items: [],
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 1,
          ),
        ),
      ),
    );
  }
}
