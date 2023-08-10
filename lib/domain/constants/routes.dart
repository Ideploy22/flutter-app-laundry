enum NamedRoutes {
  splashScreen('/'),
  loginScreen('/login'),
  homeScreen('/home'),
  configurationScreen('/configuration');

  final String route;

  const NamedRoutes(this.route);
}
