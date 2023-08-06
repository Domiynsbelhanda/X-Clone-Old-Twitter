import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitterclone/common/common.dart';
import 'package:twitterclone/features/auth/controller/auth_controller.dart';
import 'package:twitterclone/theme/pallete.dart';

class CreateTweetScreen extends ConsumerStatefulWidget{
  static route() => MaterialPageRoute(
    builder: (context) => const CreateTweetScreen(),
  );
  const CreateTweetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _CreateTweetScreen();
  }
}

class _CreateTweetScreen extends ConsumerState<CreateTweetScreen>{
  final tweetTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    tweetTextController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
              Icons.close,
            size: 30,
          ),
        ),
        
        actions: [
          RoundedSmallButton(
              onTap: (){},
              label: 'Tweet',
              backgroundColor: Pallete.blueColor,
              textColor: Pallete.whiteColor,
          )
        ],
      ),

      body: currentUser == null
          ? const Loader()
          : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.profilePic),
                    radius: 30,
                  ),

                  const SizedBox(
                    width : 15
                  ),

                  TextField(
                    controller: tweetTextController,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                      hintText: "What's happening?"
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}