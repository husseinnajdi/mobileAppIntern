import 'package:flutter/material.dart';

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
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade200,
            image: DecorationImage(
              image: AssetImage(widget.image!),
              fit: BoxFit.cover,
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