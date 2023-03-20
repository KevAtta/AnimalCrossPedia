import 'package:animalcrossingpedia/widgets/home/homepage_content.dart';
import 'package:animalcrossingpedia/widgets/profile_card/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_villagers.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final villagers = Provider.of<GetDataVillagers>(context);
    final villagerList = villagers.villagerList;

    return ListView.builder(
      itemCount: villagerList.length,
      itemBuilder: (context, index) {
        // padding per
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          // costruzione della singola carta con elevazione 5, colore di background preso dall'api
          child: GestureDetector(
            onTap: () => { Navigator.of(context).pushNamed(ProfileCard.routeName, arguments: villagerList[index]) },
            child: Card(
              elevation: 5,
              color: Color(villagerList[index]['colore_carta']),
              // padding esterno (la distanza fra i margini dello schermo e le schede)
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                // Sizebox definisce la grandezza della row
                child: SizedBox(
                  height: 65,
                  // questa è la riga all'interno della carta, che conterrà le varie informazioni
                  child: HomePageContent(villagersList: villagerList, index: index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
