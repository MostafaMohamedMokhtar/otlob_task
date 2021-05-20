import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyCah36NWsvmWh-11sWpueuxGqmFwR0-Ehk';

class LocationHelper {

  static Future<String> getPlaceAddress(
      double latitude, double longitude) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY';
      final response = await http.get(Uri.parse(url));
      print(response.body.toString());
      return json.decode(response.body)['results'][0]['formatted_address'];
    }  catch (e) {
      print(e);
      return '';
    }
    
  }
}