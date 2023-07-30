import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitterclone/constants/constants.dart';
import 'package:twitterclone/features/tweet/views/create_tweet_view.dart';
import 'package:twitterclone/theme/theme.dart';

class HomeView extends StatefulWidget{
  static route() => MaterialPageRoute(
    builder: (context) => const HomeView(),
  );
  const HomeView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{
  int _page = 0;
  final appBar = UIConstants.appBar();

  void onPageChange(int index){
    setState(() {
      _page = index;
    });
  }

  void onCreateTweet(){
    Navigator.push(context, CreateTweetScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTweet,
        child: const Icon(
            Icons.add,
          color: Pallete.whiteColor,
          size: 28,
        ),
      ),
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTabBarPages,
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        onTap: onPageChange,
        backgroundColor: Pallete.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _page == 0 ?
              AssetsConstants.homeFilledIcon : AssetsConstants.homeOutlinedIcon,
              color: Pallete.whiteColor,
            )
          ),

          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.searchIcon,
                color: Pallete.whiteColor,
              )
          ),

          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 2 ?
                AssetsConstants.notifFilledIcon : AssetsConstants.notifOutlinedIcon,
                color: Pallete.whiteColor,
              )
          )
        ],
      ),
    );
  }
}