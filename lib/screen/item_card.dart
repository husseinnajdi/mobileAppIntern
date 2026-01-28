import 'package:flutter/material.dart';
import 'package:mobileappintern/provider/productprovider.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  static const String routeName = '/ItemCard';
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int qty=0;
  late ProductProvider productProvider;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final product = context.watch<ProductProvider>().getproductbyid(id);
    final categorie=product.category;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(product.description, style: TextStyle(fontSize: 16)),
            SizedBox(
              height: height * 0.4,
              width: width,
              child: Image.asset(product.image, fit: BoxFit.fill),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " \$${product.price.toString()}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Text("Quantity",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    if(qty>0){
                      qty--;
                    }
                  });
                }, icon: Icon(Icons.remove_outlined,size: 40,color:  Color.fromARGB(255, 114, 178, 230),)),
                Text(qty.toString(),style: TextStyle(fontSize: 20),),
                IconButton(onPressed: (){
                  setState(() {
                    qty++;
                  });
                }, icon: Icon(Icons.add_outlined,size: 40,color:  Color.fromARGB(255, 114, 178, 230),)),
              ],
            ),
            if (categorie=="Fruits" || categorie=="Vegetable" || categorie== "Meat")
              Text("quantity in kg",style: TextStyle(fontSize: 16),)
            else if (categorie=="Milk & Dairy" || categorie=="Bakery" || categorie=="Snacks"|| categorie=="Drinks")
              Text("quantity in unite",style: TextStyle(fontSize: 16),)
            

          ],
        ),
      ),
      bottomNavigationBar:SizedBox(
        height: height*0.1,
        child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 114, 178, 230),
                  padding:
                      EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                ),
                onPressed: () {},
                label: Text("Add to Cart",style: TextStyle(color: Colors.white),),
                icon: Icon(Icons.add_shopping_cart,color: Colors.white,),
              ),
      ), 
    );
  }
}
