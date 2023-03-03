import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/models/KYC.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../repository/kyc_repository.dart';

class KYCController extends ControllerMVC {
  Future<bool> requestForKYC(KYCDetails details) async {
    var KYCRequested = false;
    // details.PanCardIMAGE =
    //     "https://w7.pngwing.com/pngs/157/146/png-transparent-pan-card.png";
    // details.AadharImage =
    //     "https://e7.pngegg.com/pngimages/745/620/png-clipart-aadhaar-targeted-delivery-of-financial-and-other-subsidies-benefits-and-services-act-2016-paper-card-printer-national-payments-corporation-of-india-pvc-card-miscellaneous-ribbon.png";

    await KYCRepository.requestKYC(details).then((value) {
      SharedPreferenceService.setKYC(true);
    });
    return KYCRequested;
  }
}
