import 'package:flutter/material.dart';

import '../../../../core/widgets/shimmer_widget.dart';

class CatTriviaShimmerWidget extends StatelessWidget {
  const CatTriviaShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, right: 6, left: 6),
      child: ShimmerWidget.rectangle(
        shapeBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white38,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 7, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerWidget.circular(
                    width: 84,
                    height: 15,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.grey[400]!,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: ShimmerWidget.circular(
                      width: 100,
                      height: 8,
                      shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.grey[400]!,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ShimmerWidget.circular(
                  width: 138,
                  height: 6,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[400]!,
                ),
              ),
              ShimmerWidget.circular(
                width: 138,
                height: 6,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey[400]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
