import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import '../http/http.dart';

class RemoteSurveyModel {
  final String id;
  final String question;
  final String date;
  final bool didAnswer;

  RemoteSurveyModel({
    @required this.id,
    @required this.question,
    @required this.date,
    @required this.didAnswer,
  });

  factory RemoteSurveyModel.fromJson(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['id', 'question', 'didAnswer', 'date'])) {
      throw HttpError.invalidData;
    }

    return RemoteSurveyModel(
      id: json['id'],
      question: json['question'],
      didAnswer: json['didAnswer'],
      date: json['date'],
    );
  }
  SurveyEntity toEntity() => SurveyEntity(
        id: this.id,
        didAnswer: this.didAnswer,
        question: this.question,
        dateTime: DateTime.parse(this.date),
      );
}
