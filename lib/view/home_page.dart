import 'package:flutter/material.dart';
import 'package:sutoli/view/transaction_page.dart';

import '../model/product.dart';

class HomePage extends StatefulWidget {
  static const String routename = "HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 50,
                    width: 300,
                    child: const TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) => itemCard(
                      product: products[index],
                      // press: () => Navigator.of(context)
                      //     .pushNamedAndRemoveUntil(transactionPage.routename,
                      //         (Route<dynamic> route) => false),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class itemCard extends StatelessWidget {
  final Product product;
  // final Function press;

  const itemCard({
    Key? key,
    required this.product,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (() {
            Navigator.pushNamed(context, transactionPage.routename);
          }),
          child: Container(
            padding: EdgeInsets.all(10.0),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(products[0].image),
          ),
        ),
        Text(
          products[0].title,
        ),
        Text("\$${product.price}"),
      ],
    );
  }
}
