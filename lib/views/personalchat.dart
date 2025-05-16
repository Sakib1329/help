import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../controllers/chatcontroller.dart';
import '../theme/color.dart';

import '../widgets/imageassets.dart';

class Groupchat extends StatelessWidget {
  final String name;
  final String image;
  final ImagePicker _picker = ImagePicker();
  final ChatController controller = Get.put(ChatController());
  Groupchat({super.key, required this.name, required this.image});

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      controller.pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> _pickVideoOrImageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      controller.pickedImage.value = File(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        leadingWidth: 40,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(
                color: AppColor.darkGrey,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Obx(
              () => Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align the content to the top
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: AppColor.softRed)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: AppColor.softRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColor.softRed)),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 8.0,top: 50),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[300],
                              child: ClipOval(
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(bottom: 12, right: 80),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.3,
                      color: AppColor.lightGrey,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      // topLeft is NOT rounded
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          'Good morning',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          '11:23 AM',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.textBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )

                ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(bottom: 12, left: 80),
                        decoration: BoxDecoration(
                        color: AppColor.softRed,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            // topLeft is NOT rounded
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                'Hey how are you?',
                                style: TextStyle(fontSize: 16,
                                color: AppColor.whiteTextColor),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                            SizedBox(width: 8),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Text(
                                '11:23 AM',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.whiteTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.isuserblocked == false
                  ? Obx(
                    () => _buildInputBar(context),
              )
                  : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Unblock User to continue Chat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildInputBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColor.lightGrey
        )
      ),
      child: Row(
        children: [
          Obx(
                () =>
            controller.message.value.isEmpty
                ? GestureDetector(
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColor.softRed,
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              onTap: () {
                _pickImage(ImageSource.camera);
              },
            )
                : const SizedBox.shrink(),
          ),
          SizedBox(width: controller.message.value.isEmpty ? 10 : 0),
          Expanded(
            child: TextField(
              controller: controller.textController,
              onChanged: (value) => controller.message.value = value.trim(),
              decoration: const InputDecoration(
                hintText: 'Message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(
                () =>
            controller.message.value.isEmpty
                ? Row(
              children: [
                Image.asset(
                  ImageAssets.microphone,
                  width: 30,
                  height: 30,
                  color: AppColor.softRed,
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    _pickVideoOrImageFromGallery();
                  },
                  child: Image.asset(
                    ImageAssets.gallery,
                    width: 30,
                    height: 30,
                    color: AppColor.softRed,
                  ),
                ),
              ],
            )
                : GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                ImageAssets.send,
                height: 24,
                width: 24,
                color: AppColor.softRed,
              ),
            ),
          ),
        ],
      ),
    );
  }


}