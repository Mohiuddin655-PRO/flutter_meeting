import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meet/feature/presentation/widgets/camera_view.dart';
import 'package:flutter_meet/feature/presentation/widgets/image_button.dart';

import 'body.dart';

class RoomPage extends StatefulWidget {
  final String id;

  const RoomPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  bool isSilent = false;
  bool isBackCamera = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.id,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ImageButton(
                    onClick: () {
                      isSilent = !isSilent;
                      setState(() {});
                    },
                    icon: isSilent
                        ? Icons.volume_up_outlined
                        : Icons.volume_off_outlined,
                  ),
                  ImageButton(
                    onClick: () {
                      isBackCamera = !isBackCamera;
                      setState(() {});
                    },
                    icon: Icons.flip_camera_android_outlined,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: RoomBody(
          id: widget.id,
          cameraType: isBackCamera ? CameraType.back : CameraType.front,
        ),
      ),
    );
  }
}
