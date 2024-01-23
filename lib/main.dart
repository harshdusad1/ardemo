import 'dart:io';

import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ARScreen(),
    );
  }
}

class ARScreen extends StatelessWidget {
  //   _loadGLBFile()  {
  //   return  rootBundle.loadString('assets/Horse.glb');
  // }
//  var croppedImageFile = File.fromUri(Uri.parse('https://drive.google.com/file/d/1olIBK5R1VBwuLy37vGiOWjKVRJUnvQj1/view?usp=sharing'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Example'),
      ),
      body: 
      ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
enablePlaneRenderer: true,
enableTapRecognizer: true,
enableUpdateListener: true,
type: ArCoreViewType.STANDARDVIEW,
      ),
      
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    _addArObject(controller);
  }

  void _addArObject(ArCoreController controller) {
    final node = ArCoreReferenceNode(
      name: 'ar_object',
      // object3DFileName: 'assets/tshirt.glb',
      position: vector.Vector3(0, 0, 0),
     objectUrl: 'https://drive.google.com/file/d/1olIBK5R1VBwuLy37vGiOWjKVRJUnvQj1/view?usp=sharing',

    );

    controller.addArCoreNode(node);
  }
 
}