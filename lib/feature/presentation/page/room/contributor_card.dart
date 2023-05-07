import 'package:flutter/material.dart';
import 'package:flutter_meet/core/utils/size_config.dart';
import 'package:flutter_meet/feature/presentation/widgets/avatar_view.dart';

import '../../widgets/camera_view.dart';

class ContributorCard extends StatefulWidget {
  final Contributor item;

  const ContributorCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ContributorCard> createState() => _ContributorCardState();
}

class _ContributorCardState extends State<ContributorCard> {
  late final config = SizeConfig.of(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(config.dx(8)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.item.isCameraOn && widget.item.isMe
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: CameraView(
                    type: widget.item.cameraType,
                  ),
                )
              : AvatarView(
                  width: config.dx(40),
                  height: config.dx(40),
                  url: widget.item.profile,
                ),
          if (widget.item.isRiseHand)
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.back_hand_outlined,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.item.isMuted ? Icons.mic_off : Icons.mic,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.more_vert,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Contributor {
  final bool isMe;
  final bool isHost;
  final bool isRiseHand;
  final bool isMuted;
  final bool isCameraOn;
  final String profile;
  final String name;
  final String designation;
  final CameraType cameraType;

  const Contributor({
    this.isMe = false,
    this.isHost = false,
    this.isRiseHand = false,
    this.isMuted = true,
    this.isCameraOn = false,
    this.profile = "",
    this.name = "",
    this.designation = "",
    this.cameraType = CameraType.front,
  });

  Contributor copy(
    bool? isMe,
    bool? isHost,
    bool? isRiseHand,
    bool? isMuted,
    bool? isCameraOn,
    String? profile,
    String? name,
    String? designation,
    CameraType? cameraType,
  ) {
    return Contributor(
      isMe: isMe ?? this.isMe,
      isHost: isHost ?? this.isHost,
      isRiseHand: isRiseHand ?? this.isRiseHand,
      isMuted: isMuted ?? this.isMuted,
      isCameraOn: isCameraOn ?? this.isCameraOn,
      profile: profile ?? this.profile,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      cameraType: cameraType ?? this.cameraType,
    );
  }

  static const List<Contributor> contributors = [
    Contributor(
      isMe: true,
      isHost: true,
      isRiseHand: true,
      isMuted: false,
      isCameraOn: false,
      profile:
          "https://images.unsplash.com/photo-1678708502726-f11c1ac13636?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: true,
      isRiseHand: true,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/photo-1537779138615-0ac3222baac1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: false,
      isMuted: false,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/flagged/photo-1497852454821-42a58d657651?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: true,
      isMuted: true,
      isCameraOn: false,
      profile:
          "https://images.unsplash.com/flagged/photo-1485503008559-b7189b9b1767?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: true,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/photo-1678708502726-f11c1ac13636?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: false,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/photo-1537779138615-0ac3222baac1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: false,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/flagged/photo-1497852454821-42a58d657651?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: false,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/flagged/photo-1485503008559-b7189b9b1767?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: true,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/photo-1678708502726-f11c1ac13636?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: false,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/photo-1537779138615-0ac3222baac1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: true,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/flagged/photo-1497852454821-42a58d657651?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
    Contributor(
      isHost: false,
      isRiseHand: true,
      isMuted: true,
      isCameraOn: true,
      profile:
          "https://images.unsplash.com/flagged/photo-1485503008559-b7189b9b1767?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      name: "",
      designation: "",
    ),
  ];

  static Future<List<Contributor>> getContributors() async {
    return contributors;
  }
}
