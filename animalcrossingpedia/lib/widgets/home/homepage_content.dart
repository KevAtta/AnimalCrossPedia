import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  final List<dynamic> villagersList;
  final int index;

  const HomePageContent(
      {super.key, required this.villagersList, required this.index});

  @override
  State<HomePageContent> createState() => HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                '#${widget.villagersList[widget.index]['id']}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width < 360
                        ? 13
                        : width < 420
                            ? 17
                            : 20),
              ),
              CircleAvatar(
                radius: width < 420 ? 30 : 50,
                backgroundColor: widget.villagersList[widget.index]
                            ['colore_carta'] ==
                        0xFFFFFFFF
                    ? Colors.amber
                    : Colors.white,
                child: Image.network(
                  widget.villagersList[widget.index]['img_icona'],
                  width: width < 360
                      ? 30
                      : width < 420
                          ? 35
                          : 40,
                  height: width < 360
                      ? 30
                      : width < 420
                          ? 35
                          : 40,
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width < 360
                          ? 13
                          : width < 420
                              ? 17
                              : 20),
                ),
                const SizedBox(width: 15),
                Text(
                  widget.villagersList[widget.index]['birthday-string'],
                  style: TextStyle(
                      fontSize: width < 360
                          ? 13
                          : width < 420
                              ? 17
                              : 20),
                ),
              ],
            ),
          ],
        ),
        // infine un icona per indicare che l'oggetto è cliccabile
        width < 420
            ? const Text("")
            : const Icon(Icons.arrow_forward_ios_rounded)
      ],
    );
  }
}
