// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../widget/customButton.dart';
import '../../../../widget/customTextField.dart';

class PanPage extends StatefulWidget {
  @override
  _PanPageState createState() => _PanPageState();
}

class _PanPageState extends State<PanPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _panController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.image,
                              color: Colors.black87,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of('Verify Your PAN'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                      ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of('Upload PAN Card Image'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color:
                                          Theme.of(context).appBarTheme.color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      letterSpacing: 0.6,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: _nameController,
                          hintText: AppLocalizations.of('Name*'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            AppLocalizations.of('As on PAN card'),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 10,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: _panController,
                          hintText: AppLocalizations.of('PAN number*'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            AppLocalizations.of('10 Digit PAN no.'),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 10,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: _dateController,
                          hintText: AppLocalizations.of('Date ob birth*'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: _stateController,
                          hintText: AppLocalizations.of('Enter state'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            AppLocalizations.of('All fields are mandatory'),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black54,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            AppLocalizations.of(
                                'Why should I submit my PAN card?'),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: CustomButton(
                            text:
                                AppLocalizations.of('Submit For Verification'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
