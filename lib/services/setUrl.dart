import 'package:flutter_dotenv/flutter_dotenv.dart';

bool ssl() {
  return dotenv.env['SSL']!.toLowerCase() == 'true';
}

class SetUrlHelper {
  Function uriFunction =  ssl() ? Uri.https : Uri.http;

  Uri getUri(String path, {Map<String, String> params = const {}}) {
    return uriFunction(dotenv.env['API'], path, params);
  }
}

SetUrlHelper setUrl = SetUrlHelper();