import 'dart:convert';
import 'package:http/http.dart';
class Networlhelper{
  Networlhelper(this.url);
  final String url;

  Future getdata()async{
    Response response= await get(Uri.parse(url));
    var data= response.body;
    return jsonDecode(data);
  }
}