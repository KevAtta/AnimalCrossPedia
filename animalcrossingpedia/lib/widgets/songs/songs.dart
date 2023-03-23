import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_music.dart';
import 'package:just_audio/just_audio.dart';

class Songs extends StatefulWidget {
  const Songs({super.key});
  static const routeName = '/songs';

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  bool isPlaying = true;
  var player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final songs = Provider.of<GetDataMusic>(context);
    final songsList = songs.musicList;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: songsList.map((song) => 
            GestureDetector(
              onTap: ()async{ await songs.playPauseSong(song['song'], song['id']);},
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: NetworkImage(song['img']), opacity: 45)),
                child: Center(
                  child: 
                    Text(song['nomeMusica'], 
                    style: TextStyle(color: Colors.white, 
                                     fontSize: 10, 
                                     background: Paint()
                                     ..color = Colors.green
                                     ..strokeWidth = 20
                                     ..strokeJoin = StrokeJoin.round
                                     ..strokeCap = StrokeCap.round
                                     ..style = PaintingStyle.stroke)
                    ),
                ),
              ),
            )
          ).toList(),
        ),
    );
  }
}