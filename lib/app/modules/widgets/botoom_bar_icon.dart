import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomItem extends StatefulWidget {

  final String asset;
  final VoidCallback function;

  const CustomBottomItem({Key? key, required this.asset, required this.function}) : super(key: key);

  @override
  State<CustomBottomItem> createState() => _CustomBottomItemState();
}

class _CustomBottomItemState extends State<CustomBottomItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.widget.function,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: SvgPicture.asset(
            widget.asset
        ),
      ),
    );
  }
}
