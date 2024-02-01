import 'package:flutter/material.dart';
import 'package:intern_asgn_persist/models/saved_prod.dart';
import 'package:provider/provider.dart';

class DiscoverCards extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final Map<String, dynamic> productData;

  const DiscoverCards({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.productData,
  }) : super(key: key);

  @override
  State<DiscoverCards> createState() {
    return _DiscoverCardsState();
  }
}

class _DiscoverCardsState extends State<DiscoverCards> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var savedProductsModel =
        Provider.of<SavedProductsModel>(context, listen: false);

    return Card(
      elevation: 3,
      child: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });

                        // Access the provider and add/remove the product from saved list
                        if (isPressed) {
                          savedProductsModel
                              .addToSavedProducts(widget.productData);
                        } else {
                          savedProductsModel
                              .removeFromSavedProducts(widget.productData);
                        }
                      },
                      icon: Icon(
                          isPressed ? Icons.favorite : Icons.favorite_outline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
