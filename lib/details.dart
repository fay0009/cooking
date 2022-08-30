import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        border: Border.all(
                      color: Colors.black,
                        width: 2,
                      ),
                      ),

                      child: Column(
                        children: [
                          Text('Etape $i', style: TextStyle(fontSize: 16.0),),
                          Text('Description de l\'étape $i'),
                        ],
                      ),
                  );
                },
              );
            }).toList(),
          ),
      ),
    );
  }


}