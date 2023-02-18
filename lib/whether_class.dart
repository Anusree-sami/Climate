import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_whetherapp/whether_model.dart';

class WhetherData{

  // bcf27e6a70f94257b66100231231002
  // 4b34300b51184239b2881530231801
  Future<Whether> getWhetherData(String place) async{
 try{
   /*final queryParameters={
     'key':'bcf27e6a70f94257b66100231231002',
     'q`':place,
   };*/
   // final uri=Uri.http('api.weatherapi.com','/v1/current.json ',queryParameters);
   // final response=await http.get(uri);
   final url = 'http://api.weatherapi.com/v1/current.json?key=bcf27e6a70f94257b66100231231002&q=London&aqi=no';
   final response=await http.get(Uri.parse(url));

   if(response.statusCode==200){
     return Whether.fromJson(jsonDecode(response.body));
   }
   else{
     throw Exception("Can not get Weather");
   }
 }
 catch(e){
   rethrow;
 }
  }
}