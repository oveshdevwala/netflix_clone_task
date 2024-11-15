// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:netflix_clone/core/core.dart';

class OutlineBox extends StatelessWidget {
  const OutlineBox({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.withAlpha(100),
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: Colors.blueGrey),
          border: Border.all(width: 0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3).r,
        child: Text(
          title ?? '',
          style: TextStyle(color: AppColors.white, fontSize: 14.sp),
        ),
      ),
    );
  }
}
