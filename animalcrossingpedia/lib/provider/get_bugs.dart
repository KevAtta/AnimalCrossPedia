import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../utils/costants.dart' as constants;

class GetDataBugs extends ChangeNotifier {
  var _bugsList = [];

  Future<void> fetchBugs() async {
    // Crea un'istanza di FlutterSecureStorage per accedere ai dati sicuri
    const storage = FlutterSecureStorage();

    // Controlla se il dato è già stato salvato in locale
    final savedData = await storage.read(key: 'bugs');

    // Se il dato è già stato salvato, esce dalla funzione senza fare nulla
    if (savedData != null) {
      _bugsList = jsonDecode(savedData);
      notifyListeners();
      return;
    }
    try{
      final response = await http.get(Uri.parse(constants.bugApiQuery));
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

      await storage.write(key: 'bugs', value: jsonEncode(_bugsList));
      notifyListeners();
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }
  }

  List<dynamic> get bugsList => [..._bugsList];
}