import 'package:flutter/material.dart';
import 'package:flutter_application_commerce/pages/product_details.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/blazer.jpg",
      "old_price": 120.0,
      "price": 85.0,
    },
    {
      "name": "Dress",
      "picture": "images/dress.jpg",
      "old_price": 120.0,
      "price": 85.0,
    },
    {
      "name": "Trouser",
      "picture": "images/Trouser.jpg",
      "old_price": 140.0,
      "price": 90.0,
    },
    {
      "name": "Shirt",
      "picture": "images/Shirt1.jpg",
      "old_price": 125.0,
      "price": 80.0,
    },
    {
      "name": "Short",
      "picture": "images/short.jpg",
      "old_price": 150.0,
      "price": 100.0,
    },
    {
      "name": "Skirt",
      "picture": "images/Skirt.png",
      "old_price": 120.0,
      "price": 85.0,
    },
    {
      "name": "Sweater",
      "picture": "images/Sweater.jpg",
      "old_price": 100.0,
      "price": 75.0,
    },
    {
      "name": "Tie",
      "picture": "images/Tie2.jpg",
      "old_price": 105.0,
      "price": 90.0,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            product_name: product_list[index]['name'],
            product_image: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_image;
  final product_old_price;
  final product_price;

  Single_prod({
    this.product_name,
    this.product_image,
    this.product_old_price,
    this.product_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: product_name,
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              //Passing the values of the product to the product details page
              builder: (context) => new ProductDetails(
                    product_detail_name: product_name,
                    product_detail_price: product_price,
                    product_detail_old_price: product_old_price,
                    product_detail_image: product_image,
                  ))),
          child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\$ $product_price",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800)),
                  subtitle: Text(
                    "\$ $product_old_price",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(
                product_image,
                fit: BoxFit.cover,
              )),
        ),
      ),
    ));
  }
}
