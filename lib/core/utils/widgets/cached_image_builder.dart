import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cachedImage(String imageUrl, double height) {
  return CachedNetworkImage(
    placeholder: (context, url) => const CupertinoActivityIndicator(
      radius: 10,
    ),
    imageUrl: imageUrl,
    fit: BoxFit.fitHeight,
    height: height,
    errorWidget: (context, url, error) => const Icon(Icons.error),
    errorListener: (e) {
      if (e is SocketException) {
        debugPrint('Error with ${e.address} and message ${e.message}');
      } else {
        debugPrint('Image Exception is: ${e.runtimeType}');
      }
    },
  );
}
