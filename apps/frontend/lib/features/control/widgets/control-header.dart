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
        "No Weeed",
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );
}

/*

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 20,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              size: 30.0,
            ),
            const Text("No Weed"),
            Container(),
          ],
        ),
      ),
    );
  }

*/
