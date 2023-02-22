import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/controllers/KYCController.dart';
import 'package:newsports/utils/shared_preference_services.dart';
import '../../models/KYC.dart';

class KYCForm extends StatefulWidget {
  @override
  _KYCFormState createState() => _KYCFormState();
}

class _KYCFormState extends StateMVC<KYCForm> {
  final _formKey = GlobalKey<FormState>();
  final kyc = KYCDetails();

  final aadharDOBController = TextEditingController();
  final panDOBController = TextEditingController();

  late KYCController _con;
  bool loading = false;
  bool requested = false;

  _KYCFormState():super(KYCController()){
    _con = controller as KYCController;
  }

  setLoading(bool loading)=> setState(() => this.loading = loading);
  startLoading()=>setLoading(true);
  stopLoading()=>setLoading(false);

  @override
  void initState() {
    super.initState();
    SharedPreferenceService.getKYC().then((v) => setState(()=>requested = v));
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: loading,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.green,
                title: Text('My Form',),
                leading: InkWell(child: Icon(Icons.arrow_back),),

              ),
              body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(labelText: 'City'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a city';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  kyc.city = value??"";
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Pincode'),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a pincode';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter a valid pincode';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  kyc.pinCode = value!;
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'State'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a state';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  kyc.state = value!;
                                },
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Account Name'),
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
                                decoration:
                                    InputDecoration(labelText: 'Account Number'),
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
                                decoration: InputDecoration(labelText: 'ifsc code'),
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
                                decoration: InputDecoration(labelText: 'Aadher Number'),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an Aadhar number';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter a valid Aadhar number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  kyc.AadharNumber = value!;
                                },
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'name on Aadhar card'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the name on your Aadhar card';
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
                                  labelText: 'DOB on Aadhar card',
                                  hintText: 'Select Date of Birth',

                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:DateTime(1900),
                                      lastDate: DateTime.now()
                                  );
                                  if(pickedDate != null ){
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                    print(formattedDate);
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
                                decoration:
                                    InputDecoration(labelText: 'aadhar card status'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a aadhar card status';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  kyc.AadharStatus = value!;
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Pan Number'),
                                keyboardType: TextInputType.number,
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
                                decoration: InputDecoration(labelText: 'Name on pan card'),
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
                                  labelText: 'Pancard DOB',
                                  hintText: 'Select Date of Birth',
                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:DateTime(1900),
                                      lastDate: DateTime.now()
                                  );
                                  if(pickedDate != null ){

                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
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
                              // Pancard Image Field

                              // TextFormField(
                              //   decoration: InputDecoration(
                              //     labelText: 'Pancard Image',
                              //     hintText: 'Select Image',
                              //   ),
                              //   onTap: () {
                              //     // TODO: show image picker
                              //   },
                              //   onSaved: (value) {
                              //
                              //     // kyc.PanCardIMAGE = value ?? "";
                              //   },
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Please select an Image';
                              //     }
                              //     return null;
                              //   },
                              // ),

                              // Submit Button
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      startLoading();
                                      print("started loading");
                                      final success = await _con.requestForKYC(kyc);
                                      stopLoading();
                                      print("loading stopped");
                                      setState(() => requested = success);
                                    }
                                  },
                                  child: Text('Submit'),
                                ),
                              ),
                            ])),
                  )),
            ),
            if(loading) Container(
            color: Colors.grey.shade50.withOpacity(0.4),
            child: Center(child: CircularProgressIndicator()),
          ),
          ],
        ),
    );
  }
}
