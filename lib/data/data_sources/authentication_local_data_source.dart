import 'package:hive/hive.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
  Future<String?> getSessionId();
  Future<void> deleteSessionId();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> deleteSessionId() async {
    print('delete session - local');
    final authenticationBox = await Hive.openBox('authenticationBox');
    authenticationBox.delete('session_id');
  }

  @override
  Future<String?> getSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    return authenticationBox.get('session_id') as String?;
  }

  @override
  Future<void> saveSessionId(String sessionId) async{
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.put('session_id', sessionId);
  }
}