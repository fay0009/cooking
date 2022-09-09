import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'menu.dart';
import 'model/user_Model.dart';
import 'bdd/mysql.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    double? _ratingValue;
    List<String> detailsList = ['Liste des ingrédients : \n-Chocolat\n-Beurre\n-Farine' ,widget.title,widget.title,widget.title];
    int numberStep = 4;

    return Scaffold (
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar (
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:

          CarouselSlider.builder(
            itemCount: numberStep,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,

                  ),
                  child: Column(
                    children: [
                      Text('Etape$itemIndex', style: const TextStyle(fontSize: 16.0),),
                      Text('Description de l\'étape $itemIndex'),
                      Text(detailsList[itemIndex],textAlign: TextAlign.center,),
                      const Spacer(),
                      const Text('Image'),
                      RaisedButton(
                        onPressed: () {
                          startTimer();
                        },
                        child: const Text("start"),
                      ),
                      Text("$_start"),
                     /* RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),*/
                      RatingBar(
                          initialRating: 3,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full: const Icon(Icons.star, color: Colors.orange),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.orange,
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: Colors.orange,
                              )),
                          onRatingUpdate: (value) {
                            setState(() {
                              _ratingValue = value;
                            });
                          }),
                    ],
                  ),
                ), options: CarouselOptions(height: 600.0),
          )
      ),
    );
  }

}
