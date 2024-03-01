import 'package:flutter/material.dart';
import 'package:shopify/model/Product.dart';
import 'package:shopify/utils/utils.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final String title;

  const ProductList({super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    var filter =
        products.where((element) => Utils.compare(element, title)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SizedBox(
        child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (1),
          ),
          itemCount: filter.length,
          itemBuilder: (context, index) {
            var item = filter[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(width: 50, height: 70, item.image),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${item.name.trim()}'),
                        Text("Value: ${item.value}"),
                        Text("Total: ${item.total}"),
                        Text("Tags: ${item.tags}")
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
