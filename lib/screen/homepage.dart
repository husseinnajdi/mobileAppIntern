import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/productprovider.dart';
import '../widget/categorie.dart';
import '../widget/product.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> images = [
    'assets/swipper/swiper1.jpg',
    'assets/swipper/swiper2.jpg',
    'assets/swipper/swiper3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final deals = context.watch<ProductProvider>().deals;
    final products = context.watch<ProductProvider>().products;
    print('geeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee width=== ${width}');
    print('geeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee height==== ${height}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 114, 178, 230),
        title: Container(
          height: height==360? height * 0.1: height * 0.04,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height==360? height * 0.5: height * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Swiper(
                  autoplay: true,
                  itemCount: images.length,
                  itemBuilder: (context, index) =>
                      Image.asset(images[index], fit: BoxFit.fill),
                ),
              ),
            ),

             SizedBox(height: height * 0.02),

            const Text(
              'Top Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 114, 178, 230),
              ),
            ),

            SizedBox(height: height * 0.01),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:  [
                  Categorie(
                    title: 'Fruits',
                    image: 'assets/categories/fruit.png',
                  ),
                  SizedBox(width: width==812? width* 0.07:width*0.03),
                  Categorie(
                    title: 'Vegetables',
                    image: 'assets/categories/Vegetables.png',
                  ),
                  SizedBox(width: width==812? width* 0.07:width*0.03),
                  Categorie(title: 'Milk', image: 'assets/categories/milk.png'),
                  SizedBox(width: width==812? width* 0.07:width*0.03),
                  Categorie(
                    title: 'Bakery',
                    image: 'assets/categories/bakery.png',
                  ),
                  SizedBox(width: width==812? width* 0.07:width*0.03),
                  Categorie(title: 'Meat', image: 'assets/categories/meat.png'),
                  SizedBox(width: width==812? width* 0.07:width*0.03),
                  Categorie(
                    title: 'Snacks',
                    image: 'assets/categories/snacks.png',
                  ),
                  SizedBox(width: width==812? width* 0.07:width*0.03),
                  Categorie(
                    title: 'Drinks',
                    image: 'assets/categories/drinks.png',
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Great Deals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 114, 178, 230),
                  ),
                ),
                Text(
                  "view all",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 114, 178, 230),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.01),
            SizedBox(
              height: height==360? height * 0.55: height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deals.length,
                itemBuilder: (context, index) {
                  final product = deals[index];
                  return Padding(
                    padding:  EdgeInsets.only(right: width==812? 16:12),
                    child: Product(
                      title: product.title,
                      image: product.image,
                      description: product.description,
                      price: product.price,
                      dealprice: product.dealprice,
                      hasdeal: product.hasdeal,
                      category: product.category,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Back In Stock',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 114, 178, 230),
                  ),
                ),
                Text(
                  "view all",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 114, 178, 230),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.01),
            SizedBox(
              height: height==360? height * 0.55: height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding:  EdgeInsets.only(right: width==812? 16:12),
                    child: Product(
                      title: product.title,
                      image: product.image,
                      description: product.description,
                      price: product.price,
                      dealprice: product.dealprice,
                      hasdeal: product.hasdeal,
                      category: product.category,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
