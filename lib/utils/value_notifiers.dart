


import 'package:flutter/material.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../models/Wallet.dart';
import '../models/user.dart';
import '../repository/wallet_repoditory.dart';

ValueNotifier<AppUser> currentUser = new ValueNotifier(AppUser());
ValueNotifier<Wallet> currentWallet = new ValueNotifier(Wallet());

Future<void> initValueNotifiers() async {
  currentUser.value = await SharedPreferenceService.getUser();
  try{
    final repo = WalletRepository();
    currentWallet.value = await repo.getWallet();
  }catch(e){

  }
}

