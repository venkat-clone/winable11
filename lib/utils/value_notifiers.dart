


import 'package:flutter/material.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../models/user.dart';

ValueNotifier<AppUser> currentUser = new ValueNotifier(AppUser());

Future<void> initValueNotifiers() async {
  currentUser.value = await SharedPreferenceService.getUser();
}

