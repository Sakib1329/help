import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  RxBool isrequestsent=false.obs;
  RxString searchQuery = ''.obs;
  var message = ''.obs;
  RxBool isuserblocked=false.obs;
  RxBool istapped=false.obs;
  Rxn<File> pickedImage = Rxn<File>();
  RxSet<String> selectedUsers = <String>{}.obs;
  final textController = TextEditingController();
  var selectedGroupType = 'Public'.obs;
  void toggleSelection(String name) {
    if (selectedUsers.contains(name)) {
      selectedUsers.remove(name);
    } else {
      selectedUsers.add(name);
    }
  }

// Check if a user is selected
  bool isSelected(String name) {
    return selectedUsers.contains(name);
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  final List<String> names = [
    'Livia Workman',
    'Ethan Rivers',
    'Mila Greene',
    'Noah Carter',
    'Ava Brooks',
    'Lucas Hale',
    'Emma Stone',
    'Liam Woods',
    'Olivia West',
    'Mason Hayes',
    'Isla Knight',
    'Elijah Ford',
    'Chloe Ray',
    'Logan King',
    'Sofia Lane',
    'James Cole',
    'Amelia Blake',
  ];

  final List<String> images = [
    'assets/images/chat/img.png',
    'assets/images/chat/img_1.png',
    'assets/images/chat/img_2.png',
    'assets/images/chat/img_3.png',
    'assets/images/chat/img_4.png',
    'assets/images/chat/img_5.png',
    'assets/images/chat/img_6.png',
    'assets/images/chat/img_7.png',
    'assets/images/chat/img_8.png',
    'assets/images/chat/img_9.png',
    'assets/images/chat/img_10.png',
    'assets/images/chat/img_11.png',
    'assets/images/chat/img_12.png',
    'assets/images/chat/img_13.png',
    'assets/images/chat/img_14.png',
    'assets/images/chat/img_15.png',
    'assets/images/chat/img_16.png',
  ];

}