import 'dart:convert';

import 'package:festa_task/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //static String baseurl = 'https://randomuser.me/api/';

  static Future<List<Results>> getuserdata(String? gender) async {
    List<Results> results = [];

    try {
      final url = Uri.parse(gender == null
          ? 'https://randomuser.me/api/?results=10'
          : 'https://randomuser.me/api/?gender=$gender?results=10');
      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsondata = jsonDecode(response.body) as Map<String, dynamic>;
        final data = Data.fromJson(jsondata);
        // print('data $data');
        // print(jsondata.toString());
        results = data.results ?? [];
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      print(e);
    }

    return results;
  }
}
