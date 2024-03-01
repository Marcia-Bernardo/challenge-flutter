import 'package:flutter/material.dart';
import 'package:shopify/utils/utils.dart';

import 'ProductListPage.dart';
import 'model/Product.dart';
import 'network/request.dart';

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagList();
}

class _TagList extends State<TagList> {
  late List<Product> futureProduct;
  late List<String> tags;

  @override
  void initState() {
    super.initState();
    Request.getProducts().then((value) => {
          futureProduct = value,
          setState(() {
            tags = Utils.getTags(value);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shopify Shop'),
      ),
      body: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tags.elementAt(index)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductList(
                    products: futureProduct,
                    title: tags.elementAt(index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
