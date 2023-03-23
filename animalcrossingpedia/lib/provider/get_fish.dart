import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class GetDataFish extends ChangeNotifier {
  final baseUrl = 'https://acnhapi.com/v1/fish';
  var _fishList = [];

  Future<void> fetchFish() async {
    // Crea un'istanza di FlutterSecureStorage per accedere ai dati sicuri
    const storage = FlutterSecureStorage();

    // Controlla se il dato è già stato salvato in locale
    final savedData = await storage.read(key: 'fish');

    // Se il dato è già stato salvato, esce dalla funzione senza fare nulla
    if (savedData != null) {
      _fishList = jsonDecode(savedData);
      notifyListeners();
      return;
    }

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

      await storage.write(key: 'fish', value: jsonEncode(_fishList));
      notifyListeners();
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }
  }

  List<dynamic> get fishList => [..._fishList];
}