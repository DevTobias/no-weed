import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget with PreferredSizeWidget {
  const TransparentAppBar({
    Key? key,
    this.title = "",
    this.icon,
  }) : super(key: key);

  final String title;
  final IconData? icon;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _title,
      centerTitle: true,
      leading: icon != null ? _leading : null,
    );
  }

  Widget get _leading => IconButton(
        onPressed: () {},
        icon: Icon(icon!),
      );

  Widget get _title => Image.asset(
        "assets/images/plant_logo.png",
        height: 50,
      );
}
