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
  static const String basicToken = 'AB697893-C1BA-453B-8ABC-20EBF899D453-552C411E-0474-4A1F-9A9C-7785BEA5F39B';
  static const String authentication = 'Authentication/';
  static const String common = 'Common/';
  static const String user = 'User/';
  static const String dashboard = 'Dashboard/';

  ///USER
  static const String login = '${user}UserLoginProcess';
  static const String userSetPin = '${user}UserSetPin';
  static const String generateJWToken = '${authentication}GenerateJWTToken';
  static const String logout = '${user}Logout';
  static const String sendOTP = '${user}SendOTP';
  static const String submitUserInfo = '${user}SubmitUserInformation';

  ///COMMON
  static const String checkServerStatus = '${common}CheckServerStatus';
  static const String getAllSetting = '${common}GetAllSetting';

  ///Dashboard
  static const String getDashboard = '${dashboard}GetDashboard';
}
