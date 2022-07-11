import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  String quote="";
  String author="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children:[
              Padding(padding: const EdgeInsets.all(10.0),
                child:
                  Text(quote),
                    ),
              Padding(padding: const EdgeInsets.all(10.0),
                child:
                Text(author),
              ),

                  ElevatedButton(onPressed: ()async{
                    var url = Uri.parse('https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                    var response = await http.post(url);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');


                    //parsing the json data
                    var data=jsonDecode(response.body);
                     quote =data["quotes"][0]["text"];
                     author=data["quotes"][0]["author"];
                     setState(() {

                     });

                  },child: Text("show"),),

                ],


      ),
      ),
    );
  }
}
