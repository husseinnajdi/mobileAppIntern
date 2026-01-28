import 'package:flutter/material.dart';
import 'package:mobileappintern/provider/productprovider.dart';
import 'package:mobileappintern/widget/product.dart' as productwidget;
import 'package:provider/provider.dart';

class ViewAll extends StatefulWidget {
  static const String routeName = '/viewall';
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  late ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String? categorie = args['categorie'];
    final bool hasdeals = args['hasdeals'] ?? false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final products = categorie != null
        ? context.watch<ProductProvider>().getproductsbycategories(
            categorie,
          )
        : hasdeals
        ? context.watch<ProductProvider>().getdeals()
        : context.watch<ProductProvider>().products;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: height > 560 && height < 1080
              ? (width * 0.5) / (height * 0.25)
              : (width * 0.25) / (height * 0.3),
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return productwidget.Product(
            title: product.title,
            image: product.image,
            description: product.description,
            price: product.price,
            hasdeal: product.hasdeal,
            dealprice: product.dealprice,
            category: product.category,
            id: product.id,
          );
        },
      ),
    );
  }
}
