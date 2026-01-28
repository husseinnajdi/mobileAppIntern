import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobileappintern/model/product.dart';
import 'package:mobileappintern/provider/categoriesprovider.dart';
import 'package:mobileappintern/provider/swipperprovider.dart';
import 'package:provider/provider.dart';
import '../../provider/productprovider.dart';
import '../../widget/categorie.dart';
import '../../widget/product.dart' as productwidget;

class Homepage extends StatefulWidget {
  static const String routeName = '/homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool issearch = false;
  late FocusNode searchfocusnode;
  late TextEditingController searchcontroller;
  late Swipperprovider swipperprovider;
  late ProductProvider productProvider;
  late Categoriesprovider cactegoriesprovider;

  List<Product> productlistsearch = [];
  @override
  void initState() {
    super.initState();
    searchfocusnode = FocusNode();
    searchcontroller = TextEditingController();
    cactegoriesprovider = Provider.of<Categoriesprovider>(
      context,
      listen: false,
    );
    cactegoriesprovider.loadcategories();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.loadProducts();
    swipperprovider = Provider.of<Swipperprovider>(context, listen: false);
    swipperprovider.loadswipper();
  }

  @override
  void dispose() {
    super.dispose();
    searchfocusnode.dispose();
    searchcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final deals = context.watch<ProductProvider>().deals;
    final products = context.watch<ProductProvider>().products;
    final swiper = context.watch<Swipperprovider>().swipper;
    final categorie = context.watch<Categoriesprovider>().categories;
    return GestureDetector(
      onTap: () {
        setState(() {
          searchfocusnode.unfocus();
          issearch = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 114, 178, 230),
          title: Container(
            height: height > 320 && height < 540 ? height * 0.1 : height * 0.04,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              focusNode: searchfocusnode,
              controller: searchcontroller,
              onChanged: (value) {
                setState(() {
                  productlistsearch = ProductProvider()
                      .searchQuery(
                        searchtext: searchcontroller.text,
                        passedlist: products,
                      )
                      .cast<Product>();
                });
              },
              onTap: () {
                setState(() {
                  issearch = true;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        body: issearch
            ? productlistsearch.isEmpty
                  ? Center(child: Text('Search Results Here'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: productlistsearch.length,
                      itemBuilder: (context, index) {
                        final product = productlistsearch[index];
                        return productwidget.Product(
                          id: product.id,
                          title: product.title,
                          image: product.image,
                          description: product.description,
                          price: product.price,
                          dealprice: product.dealprice,
                          hasdeal: product.hasdeal,
                          category: product.category,
                        );
                      },
                    )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height > 320 && height < 540
                          ? height * 0.5
                          : height * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Swiper(
                          viewportFraction: 0.8,
                          scale: 0.9,
                          autoplay: true,
                          itemCount: swiper.length,
                          itemBuilder: (context, index) => Image.asset(
                            swiper[index].image,
                            fit: BoxFit.fill,
                          ),
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.grey,
                              activeColor: Color.fromARGB(255, 255, 4, 4),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    const Text(
                      'Top Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 114, 178, 230),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    SizedBox(
                      height: height > 320 && height < 540
                          ? height * 0.3
                          : height * 0.13,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categorie.length,
                        itemBuilder: (context, index) {
                          final categori = categorie[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: width == 812 ? 50 : 25,
                            ),
                            child: CategorieCard(
                              title: categori.name,
                              image: categori.image,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.03),
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
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/viewall',arguments: {'hasdeals': true} );
                          },
                          child: const Text(
                            "view all",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:  Color.fromARGB(255, 114, 178, 230),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.02),
                    SizedBox(
                      height: height > 320 && height < 540
                          ? height * 0.55
                          : height * 0.23,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: deals.length,
                        itemBuilder: (context, index) {
                          final product = deals[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: width == 812 ? 16 : 12,
                            ),
                            child: productwidget.Product(
                              id: product.id,
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
                    SizedBox(height: height * 0.04),
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
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/viewall',arguments: {'hasdeals': false} );
                          },
                          child: const Text(
                            "view all",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 114, 178, 230),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),
                    SizedBox(
                      height: height > 320 && height < 540
                          ? height * 0.55
                          : height * 0.23,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: width == 812 ? 16 : 12,
                            ),
                            child: productwidget.Product(
                              id: product.id,
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
      ),
    );
  }
}
