


import 'package:flutter/material.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../models/user.dart';

ValueNotifier<LocalUser> currentUser = new ValueNotifier(LocalUser());

Future<void> initValueNotifiers() async {
  currentUser.value = await SharedPreferenceService.getUser();

}

