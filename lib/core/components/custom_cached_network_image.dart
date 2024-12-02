import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_test/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
    this.borderRadius,
  });
  final String imageUrl;
  final double width;
  final double height;
  final double? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Image.asset(
          Assets.assetsImagesAvatarPlaceholder,
          width: width,
          height: height,
          fit: fit,
        ),
        errorWidget: (context, url, error) => Image.asset(
          Assets.assetsImagesAvatarPlaceholder,
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    );
  }
}
