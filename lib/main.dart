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
  List<XFile> _imgList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imageSelector();
                    });
                  },
                  child: Text('Select Image')),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: _imgList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(
                              File(_imgList[index].path),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 4,
                              top: 4,
                              child: InkWell(
                                onTap: () {
                                  _imgList.removeAt(index);
                                  setState(() {});
                                },
                                child: Container(
                                  color: Color.fromRGBO(255, 255, 255, 0.7),
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }

  void imageSelector() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imgList.add(selectedImage);
    }
    setState(() {});
  }
}
