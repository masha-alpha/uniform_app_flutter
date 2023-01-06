import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_old_price;
  final product_detail_image;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_price,
      this.product_detail_old_price,
      this.product_detail_image});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uniform Shop'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_image),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                      leading: new Text(
                        widget.product_detail_name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                              child:
                                  new Text("${widget.product_detail_old_price}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ))),
                          Expanded(
                              child: new Text("${widget.product_detail_price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)))
                        ],
                      )),
                )),
          ),
          //================The First Buttons=========
          Row(
            children: <Widget>[
              //========the size button=================
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(child: Text("Size")),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
              //========the size button=================
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(child: Text("Color")),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
              //========the size button=================
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(child: Text("Qty")),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
            ],
          ),
          //================The Second  Buttons=========
          Row(
            children: <Widget>[
              //========the size button=================
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.amber,
                    textColor: Colors.white,
                    child: Text("Buy Now")),
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.amber,
                  onPressed: () {}),

              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.amber,
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
