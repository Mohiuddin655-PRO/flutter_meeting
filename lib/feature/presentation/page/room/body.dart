import 'package:flutter/material.dart';
import 'package:flutter_meet/feature/presentation/widgets/camera_view.dart';
import 'package:flutter_meet/utils/providers/provider.dart';

import '../../widgets/image_button.dart';
import 'contributor_card.dart';

class RoomBody extends StatefulWidget {
  final String id;
  final CameraType cameraType;

  const RoomBody({
    Key? key,
    required this.id,
    required this.cameraType,
  }) : super(key: key);

  @override
  State<RoomBody> createState() => _RoomBodyState();
}

class _RoomBodyState extends State<RoomBody> {
  bool isCameraOn = false;
  bool isMuted = true;
  bool isRiseHand = false;
  bool isReserveMode = true;
  int crossAxisCount = 3;

  late CameraType cameraType = widget.cameraType;

  @override
  void didUpdateWidget(covariant RoomBody oldWidget) {
    cameraType = widget.cameraType;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  child: FutureBuilder<List<Contributor>>(
                    future: Contributor.getContributors(),
                    builder: (context, snapshot) {
                      final data = snapshot.data ?? <Contributor>[];
                      List<Contributor> items = data.map((e) => e).toList();
                      var length = items.length;
                      items.insert(
                        isReserveMode
                            ? Provider.reserveIndex(crossAxisCount, length)
                            : 0,
                        Contributor(
                          cameraType: cameraType,
                          isMe: true,
                          isMuted: isMuted,
                          isCameraOn: isCameraOn,
                          isRiseHand: isRiseHand,
                          isHost: false,
                          name: "You",
                          profile:
                              "https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png",
                          designation: "",
                        ),
                      );
                      return GridView.builder(
                        reverse: isReserveMode,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 3 / 5,
                        ),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ContributorCard(
                            item: item,
                          );
                        },
                        itemCount: items.length,
                      );
                    },
                  ),
                ),
                // LinkInviteView(
                //   id: id,
                //   onCopy: () {
                //     print("onCopy is pressed!");
                //   },
                //   onInvite: () {
                //     print("onInvite is pressed!");
                //   },
                // ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageButton(
                  icon: Icons.call_end,
                  tint: Colors.white,
                  background: Colors.red,
                  size: 32,
                  onClick: () {},
                ),
                ImageButton(
                  icon: isCameraOn
                      ? Icons.videocam_outlined
                      : Icons.videocam_off_outlined,
                  tint: isCameraOn ? Colors.white : Colors.black,
                  background: isCameraOn ? Colors.white12 : Colors.white,
                  size: 32,
                  onClick: () {
                    isCameraOn = !isCameraOn;
                    setState(() {});
                  },
                ),
                ImageButton(
                  icon: isMuted ? Icons.mic_off : Icons.mic,
                  tint: isMuted ? Colors.black : Colors.white,
                  background: isMuted ? Colors.white : Colors.white12,
                  size: 32,
                  onClick: () {
                    isMuted = !isMuted;
                    setState(() {});
                  },
                ),
                ImageButton(
                  icon: Icons.back_hand_outlined,
                  tint: isRiseHand ? Colors.black : Colors.white,
                  background: isRiseHand ? Colors.white : Colors.white12,
                  size: 32,
                  onClick: () {
                    isRiseHand = !isRiseHand;
                    setState(() {});
                  },
                ),
                ImageButton(
                  icon: Icons.more_vert,
                  tint: Colors.white,
                  background: Colors.white12,
                  size: 32,
                  onClick: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
