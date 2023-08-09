enum AppEndpoints {
  login('users/login'),
  getUserByToken('users/byToken');

  final String path;

  const AppEndpoints(this.path);
}
