import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/screens/update_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  ProductModel product;
  int count;
  CustomCard({super.key, required this.product, required this.count});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  IconData icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 12,
                  offset: Offset(2, 2),
                  spreadRadius: 5,
                  color: Color.fromARGB(186, 240, 239, 239))
            ]),
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.title.substring(0, 6),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${widget.product.price}',
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF131313)),
                        ),
                        IconButton(
                          icon: Icon(icon, color: Colors.red),
                          onPressed: () {
                            if (icon == Icons.favorite) {
                              icon = Icons.favorite_border;
                            } else {
                              icon = Icons.favorite;
                              widget.count++;
                            }
                            setState(() {});
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            height: 110,
            width: 100,
            top: -60,
            right: 20,
            child: Image.network(widget.product.image),
          ),
        ],
      ),
    );
  }
}
