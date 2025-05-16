import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/cameracontroller.dart';
import '../theme/color.dart';

class Homepage extends StatelessWidget {
  final BottomSheetController bs=Get.put(BottomSheetController());
   Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(

        children: [
          Stack(
            children: [
              Obx(() {
                final file = bs.pickedImage.value;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: file != null
                      ? Image.file(
                    file,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 100,
                    height: 100,
                    color: AppColor.palePink,
                    child: Image.asset(
                      'assets/images/img.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColor.palePink,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 18,
                      color: AppColor.black12,
                    ),
                    onPressed: bs.getBottomSheet,
                    padding: EdgeInsets.all(4),
                    constraints: const BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
