import 'package:flutter/material.dart';
import 'package:flutter_meet/feature/presentation/widgets/image_button.dart';

import '../../widgets/camera_view.dart';

class CameraForPreparePage extends StatefulWidget {
  const CameraForPreparePage({Key? key}) : super(key: key);

  @override
  State<CameraForPreparePage> createState() => _CameraForPreparePageState();
}

class _CameraForPreparePageState extends State<CameraForPreparePage> {
  bool isCameraOn = false;
  bool isMuted = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isCameraOn)
            const SizedBox(
              width: 150,
              height: 250,
              child: CameraView(
                type: CameraType.back,
              ),
            ),
          Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              "https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageButton(
                    icon: isCameraOn
                        ? Icons.videocam
                        : Icons.videocam_off_outlined,
                    background: Colors.white24,
                    tint: Colors.white,
                    onClick: () {
                      isCameraOn = !isCameraOn;
                      setState(() {});
                    },
                  ),
                  ImageButton(
                    icon: isMuted ? Icons.mic_off : Icons.mic,
                    background: Colors.white24,
                    tint: Colors.white,
                    onClick: () {
                      isMuted = !isMuted;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
