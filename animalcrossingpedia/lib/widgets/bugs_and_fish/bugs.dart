import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_bugs.dart';

class Bugs extends StatelessWidget {
  const Bugs({super.key});
  static const routeName = '/bugs';

  @override
  Widget build(BuildContext context) {
    final bugs = Provider.of<GetDataBugs>(context);
    final bugsList = bugs.bugsList;

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
        itemCount: bugsList.length,
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
                    leading: Image.network(bugsList[index]['icona']),
                    title: Text("Nome: ${bugsList[index]['nome']}\nRarita: ${bugsList[index]['rarita']}\nOrario: ${bugsList[index]['orario']}", style: const TextStyle(fontSize: 13),),
                    subtitle: Text("#${bugsList[index]['id']} - ${bugsList[index]['luogo']}", style: const TextStyle(fontSize: 10),),
                    trailing: Column(
                      children: [
                        Image.asset('./assets/icona_portamonete.png', width: 30, height: 30,),
                        Text("Costo: ${bugsList[index]['prezzo']}", style: const TextStyle(fontSize: 15),),
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