import 'package:e_commerce_test/core/cubit/language_cubit.dart';
import 'package:e_commerce_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrdersAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomOrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).orders,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(S.of(context).changeLanguage),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(S.of(context).english),
                        onTap: () {
                          context.read<LanguageCubit>().changeLanguage('en');
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text(S.of(context).arabic),
                        onTap: () {
                          context.read<LanguageCubit>().changeLanguage('ar');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.language,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
