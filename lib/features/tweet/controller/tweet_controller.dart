import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitterclone/apis/tweet_api.dart';
import 'package:twitterclone/core/core.dart';
import 'package:twitterclone/core/utils.dart';
import 'package:twitterclone/features/auth/controller/auth_controller.dart';
import 'package:twitterclone/models/tweet_model.dart';

final tweetControllerProvider = StateNotifierProvider<TweetController, bool>(
    (ref) {
      return TweetController(
          ref: ref, tweetAPI: ref.watch(tweetAPIProvider)
      );
    }
);

class TweetController extends StateNotifier<bool> {
  final _tweetApi;
  final Ref _ref;
  TweetController({required Ref ref, required TweetAPI tweetAPI}) : _ref = ref, _tweetApi = tweetAPI, super(false);

  void shareTweet({
    required List<File> images,
    required String text,
    required BuildContext context
  }) {
    if (text.isEmpty) {
      showSnackBar(context, "Please enter text");
      return;
    }

    if (images.isNotEmpty) {
      _shareImageTweet(images: images, text: text, context: context);
    } else {
      _shareTextTweet(text: text, context: context);
    }
  }

  void _shareImageTweet({
    required List<File> images,
    required String text,
    required BuildContext context
  }) {

  }

  void _shareTextTweet({
    required String text,
    required BuildContext context
  }) async {
    state = true;
    final hashtags = _getHashtagsFromText(text);
    String link = _getLinkFromText(text);
    final user = _ref.read(currentUserDetailsProvider).value!;

    Tweet tweet = Tweet(
        text: text,
        hashtags: hashtags,
        link: link,
        imageLinks: const [],
        uid: user.uid,
        tweetType: TweetType.text,
        tweetedAt: DateTime.now(),
        likes: const [],
        commentIds: const [],
        id: '',
        reshareCount: 0
    );
    final res = await _tweetApi.shareTweet(tweet);
    state = false;
    res.fold(
        (l)=>showSnackBar(context, l.message),
        (r)=> null
    );
  }

  String _getLinkFromText(String text) {
    String link = '';
    List<String> wordsInSentence = text.split(' ');
    for (String word in wordsInSentence) {
      if (word.startsWith('https://') || word.startsWith("www.")) {
        link = word;
      }
    }
    return link;
  }

  List<String> _getHashtagsFromText(String text) {
    List<String> hashtags = [];
    List<String> wordsInSentence = text.split(' ');
    for (String word in wordsInSentence) {
      if (word.startsWith('#')) {
        hashtags.add(word);
      }
    }
    return hashtags;
  }
}