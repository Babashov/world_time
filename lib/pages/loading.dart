import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: "Baku",flag: 'assets/az.png',url: 'Asia/Baku');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'url':instance.url,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitSpinningCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
