import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitterclone/common/common.dart';
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
  @override
  Widget build(BuildContext context) {
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(),
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