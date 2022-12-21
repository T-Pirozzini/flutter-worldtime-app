import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for the UI
  String time = ""; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    // make the request
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url')
    );
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];

    //create DateTime object
    DateTime now = DateTime.parse(datetime.substring(0,26));

    // set the time property
    time = now.toString();
  }
}


