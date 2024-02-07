abstract class UserService {
  // Future<User> getUserById(int id);
  // Future<List<User>> getAllUsers();
  // Future<void> saveUser(User user);
  Future<dynamic> login(String username, String password);
}

class User {
  final int id;
  final String name;
  final String password;
  final String? email;

  User(
      {required this.id,
      required this.name,
      required this.password,
      this.email});
}
