import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/domain/usecases/usecases.dart';

import '../factories.dart';

LoadSurveys makeRemoteLoadSurveys() => RemoteLoadSurveys(
    url: makeApiUrl('surveys'), httpClient: makeHttpAdapter());
