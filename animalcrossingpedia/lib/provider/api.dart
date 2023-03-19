import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends ChangeNotifier {
  // constante che contiene l'url per la chiamata all'api
  final baseUrl = 'https://acnhapi.com/v1/villagers/';
  final _villagerList = [];
  
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

  // creo una copia della lista di partenza
  List<dynamic> get villagerList => [..._villagerList];

  // creo un array che contterrà solo quelli con il campo favoriti a true
  List<dynamic> get favoriteVillagers { return _villagerList.where((element) => element['favoriti'] == true).toList(); } 

  void addVillagerToFavorite(int villagerId) {
    var idVillagerSelected = _villagerList.indexWhere((element) => element['id'] == villagerId);
    
    if(idVillagerSelected >= 0){
      _villagerList[idVillagerSelected]['favoriti'] = true;

      // Aggiungiamo il villager alla lista dei preferiti, se non è già presente
      if (!favoriteVillagers.contains(_villagerList[villagerId])) {
        favoriteVillagers.add(_villagerList[villagerId]);
      }
    }

    // Notifichiamo tutti i listener (ovvero, i widget che dipendono da questa classe)
    // che i dati sono stati aggiornati
    notifyListeners();
  }
}