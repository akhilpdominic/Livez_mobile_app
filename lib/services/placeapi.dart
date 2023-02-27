/*import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class locationService
{
  final String key="AIzaSyB2BUtqvTMxwbRD1zwE6G3Tbu_tuY3twZ8";
  Future<String> getPlaceId (String input)
  async {
    final String url="https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=&key";

    var response=await http.get(Uri.parse(url));

    var json=convert.jsonDecode(response.body);
  }
}*/