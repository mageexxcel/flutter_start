import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/services/index.dart';

class AMCService {

  static Future<List<AMC>> getAMCList() async {
    final response =
        await http.get('$API_URL/api/amc/?format=json');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List amcs = json.decode(response.body);
      return amcs.map((ele) => new AMC.fromJson(ele)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Fund>> getFunds(AMC amc,
      {String category = "", String subCategory = ""}) async {
    var response;
    if (category.length > 0 && subCategory.length > 0) {
      response = await http.get(
          "$API_URL/api/funds/scheme/${amc.id}/$category/$subCategory/?format=json");
    } else if (category.length > 0) {
      response = await http.get(
          "$API_URL/api/funds/scheme/${amc.id}/$category/?format=json");
    } else {
      response = await http.get(
          "$API_URL/api/funds/scheme/${amc.id}/?format=json");
    }

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List funds = json.decode(response.body);
      return funds.map((ele) => new Fund.fromJson(ele)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<String>> getFundCategoryFilter() async {
    final response = await http
        .get("$API_URL/api/funds/category?format=json");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List filters = json.decode(response.body);
      return filters.map((ele) => ele.toString()).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<String>> getFundSubCategoryFilter(String category) async {
    final response = await http.get(
        "$API_URL/api/funds/subcategory/$category?format=json");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List filters = json.decode(response.body);
      return filters.map((ele) => ele.toString()).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
