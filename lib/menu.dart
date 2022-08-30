import 'package:flutter/material.dart';
import 'model/user_Model.dart';
import 'bdd/mysql.dart';
import 'package:intl/intl.dart';
import 'package:favorite_button/favorite_button.dart';
import 'details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            allRecette(0),
          ],
        ),
      ),
    );
  }

  Column recette(String name, String imagePath, double width) {

    return Column(

        children: [
        GestureDetector(
        onTap: () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(title: name,)),
        );
      });
    },
         child: Card(

            margin: const EdgeInsets.only(right: 8),
            /*child: Image.asset(
              imagePath,
              width:300,
              height: 100,
              fit: BoxFit.cover,

            ),*/
            child: Row(
              children: [
                Image.asset(
                imagePath,
                width:300,
                height: 100,
                fit: BoxFit.cover,

              ),
                FavoriteButton(
                  isFavorite: false,
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
                  },
                ),

              ],
            ),

          ),
        ),
          Text(name),
        ]
    );
  }

  Column allRecette(double width) {

    Map<String, String> listRecette = {
      "Fondant au chocolat": "images/fondant.jpg",
      "Tarte aux fraises": "images/tarte_aux_fraises.jpg",
      "Tarte aux pommes": "images/tarte_aux_pommes.jfif",
    };

    List<Widget> addList = [] ;
    listRecette.forEach((a, b){ addList.add(recette(a, b, width));});

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      addList,
    );
  }

}