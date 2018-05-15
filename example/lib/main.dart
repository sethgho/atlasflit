import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:atlasflit/atlasflit.dart';
import 'avatar/avatar_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Atlasflit.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AtlasFlit Examples'),
        ),
        body: ComponentList(),
      ),
    );
  }
}

class ComponentList extends StatefulWidget {
  @override
  ComponentListState createState() => ComponentListState();
}

class Component {
  String name;
  String description;
  String path;

  Component({this.name, this.description, this.path});
}

class ComponentListState extends State<ComponentList> {
  var components = <Component>[
    Component(name: "Avatar", description: "An avatar view", path: "/avatar")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: components.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(components[index].name),
            subtitle: Text(components[index].description),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => AvatarExampleScreen()),
              );
            },
          );
        });
  }
}
