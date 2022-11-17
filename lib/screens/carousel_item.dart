import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselItem extends StatelessWidget {
  final String imgUrl;
  const CarouselItem({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 104.h,
      child: CachedNetworkImage(
        // maxHeightDiskCache: 10,
        fit: BoxFit.cover,
        imageUrl: imgUrl,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fadeOutDuration: const Duration(seconds: 1),
        fadeInDuration: const Duration(seconds: 3),
      ),
    );
  }
}
