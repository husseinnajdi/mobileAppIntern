import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final int price;
  final int dealprice;
  final String category;
  final bool hasdeal;
  const Product({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.hasdeal,
    required this.dealprice,
    required this.category,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 114, 178, 230)),
        borderRadius: BorderRadius.circular(16.0),
      ),
      height: height > 560 && height < 1080 ? height * 0.25 : height * 0.2,
      width: width > 320 && width < 540 ? width * 0.4 : width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
              ),
            ],
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 114, 178, 230),
            ),
          ),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            widget.description,
            style: const TextStyle(fontSize: 10.0, color: Colors.grey),
          ),
          const SizedBox(height: 4.0),
          widget.hasdeal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${(widget.dealprice).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 32),
              padding: const EdgeInsets.symmetric(vertical: 6),
              backgroundColor: Color.fromARGB(255, 114, 178, 230),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "Add to cart",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
