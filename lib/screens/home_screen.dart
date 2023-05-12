// ignore_for_file: library_private_types_in_public_api

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _cameraController;
  late CameraImage _cameraImage;
  bool _isWorking = false;
  String _prediction = "";
  String _confidence = "";

  // Load TFLite model
  loadModel() async {
    await Tflite.loadModel(
        model: "assets/keras_model.tflite", labels: "assets/labels.txt");
  }

  // Run TFLite model on image
  predictImage() async {
    if (!_isWorking) {
      _isWorking = true;

      var output = await Tflite.runModelOnFrame(
        bytesList: _cameraImage.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: _cameraImage.height,
        imageWidth: _cameraImage.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 1,
        threshold: 0.1,
      );

      // Update state with prediction results
      setState(() {
        _prediction = output![0]["label"].toString().split(" ")[1];
        _confidence = output[0]["confidence"].toString();
      });

      _isWorking = false;
    }
  }

  // Initialize camera controller on screen load
  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
    _initializeCamera();
  }

  // Release camera controller when screen is closed
  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  // Initialize camera controller
  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      _cameraController.startImageStream((cameraImage) {
        if (!_isWorking) {
          _cameraImage = cameraImage;
          predictImage();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("SignSense"),
        ),
        body: Column(children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                CameraPreview(_cameraController),
                Center(
                  child: Text(
                    _prediction,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Confidence: $_confidence",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ))
        ]));
  }
}
