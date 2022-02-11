import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String? location; // location name for UI
  late String time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for the endpoint api
  late bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try {
      // get data
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //  get properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //  create DateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time  = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      // print(time);
    }
    catch(e){
      time = 'Time could\'t get';
      print('Catch error is: $e');
    }
  }

}