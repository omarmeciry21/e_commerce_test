import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagsWrapWidget extends StatelessWidget {
  const TagsWrapWidget({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 4.r,
        runSpacing: 4.r,
        children: (tags ?? [])
            .map(
              (tag) => Container(
                margin: EdgeInsets.only(right: 4.r),
                padding: EdgeInsets.symmetric(horizontal: 4.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            .toList());
  }
}
