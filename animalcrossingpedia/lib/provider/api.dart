import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// constante che contiene l'url per la chiamata all'api
const baseUrl = 'https://acnhapi.com/v1/villagers/';

Future<List<dynamic>> fetchVillagers() async {
  var villagerList = [];

  int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  try {
    final response = await http.get(Uri.parse(baseUrl));
    final data = jsonDecode(response.body);
    final villagers = data.values.toList();

    villagers
        .map((e) => villagerList.add({
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
              'specie': e['species']
            }))
        .toList();

    // print(villagerList);
    return (villagerList);
  } catch (e) {
    // inserito l'ignore qui sotto per evitare il warning della funzione print()
    // ignore: avoid_print
    print(e.toString());
    return [];
  }
}