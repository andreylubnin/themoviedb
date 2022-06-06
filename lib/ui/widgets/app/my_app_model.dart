import 'package:themoviedb/domain/data_providers/session_data_provider.dart';

class MyAppModel {
  final _sessionDataProvider = SessionDataProvider();
  var _isAuth = false;

  bool get isAuth => _isAuth;

  Future<bool> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    return _isAuth = sessionId != null;
  }
}
