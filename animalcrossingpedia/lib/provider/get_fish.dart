import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDataFish extends ChangeNotifier {
  final baseUrl = 'https://acnhapi.com/v1/fish';
  final _fishList = [];

  Future<void> fetchFish() async {

    try{
      final response = await http.get(Uri.parse(baseUrl));
      final data = jsonDecode(response.body);
      final fishes = data.values.toList();

      fishes.map((e) => _fishList.add({
              'id': e['id'],
              'nome': e['name']['name-EUit'],
              'luogo': e['availability']['location'],
              'rarita': e['availability']['rarity'],
              'prezzo': e['price'],
              'icona': e['icon_uri'],
            })).toList();

      notifyListeners();
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }
  }

  List<dynamic> get fishList => [..._fishList];
}