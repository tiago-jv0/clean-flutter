import 'package:ForDev/main/factories/factories.dart';
import 'package:flutter/widgets.dart';

import '../../../../ui/pages/pages.dart';

Widget makeSurveysPage() => SurveysPage(
      presenter: makeGetXSurveysPresenter(),
    );
