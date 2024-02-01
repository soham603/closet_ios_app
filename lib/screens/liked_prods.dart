import 'package:flutter/material.dart';
import 'package:intern_asgn_persist/models/saved_prod.dart';
import 'package:provider/provider.dart';

class SavedProducts extends StatelessWidget {
  const SavedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var savedProductsModel = Provider.of<SavedProductsModel>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Padding(
          padding: EdgeInsets.only(left: 2, top: 10),
          child: Text(
            'Saved Outfits',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of items in a row
          crossAxisSpacing: 1.0, // Set the spacing between items horizontally
          mainAxisSpacing: 1.0, // Set the spacing between items vertically
          childAspectRatio: 3 / 4, // Set the height to width ratio of items
        ),
        itemCount: savedProductsModel.savedProducts.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> product =
              savedProductsModel.savedProducts[index];
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
                        product['image'],
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
                                product['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(product['description'],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              savedProductsModel
                                  .removeFromSavedProducts(product);
                            },
                            icon: Icon(Icons.favorite, color: Colors.red,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
