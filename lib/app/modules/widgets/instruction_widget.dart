import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class InstructionWidget extends StatefulWidget {

  final Steps instruction;

  const InstructionWidget({Key? key, required this.instruction}) : super(key: key);

  @override
  State<InstructionWidget> createState() => _InstructionWidgetState();
}

class _InstructionWidgetState extends State<InstructionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.notificationBackground
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 32, horizontal: 20
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${widget.instruction.step}'
              )
            ],
          ),
        ),
        AppSpacer.H16
      ],
    );
  }
}
