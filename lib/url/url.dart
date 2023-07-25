class AppUrl {
  static String baseUrl = 'https://ess.cmsmaju.co.id/api/';
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints{
  final String login = 'v1/login';
  final String register = 'v1/register';
  final String ceknik = 'v1/find-employee';
  final String logout = 'v1/logout';
  final String checkin = 'v1/check_in_out';
  final String checkout = 'v1/check_out';
  final String profile = 'v1/my-profile';
}