import 'package:flutter/material.dart';
import 'package:mobileappintern/screen/view_all.dart';

class CategorieCard extends StatefulWidget {
  final String? title;
  final String? image;
  const CategorieCard({super.key, this.title, this.image});

  @override
  State<CategorieCard> createState() => _CategorieState();
}

class _CategorieState extends State<CategorieCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ViewAll.routeName, arguments: {'categorie': widget.title, 'hasdeals': false});
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: const Color.fromARGB(255, 114, 178, 230),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(60),
              color: const Color.fromARGB(255, 255, 255, 255),
              image: DecorationImage(
                image: AssetImage(widget.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.title!,
          style: const TextStyle(
            fontSize: 12,
            color:  Color.fromARGB(255, 114, 178, 230),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}