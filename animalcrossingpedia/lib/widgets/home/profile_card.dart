import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  static const routeName = '/profile-villager';

  @override
  State<ProfileCard> createState() => ProfileCardState();
}

class ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
  final villager = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Center(
          child: Image.asset(
            './assets/logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Color(villager['colore_carta']),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            left: 0,
            right: 0,
            child: Center(
              child: Image.network(
                villager['img_profilo'],
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'casetta',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.all_out,
                color: Colors.white,
              ),
              label: 'pesciolino'),
        ],
      ),
    );
  }
}
