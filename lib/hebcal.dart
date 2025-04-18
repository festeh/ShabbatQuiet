import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dao.dart';

Future<HebcalOutput> callHebcal() async {
  try {
    final url = Uri.parse("https://www.hebcal.com/shabbat?cfg=json&geonameid=2950159&M=on");
    final response = await http.get(url);
    print("response status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      // Handle successful response
      return HebcalOutput.fromJson(jsonDecode(response.body));

    } else {
      // Handle error response
      final message = 'HTTP request failed with status: ${response.statusCode}';
      print(message);
      throw Exception(message);
    }
  } catch (e) {
    print("Could not get Hebcal data: $e");
    rethrow;
  }
}