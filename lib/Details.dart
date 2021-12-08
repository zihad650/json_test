import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  String id;
  String name;
  String category;
  String imageURL;
  String oldPrice;
  String price;


  Details(this.id, this.name, this.category, this.imageURL, this.oldPrice,
      this.price);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Card(
              elevation: 5,
              child: Image.network(
                widget.imageURL,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(widget.id),
                  Text(widget.name),
                  Text(widget.category),
                  Text(widget.oldPrice),
                  Text(widget.price),
                ],
              ),
            ),

          ),

        ],
      ),
    );
  }
}