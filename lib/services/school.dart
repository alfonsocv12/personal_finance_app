import 'package:http/http.dart' as http;
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/services/setUrl.dart';

class SchoolService {
  static Future getSchoolDebt() async {
    String token = Global.localStorage.getString("token")!;
    return await http.get(
      setUrl.getUri(''),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );
  } 
}