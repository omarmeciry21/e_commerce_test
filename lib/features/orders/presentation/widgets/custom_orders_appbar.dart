import 'package:e_commerce_test/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomOrdersAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomOrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).orders),
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
