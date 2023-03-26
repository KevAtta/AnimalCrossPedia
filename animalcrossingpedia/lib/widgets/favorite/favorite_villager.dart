import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_villagers.dart';

class FavoriteVillagers extends StatelessWidget {
  const FavoriteVillagers({super.key});
  static const routeName = '/favoriteVillagers';

  @override
  Widget build(BuildContext context) {
    final villagers = Provider.of<GetDataVillagers>(context);
    final villager = villagers.favoriteVillagers;

    return ListView.builder(
      itemCount: villager.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Card(
              elevation: 5,
              color: Color(villager[index]['colore_carta']),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                child: SizedBox(
                  height: 65,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              '#${villager[index]['id']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: villager[index]
                                          ['colore_carta'] ==
                                      0xFFFFFFFF
                                  ? Colors.amber
                                  : Colors.white,
                              child: Image.network(
                                villager[index]['img_icona'],
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                villager[index]['nome'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                villager[index]['birthday-string'],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Consumer<GetDataVillagers>(
                builder: (ctx, villagerFav, child) => IconButton(
                  icon: villager[index]['favoriti']
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border),
                  color: Colors.amber,
                  onPressed: () => {
                    villagerFav.addVillagerToFavorite(villager[index])
                  },
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
