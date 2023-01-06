import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Categories(
              image_location: 'images/Icon_blazer.png',
              image_caption: 'Blazers',
            ),
            Categories(
              image_location: 'images/Icon_dress.png',
              image_caption: 'Dresses',
            ),
            Categories(
              image_location: 'images/Icon_shirt2.png',
              image_caption: 'Shirts',
            ),
            Categories(
              image_location: 'images/Icon_short.png',
              image_caption: 'Shorts',
            ),
            Categories(
              image_location: 'images/Icon_pants2.png',
              image_caption: 'Trousers',
            ),
            Categories(
              image_location: 'images/Icon_tie.png',
              image_caption: 'Ties',
            ),
            Categories(
              image_location: 'images/Icon_skirt2.png',
              image_caption: 'Skirts',
            ),
            Categories(
              image_location: 'images/Icon_socks2.png',
              image_caption: 'Socks',
            ),
            Categories(
              image_location: 'images/Icon_sweater2.png',
              image_caption: 'Sweaters',
            ),
          ],
        ));
  }
}

class Categories extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Categories({
    this.image_location = '',
    this.image_caption = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 90.0,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            title: Image.asset(
              image_location,
              height: 40.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child:
                    Text(image_caption, style: TextStyle(color: Colors.amber))),
          ),
        ),
      ),
    );
  }
}
