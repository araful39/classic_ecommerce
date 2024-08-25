import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingOrderDetailsScreen extends StatelessWidget {
  const LoadingOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildContainerCard(line: 8),
            buildContainerCard(line: 3),
            buildContainerCard(line: 2),
            buildContainerCard(line: 6),
            buildContainerCard(line: 3),
            buildContainerCard(line: 2),
            buildContainerCard(line: 5),
          ],
        ),
      ),
    );
  }

  Container buildContainerCard({required int line}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          for (int i = 0; i < line; i++)
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      height: 10,
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      height: 10,
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
