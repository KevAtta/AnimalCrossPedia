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
    final width = MediaQuery.of(context).size.width;

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
                  height: width < 420 ? 60 : 70,
                  child: ListTile(
                    leading: Image.network(bugsList[index]['icona']),
                    title: Text(
                      "Nome: ${bugsList[index]['nome']}\nRarita: ${bugsList[index]['rarita']}\nOrario: ${bugsList[index]['orario']}",
                      style: TextStyle(fontSize: width < 420 ? 11 : 13),
                    ),
                    subtitle: width < 331
                        ? null
                        : Text(
                            "#${bugsList[index]['id']} - ${bugsList[index]['luogo']}",
                            style: TextStyle(fontSize: width < 420 ? 9 : 10),
                          ),
                    trailing: Column(
                      children: [
                        Image.asset(
                          './assets/icona_portamonete.png',
                          width: width < 420 ? 25 : 29,
                          height: width < 420 ? 25 : 29,
                        ),
                        Text(
                          "Costo: ${bugsList[index]['prezzo']}",
                          style: TextStyle(fontSize: width < 420 ? 12 : 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}