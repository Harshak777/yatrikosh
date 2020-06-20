import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Profile extends StatelessWidget {
  ArCoreController arCoreController;
  _onArCoreViewCreated(ArCoreController _arcoreController){
    arCoreController=_arcoreController;
    _addSphere(arCoreController);
  }
  _addSphere(ArCoreController _arcoreController){
    final material = ArCoreMaterial( color: Colors.deepOrange);
    final sphere = ArCoreSphere(materials: [material],radius: 0.2);
    final node = ArCoreNode(
      shape: sphere, 
      position: vector.Vector3(
        0,0,-1,
      ),
    );
    _arcoreController.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,),
    );
  }
}