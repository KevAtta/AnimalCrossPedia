import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  final List<dynamic> villagersList;
  final int index;

  HomePageContent({required this.villagersList, required this.index});

  @override
  State<HomePageContent> createState() => HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                '#${widget.villagersList[widget.index]['id']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: widget.villagersList[widget.index]
                            ['colore_carta'] ==
                        0xFFFFFFFF
                    ? Colors.amber
                    : Colors.white,
                child: Image.network(
                  widget.villagersList[widget.index]['img_icona'],
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
        // l'avatar con uno stile da immagine del profilo
        // altre informazioni come nome e il giorno di nascita incolonnate
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.villagersList[widget.index]['nome'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(width: 15),
                Text(
                  widget.villagersList[widget.index]['birthday-string'],
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        // infine un icona per indicare che l'oggetto è cliccabile
        const Icon(Icons.arrow_forward_ios_rounded)
      ],
    );
  }
}
