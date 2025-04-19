import 'package:flutter/material.dart';
import 'package:grabber_app/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.product,
      required this.onTap,
      required this.icon});

  final ProductModel product;
  final Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Container(
                width: 135,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/fruits/${product.name[0].toLowerCase()}${product.name.substring(1)}.png',
                    width: 136,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: icon,
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/star.png',
                      width: 18,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${product.rate} (${product.rateCount})",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
