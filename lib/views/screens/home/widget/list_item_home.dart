import 'package:flutter/material.dart';

import '../../../../models/products.dart';

class ListItemHome extends StatelessWidget {
  final Products product;
  final String? nameList;
  const ListItemHome({
    super.key,
    required this.product,
    required this.nameList,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      product.imageUrl,
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: product.title == 'New'
                        ? SizedBox(
                            width: 50,
                            height: 30,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                child: Text(
                                  'New',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: 50,
                            height: 30,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: nameList == 'Sale'
                                    ? Colors.red
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                child: Text(
                                  nameList == 'Sale'
                                      ? '- ${product.discontValue}%'
                                      : 'New',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      if (index < product.rating!.floor()) {
                        return Icon(Icons.star, size: 16, color: Colors.amber);
                      } else if (index < product.rating!) {
                        return Icon(
                          Icons.star_half,
                          size: 16,
                          color: Colors.amber,
                        );
                      } else {
                        return Icon(
                          Icons.star_border,
                          size: 16,
                          color: Colors.amber,
                        );
                      }
                    }),
                  ),
                  SizedBox(width: 5),
                  Text(
                    product.rating.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                product.category,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                product.title,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              nameList == 'Sale'
                  ? Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${product.price}',
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          TextSpan(
                            text:
                                ' \$${product.price * (product.discontValue / 100)}',
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      '\$${product.price}',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.grey),
                    ),
            ],
          ),
          Positioned(
            bottom: 80,
            right: 16,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Icon(Icons.favorite, size: 18, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
