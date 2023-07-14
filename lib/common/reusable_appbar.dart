import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitterclone/constants/assets_constants.dart';

class ReUsableAppBar extends StatelessWidget{
  const ReUsableAppBar({super.key});

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo
      ),
    );
  }
}