import 'package:ayaomrani/components/timeline_title.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  MyTimeLine(
                    isFirst: true,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER Placed"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER SHIPPED"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER DELIVERED"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER Placed"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER SHIPPED"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: true,
                    isPast: false,
                    eventCard: Text("ORDER DELIVERED"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action à effectuer lors du clic sur le bouton de carte
          // Naviguer vers l'écran de la carte, par exemple
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(), // Remplacez par le nom de votre écran de carte
            ),
          );
        },
        child: Icon(Icons.map),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

// Exemple d'écran de carte (remplacez cela par votre propre écran de carte)
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte'),
      ),
      body: Center(
        child: Text('Contenu de la carte ici'),
      ),
    );
  }
}
