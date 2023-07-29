import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hammies_user/main.dart';
import 'package:hammies_user/screen/view/profile.dart';
import 'package:hammies_user/utils/widget/widget.dart';
import 'package:hammies_user/widgets/confirm_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_controller.dart';
import '../data/constant.dart';
import '../routes/routes.dart';
import '../widgets/bottom_nav.dart';
import 'view/cart.dart';
import 'view/favourite.dart';
import 'view/home.dart';
import 'view/hot.dart';
import 'view/order_history.dart';

List<Widget> _template = [
  HomeView(),
  // BrandView(),
  HotView(),
  CartView(),
  FavouriteView(),
  ProfileView(),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? fltNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseMessagingService.requestPermission();
    firebaseMessagingService.setUpFullNotification();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        elevation: 0,
        titleSpacing: 5,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 40,
              ),
            ),
            Expanded(
              child: Text(
                "  YANGON DRIVING SCHOOL",
                style: TextStyle(
                    overflow: TextOverflow.visible,
                    color: Colors.black,
                    fontSize: 15,
                    wordSpacing: 2,
                    letterSpacing: 2),
              ),
            ),
          ],
        ),
        // centerTitle: true,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.resolveWith<double>(
                // As you said you dont need elevation. I'm returning 0 in both case
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return 0;
                  }
                  return 0; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () async {
              try {
                await launch('https://m.me/Yangondrivingschool');
              } catch (e) {
                print(e);
              }
            },
            child: FaIcon(
              FontAwesomeIcons.facebookMessenger,
              color: Colors.blue,
              size: 25,
            ),
          ),
          //User Profile
        ],
      ),
      body: Obx(
        () => _template[controller.navIndex.value],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
