library api;

enum Environment {
  debug('http://sfauat.astralpipes.com:8087/api/'),
  staging('http://sfauat.astralpipes.com:8087/api/'),
  live('http://sfauat.astralpipes.com:8087/api/');

  final String value;

  const Environment(this.value);
}

String baseUrl = Environment.debug.value;

class ApiConstants {
  static const String authentication = 'Authentication/';
  static const String common = 'Common/';
  static const String user = 'User/';

  static const String login = '${user}UserLoginProcess';
  static const String checkServerStatus = '${common}CheckServerStatus';
  static const String getAllSetting = '${common}GetAllSetting';
  static const String generateJWToken = '${authentication}GenerateJWTToken';
}
