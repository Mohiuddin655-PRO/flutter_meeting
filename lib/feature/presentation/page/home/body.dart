import 'package:flutter/material.dart';
import 'package:flutter_meet/feature/presentation/page/home/components/search_bar.dart';
import 'package:flutter_meet/feature/presentation/page/join/page.dart';
import 'package:flutter_meet/feature/presentation/widgets/app_button.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SearchBarHome(),
        Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    "https://remoters.net/wp-content/uploads/2020/11/online-appointment-scheduling-tools-519x353.jpg"),
                const Text(
                  "Your latest activity will appear \nhere",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: AppIconButton(
            text: "New",
            icon: Icons.videocam_outlined,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const JoinPage()));
            },
          ),
        ),
      ],
    );
  }
}
