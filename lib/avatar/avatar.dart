import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';

enum AvatarSize { xsmall, small, medium, large, xlarge, xxlarge }
enum AvatarAppearance { circle, square }
enum AvatarPresence { none, online, busy, focus, offline }

class Avatar extends StatelessWidget {
  String imageUrl;
  var size = AvatarSize.medium;
  var appearance = AvatarAppearance.circle;
  var presence = AvatarPresence.none;

  Avatar({this.imageUrl, this.size, this.appearance});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImageWithRetry(imageUrl),
      radius: _sizeToWidth(size),
    );
  }
}

double _sizeToWidth(AvatarSize size) {
  switch (size) {
    case AvatarSize.xsmall:
      return 8.0;
    case AvatarSize.small:
      return 16.0;
    case AvatarSize.medium:
      return 24.0;
    case AvatarSize.large:
      return 32.0;
    case AvatarSize.xlarge:
      return 48.0;
    case AvatarSize.xxlarge:
      return 96.0;
    default:
      return 32.0;
  }
}

_sizeToHeight(AvatarSize size) {
  return _sizeToWidth(size);
}

class AvatarItem extends StatelessWidget {
  String avatarUrl;
  String name;
  String email;

  AvatarItem({this.avatarUrl, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(
                  imageUrl: avatarUrl,
                  appearance: AvatarAppearance.circle,
                  size: AvatarSize.medium),
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
