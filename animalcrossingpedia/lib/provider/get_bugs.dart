import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDataBugs extends ChangeNotifier {
  final baseUrl = 'https://acnhapi.com/v1/bugs/';
  final _bugsList = [];

  Future<void> fetchBugs() async {
    try{
      final response = await http.get(Uri.parse(baseUrl));
      final data = jsonDecode(response.body);
      final bugs = data.values.toList();

      bugs.map((e) => _bugsList.add({
              'id': e['id'],
              'nome': e['name']['name-EUit'],
              'luogo': e['availability']['location'],
              'rarita': e['availability']['rarity'],
              'orario': e['availability']['time'],
              'prezzo': e['price'],
              'icona': e['icon_uri'],
            })).toList();

      notifyListeners();
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }
  }

  List<dynamic> get bugsList => [..._bugsList];
}