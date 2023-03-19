import 'package:flutter/material.dart';
import 'fish.dart';

class FishBugsMenu extends StatelessWidget {
  const FishBugsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Card(
        child: ListTile(
          leading: Image.asset(
            'assets/icona_retino.png',
            height: 35,
            width: 35,
          ),
          title: const Text('Insetti'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            print('ciao');
          },
        ),
      ),
      Card(
        child: ListTile(
          leading: Image.asset(
            'assets/icona_lenza.png',
            height: 35,
            width: 35,
          ),
          title: const Text('Pesci'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.of(context).pushNamed(Fish.routeName);
          },
        ),
      ),
    ]);
  }
}
