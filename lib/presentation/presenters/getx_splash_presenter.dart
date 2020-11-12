import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';

import '../../ui/pages/pages.dart';

class GetXSplashPresenter extends GetxController implements SplashPresenter {
  LoadCurrentAccount loadCurrentAccount;

  var _navigateTo = RxString();

  GetXSplashPresenter({@required this.loadCurrentAccount});

  @override
  Stream<String> get navigateToStream => _navigateTo.stream;

  @override
  Future<void> checkAccount() async {
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account.isNull ? '/login' : '/surveys';
    } catch (e) {
      _navigateTo.value = '/login';
    }
  }
}
