import '../../../../presentation/presenters/getx_surveys_presenter.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SurveysPresenter makeGetXSurveysPresenter() =>
    GetXSurveysPresenter(loadSurveys: makeRemoteLoadSurveys());
