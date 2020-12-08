import 'package:flutter/widgets.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeSurveysPage() => SurveysPage(
      presenter: makeGetXSurveysPresenter(),
    );
