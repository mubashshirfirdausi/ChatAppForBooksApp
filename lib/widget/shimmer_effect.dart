import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index) => ListTile(
        leading: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade700,
          child: Container(
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Colors.grey.shade900,
            ),
            width: 64,
            height: 64,
          ),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade700,
          child: Container(
            color: Colors.grey.shade900,
            width: double.infinity,
            height: 16,
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade700,
            child: Container(
              color: Colors.grey.shade900,
              width: MediaQuery.of(context).size.width * .5,
              height: 16,
            ),
          ),
        ),
      ),
    );
  }
}
