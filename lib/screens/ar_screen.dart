import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;
class ArEarthScreen extends StatefulWidget {
  const ArEarthScreen({super.key});

  @override
  State<ArEarthScreen> createState() => _ArEarthScreenState();
}

class _ArEarthScreenState extends State<ArEarthScreen> {

  ArCoreController? arEarthCoreController;
  augumentedRealityCreated(ArCoreController arCoreController){
    arEarthCoreController=arCoreController;
    displayEarthMapSphere(arEarthCoreController!);
  }

  displayEarthMapSphere(ArCoreController controller )async {
    // for loading the asset
  final ByteData earthTextureBytes =  await rootBundle.load("assets/earth_map.jpg");


 // for color and material
  final materials= ArCoreMaterial(
    color: Colors.blue,
    textureBytes: earthTextureBytes.buffer.asUint8List(),
  );
  // for shape
  final sphere= ArCoreSphere(materials: [materials]);
  // for position
  final node =ArCoreNode(
    shape: sphere,
    position:vector64.Vector3(0,0,-1.5),
  );
  arEarthCoreController!.addArCoreNode(node);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AR IN FLUTTER"),
        centerTitle: true,
      ),
      body: ArCoreView(onArCoreViewCreated:augumentedRealityCreated,),


    );
  }
}
