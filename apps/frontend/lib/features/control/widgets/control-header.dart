import 'package:flutter/material.dart';

class ControlHeader extends StatelessWidget with PreferredSizeWidget {
  const ControlHeader({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _title,
      centerTitle: true,
      leading: _leading,
    );
  }

  Widget get _leading => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      );

  Widget get _title => const Text(
        "No Weed",
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );
}
