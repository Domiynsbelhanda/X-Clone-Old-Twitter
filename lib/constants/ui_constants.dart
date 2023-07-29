import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitterclone/constants/assets_constants.dart';
import 'package:twitterclone/theme/pallete.dart';

class UIConstants{
  static AppBar appBar(){
    return AppBar(
      title: SvgPicture.asset(
          AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }
  static List<Widget> bottomTabBarPages = const [
    Text('Feed Screen'),
    Text('Search Screen'),
    Text('Notification Screen'),
  ];
}