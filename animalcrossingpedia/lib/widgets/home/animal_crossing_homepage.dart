import 'package:animalcrossingpedia/widgets/home/homepage_content.dart';
import 'package:animalcrossingpedia/widgets/home/profile_card.dart';
import 'package:flutter/material.dart';

class AnimalCrossingHomePage extends StatefulWidget {
  final List<dynamic> villagersList;

  const AnimalCrossingHomePage({required this.villagersList});

  @override
  State<AnimalCrossingHomePage> createState() => AnimalCrossingHomePageState();
}

class AnimalCrossingHomePageState extends State<AnimalCrossingHomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.villagersList.length,
      itemBuilder: (context, index) {
        // padding per
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          // costruzione della singola carta con elevazione 5, colore di background preso dall'api
          child: GestureDetector(
            onTap: () => {Navigator.of(context).pushNamed(ProfileCard.routeName, arguments: widget.villagersList[index])},
            child: Card(
              elevation: 5,
              color: Color(widget.villagersList[index]['colore_carta']),
              // padding esterno (la distanza fra i margini dello schermo e le schede)
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                // Sizebox definisce la grandezza della row
                child: SizedBox(
                  height: 65,
                  // questa è la riga all'interno della carta, che conterrà le varie informazioni
                  child: HomePageContent(villagersList: widget.villagersList, index: index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
