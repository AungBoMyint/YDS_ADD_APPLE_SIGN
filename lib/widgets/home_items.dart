import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/home_controller.dart';
import '../data/constant.dart';
import '../routes/routes.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          titleSpacing: 5,
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Driving Courses",
                  style: TextStyle(
                      overflow: TextOverflow.visible,
                      color: Colors.black,
                      fontSize: 16,
                      wordSpacing: 2,
                      letterSpacing: 2),
                ),
              ),
            ],
          )),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: controller.items.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              controller.setSelectedItem(controller.items[i]);
              Get.toNamed(detailScreen);
            },
            /*  child: CardRowTypeWidgt(i: i, controller: controller, size: size), */
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                      10,
                    )),
                  ),
                  child: Container(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(
                        10,
                      )),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, status) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                        errorWidget: (context, url, whatever) {
                          return const Text("Image not available");
                        },
                        imageUrl: controller.items[i].photo,
                        /* images[i], */
                        /* controller.items[i].photo, */
                        fit: BoxFit.fitWidth,
                        height: 200,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
