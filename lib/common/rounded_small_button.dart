import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitterclone/constants/assets_constants.dart';
import 'package:twitterclone/theme/theme.dart';

class RoundedSmallButton extends StatelessWidget{
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const RoundedSmallButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Pallete.whiteColor,
    this.textColor = Pallete.backgroundColor
  });

  @override
  Widget build(BuildContext context){
    return Chip(
      label: Text(
          label,
        style: TextStyle(
          color: textColor,
          fontSize: 16
        ),
      ),
      backgroundColor: backgroundColor,
      labelPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}