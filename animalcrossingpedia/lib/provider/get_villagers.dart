import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDataVillagers extends ChangeNotifier {
  final baseUrl = 'https://acnhapi.com/v1/villagers/';
  final _villagerList = [];
  final _favoriteVillagers = [];
  
  Future<void> fetchVillagers() async {

    int getColorFromHex(String hexColor) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      return int.parse(hexColor, radix: 16);
    }

    try {
      final response = await http.get(Uri.parse(baseUrl));
      final data = jsonDecode(response.body);
      final villagers = data.values.toList();

      villagers.map((e) => _villagerList.add({
              'id': e['id'],
              'nome': e['name']['name-USen'],
              'genere': e['gender'],
              'img_icona': e['icon_uri'],
              'img_profilo': e['image_uri'],
              'hobby': e['hobby'],
              'frase': e['saying'],
              'birthday': e['birthday'],
              'birthday-string': e['birthday-string'],
              'colore_carta': getColorFromHex(e['bubble-color']),
              'specie': e['species'],
              'favoriti': false,
            })).toList();

    notifyListeners();
    } catch (e) {
      // inserito l'ignore qui sotto per evitare il warning della funzione print()
      // ignore: avoid_print
      print(e.toString());
    }
  }

  List<dynamic> get villagerList => [..._villagerList];

  List<dynamic> get favoriteVillagers => [..._favoriteVillagers]; 

  void addVillagerToFavorite(int villagerId) {
    // prendo l'indice del villager selezionato
    var indexVillagerSelected = _villagerList.indexWhere((element) => element['id'] == villagerId);
    
    // se l'indice esiste, quindi è maggiore di 0
    if(indexVillagerSelected >= 0){
      // se il campo 'favoriti' del villager è true
      if(_villagerList[indexVillagerSelected]['favoriti']){
        _villagerList[indexVillagerSelected]['favoriti'] = false;
         _favoriteVillagers.remove(_villagerList[indexVillagerSelected]);
      }else{
        _villagerList[indexVillagerSelected]['favoriti'] = true;
        _favoriteVillagers.add(_villagerList[indexVillagerSelected]);
      }
    }

    notifyListeners();
  }
}