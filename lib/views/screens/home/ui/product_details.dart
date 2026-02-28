import 'package:flutter/material.dart';

import '../../../../models/products.dart';
import '../../../widget/main_button.dart';

class ProductDetails extends StatefulWidget {
  final Products product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.imageUrl,
              width: double.infinity,
              height: size.height * 0.55,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.product.discountValue==0 || widget.product.discountValue == null?'\$${widget.product.price}':'\$${widget.product.price * (widget.product.discountValue / 100)}',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.product.category,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.black54),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          if (index < widget.product.rating!.floor()) {
                            return Icon(Icons.star, size: 26, color: Colors.amber);
                          } else if (index < widget.product.rating!) {
                            return Icon(
                              Icons.star_half,
                              size: 26,
                              color: Colors.amber,
                            );
                          } else {
                            return Icon(
                              Icons.star_border,
                              size: 26,
                              color: Colors.amber,
                            );
                          }
                        }),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.product.rating.toString(),
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16.0),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),
                  Text(
                    'This product is crafted with premium materials to ensure durability, comfort, and long-lasting performance. Designed with attention to detail, it combines modern style with practical functionality. Perfect for everyday use, it offers a balanced blend of quality and affordability.\nWhether you\'re looking for reliability, elegance, or value, this item is made to meet your expectations and enhance your overall experience. ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16.0),
                  MainButton(
                    text: 'Add to Cart',
                    onTap: () {},
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
