import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future getUsers() async {
    try {
      http.Response response = await http.get('https://api.github.com/users');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
