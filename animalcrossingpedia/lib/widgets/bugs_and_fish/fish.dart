import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_fish.dart';

class Fish extends StatelessWidget {
  const Fish({super.key});
  static const routeName = '/fish';

  @override
  Widget build(BuildContext context) {
    final fishs = Provider.of<GetDataFish>(context);
    final fishsList = fishs.fishList;

    return Scaffold(
     appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Center(
          child: Image.asset(
            './assets/logo2.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: fishsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 5, top: 5),
                child: SizedBox(
                  height: 65,
                  child: ListTile(
                    leading: Image.network(fishsList[index]['icona']),
                    title: Text("Nome: ${fishsList[index]['nome']}\nRarita: ${fishsList[index]['rarita']}"),
                    subtitle: Text("#${fishsList[index]['id']} - Posizione: ${fishsList[index]['luogo']}"),
                    trailing: Column(
                      children: [
                        Image.asset('./assets/icona_portamonete.png', width: 30, height: 30,),
                        Text("Costo: ${fishsList[index]['prezzo']}", style: const TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
    );
  }
}
