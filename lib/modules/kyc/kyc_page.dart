import 'dart:convert';
import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/AuthController.dart';
import 'package:newsports/controllers/KYCController.dart';

import 'package:newsports/utils/shared_preference_services.dart';
import '../../models/KYC.dart';
import '../../models/kycStatus.dart';
import '../../repository/kyc_repository.dart';

class KYCForm extends StatefulWidget {
  @override
  _KYCFormState createState() => _KYCFormState();
}

class _KYCFormState extends StateMVC<KYCForm> {
  final _formKey = GlobalKey<FormState>();
  final kyc = KYCDetails();

  final aadharDOBController = TextEditingController();
  final panDOBController = TextEditingController();

  String panCardPath = "";
  String aadhaarCardPath ="";

  String? _countryName ;
  

  
  
  

  AuthController _authController = AuthController();
  late KYCController _con;
  bool loading = false;
  bool requested = false;

  _KYCFormState() : super(KYCController()) {
    _con = controller as KYCController;
  }

  // setLoading(bool loading) => setState(() => this.loading = loading);
  // startLoading() => setLoading(true);
  // stopLoading() => setLoading(false);

  @override
  void initState() {
    super.initState();
    initAsync();
    // SharedPreferenceService.getKYC().then((v) => setState(() => requested = v));
  }

  @override
  Future<bool> initAsync() {
    _con.getKYCStatus(context);
    return super.initAsync();
  }


  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                'KYC Form',
              ),
            ),
            body: _con.kycStatus.loading ? Center(child: CircularProgressIndicator(),) :
            _con.kycStatus.value!.verified ?
                Center(child: Text('Your Kyc is Verified'))
                : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: _con.kycStatus.value!.waiting
                      ?Center(child: Text(
                      "please check your kyc status after 12 hours",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(),
                    ),
                  ): Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(_con.kycStatus.value!.rejected) statusWidget(_con.kycStatus.value!),
                                // TextFormField(
                                //   decoration:
                                //       InputDecoration(labelText: 'City'),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please enter a city';
                                //     }
                                //     return null;
                                //   },
                                //   onSaved: (value) {
                                //     kyc.city = value ?? "";
                                //   },
                                // ),
                                // TextFormField(
                                //   decoration:
                                //   InputDecoration(labelText: 'State'),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please enter a state';
                                //     }
                                //     return null;
                                //   },
                                //   onSaved: (value) {
                                //     kyc.state = value!;
                                //   },
                                // ),



                                TextFormField(
                                  decoration: InputDecoration(labelText: 'Pin Code'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a pin code';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Please enter a valid pin code';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.pinCode = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Account Name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a account name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.userAccountName = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Account Number'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an account number';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Please enter a valid account number';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.accountNumber = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(labelText: 'Bank Name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a bank name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.bankName = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(labelText: 'IFSC Code'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a ifsc code';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.ifscCode = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(labelText: 'Aadhaar Number'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an Aadhaar number';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Please enter a valid Aadhaar number';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.AadharNumber = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Name on Aadhaar Card'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the name on your Aadhaar card';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.NameInAadher = value!;
                                  },
                                ),
                                TextFormField(
                                  controller: aadharDOBController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'DOB on Aadhaar card',
                                    hintText: 'Select Date of Birth',
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());
                                    if (pickedDate != null) {
                                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                      setState(() {
                                        aadharDOBController.text = formattedDate;
                                      });
                                    }
                                  },
                                  onSaved: (value) {
                                    kyc.PanCardDOB = value!;
                                    // _pancardDob = value??"";
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select Date of Birth';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(labelText: 'Pan Number'),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value?.isEmpty == true) {
                                      return 'Please enter a PAN number';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.PanNumber = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Name on Pan Card'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the name on your PAN card';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    kyc.NameInPanCard = value ?? "";
                                  },
                                ),
                                TextFormField(
                                  controller: panDOBController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Pan card DOB',
                                    hintText: 'Select Date of Birth',
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        panDOBController.text = formattedDate;
                                      });
                                    }
                                  },
                                  onSaved: (value) {
                                    kyc.PanCardDOB = value!;
                                    // _pancardDob = value??"";
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select Date of Birth';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Address',style: Theme.of(context).textTheme.titleMedium,),
                                ),
                                CSCPicker(
                                  disableCountry: true,
                                  showStates: true,
                                  showCities: true,
                                  flagState: CountryFlag.ENABLE,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color:
                                    Theme.of(context).backgroundColor,
                                    border: Border.all(
                                      color: (Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .color!),
                                    ),
                                  ),
                                  disabledDropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Colors.grey.shade300,
                                    border: Border.all(
                                      color: (Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .color!),
                                    ),
                                  ),
                                  countrySearchPlaceholder: AppLocalizations.of("Country"),
                                  stateSearchPlaceholder: AppLocalizations.of("State"),
                                  citySearchPlaceholder: AppLocalizations.of("City"),
                                  countryDropdownLabel: AppLocalizations.of(_countryName ?? "Country"),
                                  stateDropdownLabel: AppLocalizations.of(kyc.state.isNotEmpty ? kyc.state: "State"),
                                  cityDropdownLabel: AppLocalizations.of(kyc.city.isNotEmpty ? kyc.city: "City"),
                                  defaultCountry: CscCountry.India,
                                  selectedItemStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Theme.of(context).textTheme.bodyMedium!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 14,
                                  ),
                                  dropdownHeadingStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Theme.of(context).textTheme.caption!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 14,
                                  ),
                                  dropdownItemStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Theme.of(context).textTheme.caption!.color,
                                    letterSpacing: 0.6,
                                    fontSize: 14,
                                  ),
                                  dropdownDialogRadius: 10.0,
                                  searchBarRadius: 30.0,
                                  onCountryChanged: (value) {
                                    setState(() {
                                      _countryName = value;
                                    });
                                  },
                                  onStateChanged: (value) {
                                    setState(() {
                                      kyc.state = value??'';
                                    });
                                  },
                                  onCityChanged: (value) {
                                    setState(() {
                                      kyc.city = value??'';
                                    });
                                  },
                                ),
                                // Pan card Image Field
                                SizedBox(height: 20,),
                                if(aadhaarCardPath.isNotEmpty)
                                  Container(
                                  padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: Image.file(File(aadhaarCardPath),height: 200,errorBuilder: (c,o,s){
                                      return Text("error");
                                    },),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      pickImages(context,(file){
                                        print(' file path ${file.path}');
                                        setState(() {
                                          aadhaarCardPath = file.path;
                                        });
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(14)
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15),
                                      child: Text("Select Aadhaar Image",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                                if(panCardPath.isNotEmpty)
                                  Container(
                                  padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: Image.file(File(panCardPath),height: 200,),
                                  ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      pickImages(context,(file){
                                        print('file path :${file.path}');
                                          setState(() {
                                            panCardPath = file.path;
                                          });
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(14)
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15),
                                      child: Text("Select Pan Card Image",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),

                                // Submit Button
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate() || kDebugMode) {
                                        _formKey.currentState!.save();
                                        final success = await _con.requestForKYC(context,
                                            kyc,
                                            File(aadhaarCardPath),
                                            File(panCardPath)
                                        );

                                        // _authController.upDateKYCStatus(FirebaseAuth.instance.currentUser!.uid, true);

                                        setState(() {
                                          requested = success;
                                        });
                                        // success ? showToast("KYC details uploaded successful")
                                        //     : showToast("KYC details uploaded successful");
                                      }
                                    },
                                    child: Text('Submit'),
                                  ),
                                ),
                                if(kDebugMode)
                                  Container(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      kyc.pinCode ='500034';
                                      kyc.accountNumber ='1234567890';
                                      kyc.userAccountName ='Venkatesh';
                                      kyc.bankName ='Union Bank';
                                      kyc.ifscCode ='FC13243';
                                      kyc.AadharNumber ='1234567890';
                                      kyc.PanNumber ='1234567890';
                                      kyc.NameInAadher ='Venkatesh';
                                      kyc.NameInPanCard ='Venkatesh';
                                      kyc.DOBInAadher = '2002-03-29';
                                      aadharDOBController.text = '2002-03-29';
                                      panDOBController.text = '2002-03-29';
                                      kyc.PanCardDOB = '2002-03-29';
                                      kyc.state ='Telangana';
                                      kyc.city ='Hyderabad';
                                      setState(() {});
                                    },
                                    child: Text('Load Moc'),
                                  ),
                                ),

                              ])),
                )),
          ),

          if (_con.loading )
            Container(
              color: Colors.grey.shade50.withOpacity(0.4),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget statusWidget(KYCStatus status){
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          child: Container(
            width: double.infinity,
            height: 50,
            color: status.panStatus!='2'?Colors.green:Colors.red,
            alignment: Alignment.center,
            child: Text(KYCStatus.getString(status.panStatus, "PAN Card"),style: TextStyle(
              color: Colors.white
            ),),
          ),
        ),
        SizedBox(height: 10,),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          child: Container(
            width: double.infinity,
            height: 50,
            color: status.aadharStatus!='2'?Colors.green:Colors.red,
            alignment: Alignment.center,
            child: Text(KYCStatus.getString(status.aadharStatus, "Aadhar Card"),style: TextStyle(
                color: Colors.white
            )),
          ),
        ),
        Divider()
      ],
    );
  }


  // showToast(text) {
  //   return Fluttertoast.showToast(
  //       msg: text,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       fontSize: 16.0);
  // }


// ----------------------convert file into base64-----------------------//
  String convertIntoBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64File = base64Encode(imageBytes);
    return base64File;
  }

//---------------------pick imgae dailog----------------------------//
  pickImages(context,Function(XFile) onComplete) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: EdgeInsets.all(20),
              height: 70,
              color: Theme.of(context).primaryColor,
              child: Text(
                AppLocalizations.of("Pick or Capture Image"),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      fontSize: 18,
                    ),
              ),
            ),
            content: SizedBox(),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            var _picker = ImagePicker();
                            var img = await _picker.pickImage(
                              source: ImageSource.camera ,
                            );
                            if(img!=null) {
                              onComplete(img);
                            }
                          },
                          icon: Icon(Icons.camera_alt,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .color)),
                      Text(
                        AppLocalizations.of("Camera"),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            var _picker = ImagePicker();
                            var img = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if(img!=null) {
                              onComplete(img);
                            }

                          },
                          icon: Icon(Icons.image,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .color)),
                      Text(
                        AppLocalizations.of("Gallery"),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }
}
