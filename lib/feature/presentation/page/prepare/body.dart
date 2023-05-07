import 'package:flutter/material.dart';
import 'package:flutter_meet/feature/presentation/page/prepare/camera.dart';
import 'package:flutter_meet/feature/presentation/page/prepare/share_button.dart';
import 'package:flutter_meet/feature/presentation/page/room/page.dart';
import 'package:flutter_meet/feature/presentation/widgets/app_button.dart';

class PrepareBody extends StatelessWidget {
  final String id;

  const PrepareBody({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Text(
              id,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          const CameraForPreparePage(),
          const ShareScreenButtonForPrepareBody(),
          Container(
            margin: const EdgeInsets.only(
              top: 16,
            ),
            child: const Text(
              "You are the first one here",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            color: Colors.black12,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.shield_outlined,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "This meeting is secured with cloud encryption. ",
                      children: [
                        TextSpan(
                          text: "Learn more",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.info_outline,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(
                  width: 24,
                ),
                Text(
                  "Joining info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ],
            ),
          ),
          AppIconButton(
            text: "Join",
            icon: Icons.videocam_outlined,
            margin: const EdgeInsets.all(32),
            onPressed: () {
              final arguments = {
                "ID": id,
              };
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomPage(
                    id: id,
                  ),
                  settings: RouteSettings(
                    arguments: arguments,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
