import 'package:dlbm/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';
import 'package:dlbm/utils/request.dart';

class UserServiceImpl implements UserService {
  AxiosClient client = AxiosClient();

  @override
  Future<dynamic> login(String username, String password) async {
    // 实现获取用户的逻辑
    dynamic result = await client.request(
      method: "post",
      url: '/auth/login',
      data: {"username": username, "password": password},
    );
    if (result != null && result.containsKey('token')) {
      String token = result['token'];
      SharedPreferences storage = await localStorage();
      storage.setString('token', token);
    }

    return result;
  }

  // @override
  // Future<List<User>> getAllUsers() {
  //   // 实现获取所有用户的逻辑
  //   return [];
  // }

  // @override
  // Future<void> saveUser(User user) {
  //   // 实现保存用户的逻辑
  // }
}
