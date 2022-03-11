import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDashboardLoading extends StatelessWidget {
  const ShimmerDashboardLoading({
    Key? key,
    required this.height,
    required this.width,
    this.crossAxisCount = 1,
    this.itemCount = 10,
  }) : super(key: key);

  final double height, width;
  final int crossAxisCount;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: height,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[500]!,
          highlightColor: Colors.grey[300]!,
          period: const Duration(seconds: 1),
          child: _card(),
        );
      },
    );
  }

  Container _card() {
    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
