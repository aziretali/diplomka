import 'package:auth_mega_lesson/feature/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<bool> sendNumber({required String phone}) async {
    if (phone.length == 10) {
      return true;
    } else {
      return false;
    }
  }
}
