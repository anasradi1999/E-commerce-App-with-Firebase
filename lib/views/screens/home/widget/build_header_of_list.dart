import 'package:flutter/material.dart';

class BuildHeaderOfList extends StatelessWidget {
  final String text;
  final String description;
  final VoidCallback? onTap;


  const BuildHeaderOfList({super.key, required this.text, required this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 36),),
            Text('View All',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
          ],
        ),
        SizedBox(height: 2.0,),
        Text(description,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey),),
      ],
    );
  }
}
