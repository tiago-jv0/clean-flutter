import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:ForDev/domain/usecases/usecases.dart';

class GetXSurveysPresenter {
  final LoadSurveys loadSurveys;

  GetXSurveysPresenter({@required this.loadSurveys});

  Future<void> loadData() async {
    await loadSurveys.load();
  }
}

class LoadSurveysSpy extends Mock implements LoadSurveys {}

void main() {
  LoadSurveysSpy loadSurveys;
  GetXSurveysPresenter sut;

  setUp(() {
    loadSurveys = LoadSurveysSpy();
    sut = GetXSurveysPresenter(loadSurveys: loadSurveys);
  });
  test('Shou call LoadSurveys on loadData', () async {
    await sut.loadData();

    verify(loadSurveys.load()).called(1);
  });
}
