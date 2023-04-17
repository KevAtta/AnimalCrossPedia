import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import '../utils/costants.dart' as constants;

class GetDataMusic extends ChangeNotifier {
  var _musicList = [];
  AudioPlayer player = AudioPlayer();

  Future<void> fetchMusic() async {
     // Crea un'istanza di FlutterSecureStorage per accedere ai dati sicuri
    const storage = FlutterSecureStorage();

    // Controlla se il dato è già stato salvato in locale
    final savedData = await storage.read(key: 'music');

    // Se il dato è già stato salvato, esce dalla funzione senza fare nulla
    if (savedData != null) {
      _musicList = jsonDecode(savedData);
      notifyListeners();
      return;
    }
    
    try{
      final response = await http.get(Uri.parse(constants.musicApiQuery));
      final data = jsonDecode(response.body);
      final music = data.values.toList();

      music.map((e) => _musicList.add({
              'id': e['id'],
              'nomeMusica': e['file-name'],
              'img': e['image_uri'],
              'song': e['music_uri'],
              'isPlaying': false
            })).toList();

      await storage.write(key: 'music', value: jsonEncode(_musicList));
      notifyListeners();
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }
  }

  List<dynamic> get musicList => [..._musicList];

   playPauseSong(String songToPlay, int id) async {
    await player.setUrl(songToPlay);

    if (musicList[id -1]['isPlaying']) {
      musicList[id -1]['isPlaying'] = false;
      player.pause();
      notifyListeners();
    } else {    
      musicList[id -1]['isPlaying'] = true;
      player.play();
      notifyListeners();
    }
  }
}