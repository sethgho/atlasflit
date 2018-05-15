import 'package:flutter/material.dart';
import 'package:atlasflit/avatar/avatar.dart';

class AvatarExampleScreen extends StatefulWidget {
  @override
  _AvatarExampleScreenState createState() => new _AvatarExampleScreenState();
}

class _AvatarExampleScreenState extends State<AvatarExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
      ),
      body: Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          child: Column(
            children: <Widget>[AvatarRow(), AvatarItemRow(), AvatarGroupRow()],
          )),
    ));
  }
}

Widget _buildSection(String heading, Widget child) {
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            heading,
            style: TextStyle(fontSize: 24.0),
          ),
          Container(
            height: 8.0,
          ),
          child
        ],
      )
    ]),
  );
}

class AvatarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSection(
        "Avatar",
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
          Avatar(
              imageUrl:
                  "https://api.adorable.io/avatars/250/avatar@adorable.webp",
              appearance: AvatarAppearance.circle,
              size: AvatarSize.xlarge),
          Avatar(
              imageUrl:
                  "https://api.adorable.io/avatars/250/avatar@adorable.webp",
              appearance: AvatarAppearance.circle,
              size: AvatarSize.large),
          Avatar(
              imageUrl:
                  "https://api.adorable.io/avatars/250/avatar@adorable.webp",
              appearance: AvatarAppearance.circle,
              size: AvatarSize.medium),
          Avatar(
              imageUrl:
                  "https://api.adorable.io/avatars/250/avatar@adorable.webp",
              appearance: AvatarAppearance.circle,
              size: AvatarSize.small)
        ]));
  }
}

class AvatarItemRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSection(
        "Avatar Item",
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AvatarItem(
              avatarUrl:
                  "https://api.adorable.io/avatars/250/chaki@outlook.com.png",
              name: "Chaki Caronni",
              email: "chaki@me.com",
            ),
            AvatarItem(
              avatarUrl:
                  "https://api.adorable.io/avatars/250/nanop@outlook.com.png",
              name: "Nanop Rgiersig",
              email: "nanop@outlook.com",
            ),
            AvatarItem(
              avatarUrl:
                  "https://api.adorable.io/avatars/250/dowdy@outlook.com.png",
              name: "Dowdy Metzzo",
              email: "dowdy@outlook.com",
            )
          ],
        ));
  }
}

class AvatarGroupRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSection("Avatar Group", Container());
  }
}
