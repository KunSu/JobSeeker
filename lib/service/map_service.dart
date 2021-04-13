import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:jobseeker/models/models.dart';

class MapService {
  Future<List<Result>> getNearBySearch({@required searchTerm}) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=37.395389,-121.868306&radius=1500&type=$searchTerm&key=${env['GOOGLE_CLOUD_API_KEY']}';

    print(url);
    var response = await get(url);
    var body = json.decode(response.body);

    List<Result> nearByResults = [];
    if (response.statusCode == 200) {
      final results = body['results'] as List;
      for (final result in results) {
        nearByResults.add(Result.fromJson(result));
      }
    } else {
      // TODO: error handle
      throw body['error_message'];
    }

    return nearByResults;
  }
}
