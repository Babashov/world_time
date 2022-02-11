import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // print(data);
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    return Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text('Home',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.fill
              )
          ),
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      if(result != null)
                        {
                          setState(() {
                            data = {
                              'location':result['location'],
                              'flag':result['flag'],
                              'url':result['url'],
                              'time':result['time'],
                              'isDayTime':result['isDayTime']
                            };
                          });
                        }
                      },
                      icon: Icon(Icons.location_city,color: Colors.white,),
                    label: Text(
                      'Choose Location',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),

                    )
                  ),
                  Divider(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      data['location'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 62.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent
                      ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
