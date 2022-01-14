import 'package:http/http.dart' as http;
import 'package:personal_finance_app/services/setUrl.dart';

class AuthService {
  static Future<http.StreamedResponse> login(
    String email, String password
  ) async {
    var request = http.MultipartRequest('POST', setUrl.getUri('/auth'));
    request.fields.addAll({
      'username': email,
      'password': password
    });
    return await request.send();
  }
}