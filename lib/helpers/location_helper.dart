
import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY ='AIzaSyAIf6YMEUbiZgl5EeeBMZFdYzj5Nr6YVRg';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude,double longitude}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async{
    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&amp;key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    if (response != "failed" && json.decode(response.body)['results'].isNotEmpty ) {
      return json.decode(response.body)['results'][0]['formatted_address'];
    }
    return 'UnNamed Address';
  }
}