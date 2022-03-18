import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    // capture(MediaSource.video);
                    videoSelector();
                  });
                },
                child: Text('Select media')),
          ),
        ));
  }

  void imageSelector() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      print(selectedImage.path.toString());
    } else {
      print('No image');
    }
    setState(() {});
  }

  void videoSelector() async {
    final XFile? selectedVideo =
        await _picker.pickVideo(source: ImageSource.gallery);
    if (selectedVideo!.path.isNotEmpty) {
      print(selectedVideo.path.toString());
    } else {
      print('No video');
    }
    setState(() {});
  }
}
