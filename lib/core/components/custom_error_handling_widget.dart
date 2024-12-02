import 'package:e_commerce_test/core/secure_storage_configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';

class CustomErrorHandlingWidget extends StatefulWidget {
  const CustomErrorHandlingWidget(
      {super.key, required this.errorMessage, required this.onRetryPressed});
  final String? errorMessage;
  final void Function() onRetryPressed;

  @override
  State<CustomErrorHandlingWidget> createState() =>
      _CustomErrorHandlingWidgetState();
}

class _CustomErrorHandlingWidgetState extends State<CustomErrorHandlingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.errorMessage?.toLowerCase().contains('unauth') ?? false) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await SecureStorageConfigurations.clearUserToken();
        // TODO: Go to login page
      });
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.errorMessage ?? S.of(context).exceptionMessage,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () {
              widget.onRetryPressed();
            },
            style: Theme.of(context).textButtonTheme.style?.copyWith(
                  textStyle: MaterialStatePropertyAll(
                    Theme.of(context)
                        .textButtonTheme
                        .style
                        ?.textStyle
                        ?.resolve(const <MaterialState>{})?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.refresh,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 4.w),
                Text(
                  S.of(context).retry,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
