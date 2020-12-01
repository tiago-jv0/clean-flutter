import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'surveys_presenter.dart';

import '../../helpers/helpers.dart';
import '../../components/components.dart';

class SurveysPage extends StatelessWidget {
  final SurveysPresenter presenter;

  SurveysPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(R.strings.surveys),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading == true) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CarouselSlider(
              items: [],
              options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
