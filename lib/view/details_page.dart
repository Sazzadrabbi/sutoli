import 'package:flutter/material.dart';
import 'package:sutoli/view/transaction_page.dart';

import '../model/product.dart';

class detailsPage extends StatefulWidget {
  static const String routename = 'detailsPage';
  const detailsPage({super.key});

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text('Product Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              products[0].image,
            ),
          ),
          Text(products[0].title),
          const Text('\$234'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              products[0].description,
              textAlign: TextAlign.justify,
            ),
          ),
          Center(
            child: InkWell(
              onTap: () async {
                Navigator.pushNamed(context, transactionPage.routename);
              },
              child: Container(
                width: 320.0,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0.0, 20.0),
                        blurRadius: 30.0,
                        color: Colors.black12),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 220.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                            bottomRight: Radius.circular(200.0)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Purchase',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Icon(
                      Icons.shopping_bag_rounded,
                      size: 30.0,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
