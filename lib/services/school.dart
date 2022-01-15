import 'package:http/http.dart' as http;
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/services/setUrl.dart';

class SchoolService {
  static Future<http.Response> getSchoolDebt() async {
    String token = Global.localStorage.getString("token")!;
    return await http.get(
      setUrl.getUri('/school_debt/overview/school_debt_database/Chato'),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );
  } 
}