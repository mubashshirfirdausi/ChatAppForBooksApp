import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Backend {
  static Future<List> getChatData() async {
    Uri url = Uri.parse('https://demo1779595.mockable.io/companies');
    Response response = await http.post(url, body: 'companies');
    Map extractedData = json.decode(response.body);
    return extractedData['companiesList'];
  }
}
