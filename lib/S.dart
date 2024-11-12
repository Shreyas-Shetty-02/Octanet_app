import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/pref_utils.dart';
import 'package:Octanet/features/profile/controller/pincode_controller.dart';
import 'package:Octanet/features/profile/controller/profile_controller.dart';
import 'package:Octanet/features/profile/models/pincode_model.dart';
import 'package:Octanet/features/profile/models/profile_request_model.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/password_textfield.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';

class S extends StatefulWidget {
  const S({super.key});

  @override
  State<S> createState() => SState();
}

class SState extends State<S> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  City? selectedCity;
  int? selectedCityID;
  String? selectedDistrict;
  String? selectedState;
  String? selectedCountry;

  bool isEditing = false;

  int selectedContainerIndex = 0;

  @override
  void initState() {
    super.initState();
    final profileController = Get.find<ProfileController>();
    profileController.profileData.listen((data) {
      ownerNameController.text = data.ownerName ?? '';
      companyNameController.text = data.companyName ?? '';
      emailController.text = data.email ?? '';
      phoneNumberController.text = data.phoneNumber ?? '';
      addressLine1Controller.text = data.addressLine1 ?? '';
      addressLine2Controller.text = data.addressLine2 ?? '';
      pincodeController.text = data.pinCode ?? '';
      selectedCityID = data.cityId ?? 0;
    });

    pincodeController.addListener(() {
      String pincode = pincodeController.text;
      if (pincode.isNotEmpty) {
        Get.find<PincodeController>().fetchPincodeData(pincode);
      }
    });
  }

  void switchContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  void toggleEditMode() {
    setState(() {
      isEditing = true;
    });
  }

  void saveProfile() {
    final profileController = Get.find<ProfileController>();
    final pincodeResponseController = Get.find<PincodeController>();
    final Map<String, dynamic> requestData = {
      'owner_name': ownerNameController.text,
      'company_name': companyNameController.text,
      'email': emailController.text,
      'phone_number': phoneNumberController.text,
      'address_line1': addressLine1Controller.text,
      'address_line2': addressLine2Controller.text,
      'pin_code': pincodeController.text,
      'city_id': selectedCityID,
      'district_id': pincodeResponseController.pincodeData.value.districtId,
      'state_id': pincodeResponseController.pincodeData.value.stateId,
      'country': pincodeResponseController.pincodeData.value.countryName,
    };

    profileController
        .submitProfileData(ProfileRequest.fromJson(requestData))
        .then((response) {
      if (response) {
        Get.snackbar(
          'Success',
          'Your profile has been updated.',
          backgroundColor: const Color(0xFF009345),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to update your profile.',
          backgroundColor: const Color(0xFFEC1C24),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
      }
    });

    setState(() {
      isEditing = false;
    });
  }

  void savePassword() {
    if (oldPassController.text.isEmpty ||
        newPassController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter the Password',
        backgroundColor: const Color(0xFFEC1C24),
        colorText: Colors.white,
        borderRadius: 0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
      return;
    } else if (newPassController.text != confirmPassController.text) {
      Get.snackbar(
        'Error',
        'Password doesn\'t matches',
        backgroundColor: const Color(0xFFEC1C24),
        colorText: Colors.white,
        borderRadius: 0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
      return;
    } else if (oldPassController.text.isNotEmpty &&
        newPassController.text.isNotEmpty &&
        confirmPassController.text.isNotEmpty &&
        newPassController.text == confirmPassController.text) {
      Get.snackbar(
        'Success',
        'Password updated successfully!',
        backgroundColor: const Color(0xFF009345),
        colorText: Colors.white,
        borderRadius: 0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pincodeResponseController = Get.find<PincodeController>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF000000),
      appBar: buildAppBar(
        title: 'S - Profile',
        scaffoldKey: _scaffoldKey,
        context: context,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Icons/drawer_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(
                      'assets/Icons/octanet_logo.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    buildDrawerButton(
                      image: 'assets/Icons/dashboard/dashboard.png',
                      label: 'Dashboard',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.dashboardRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/map/map.png',
                      label: 'Map',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.mapRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/mikrotik/mikrotik.png',
                      label: 'Mikrotik Info',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.mikrotikRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/olt/olt.png',
                      label: 'OLT Devices',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.oltRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/reports/reports.png',
                      label: 'Reports',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.reportsRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/help/help.png',
                      label: 'Help',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.queryRoute);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.name,
                            controller: ownerNameController,
                            labeltext: 'Owner Name',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.name,
                            controller: companyNameController,
                            labeltext: 'Company Name',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            labeltext: 'Email',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.phone,
                            controller: phoneNumberController,
                            labeltext: 'Phone Number',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.streetAddress,
                            controller: addressLine1Controller,
                            labeltext: 'Address Line 1',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.streetAddress,
                            controller: addressLine2Controller,
                            labeltext: 'Address Line 2',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.number,
                            labeltext: 'Pincode',
                            controller: pincodeController,
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Obx(() {
                            if (pincodeResponseController
                                .cityOptions.isNotEmpty) {
                              for (var city
                                  in pincodeResponseController.cityOptions) {
                                if (selectedCityID == city.cityId) {
                                  selectedCity = city;
                                }
                              }
                            } else {
                              selectedCity = null;
                            }
                            return Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A1A1A),
                                  border: Border.all(
                                      color: const Color(0xFF666666)),
                                ),
                                child: DropdownButtonFormField<City>(
                                  value: selectedCity,
                                  dropdownColor: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                  icon: Container(),
                                  style: TextStyle(color: Color(0xFFFFFFFF)),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'City',
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF808080),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: isEditing
                                      ? (newValue) {
                                          setState(() {
                                            selectedCity = newValue!;
                                            selectedCityID = newValue.cityId;
                                          });
                                        }
                                      : null,
                                  items: pincodeResponseController.cityOptions
                                      .map<DropdownMenuItem<City>>((city) {
                                    return DropdownMenuItem<City>(
                                      value: city,
                                      child: Text(city.cityName!),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildDropdown<int>(
                            value: pincodeResponseController
                                .pincodeData.value.districtId,
                            label: 'District',
                            onChanged: isEditing
                                ? (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        selectedDistrict = newValue as String;
                                      });
                                    }
                                  }
                                : null,
                            items: [
                              DropdownMenuItem<int>(
                                value: pincodeResponseController
                                    .pincodeData.value.districtId,
                                child: Text(
                                  pincodeResponseController
                                          .pincodeData.value.districtName ??
                                      'District',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildDropdown<int>(
                            value: pincodeResponseController
                                .pincodeData.value.stateId,
                            label: 'State',
                            onChanged: isEditing
                                ? (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        selectedState = newValue as String;
                                      });
                                    }
                                  }
                                : null,
                            items: [
                              DropdownMenuItem<int>(
                                value: pincodeResponseController
                                    .pincodeData.value.stateId,
                                child: Text(
                                  pincodeResponseController
                                          .pincodeData.value.stateName ??
                                      'State',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildDropdown<String>(
                            value: pincodeResponseController
                                .pincodeData.value.countryName,
                            label: 'Country',
                            onChanged: isEditing
                                ? (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        selectedCountry = newValue;
                                      });
                                    }
                                  }
                                : null,
                            items: [
                              DropdownMenuItem<String>(
                                value: pincodeResponseController
                                    .pincodeData.value.countryName,
                                child: Text(
                                  pincodeResponseController
                                          .pincodeData.value.countryName ??
                                      'Country',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildButtons(
                              label: 'Edit', onPressed: toggleEditMode),
                          const Spacer(),
                          buildButtons(
                            label: 'Save',
                            onPressed: isEditing ? saveProfile : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          PasswordTextField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: oldPassController,
                            labeltext: 'Old Password',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          PasswordTextField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: newPassController,
                            labeltext: 'New Password',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          PasswordTextField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: confirmPassController,
                            labeltext: 'Confirm Password',
                            enabled: isEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildButtons(
                              label: 'Edit', onPressed: toggleEditMode),
                          const Spacer(),
                          buildButtons(
                            label: 'Save',
                            onPressed: savePassword,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    color: const Color(0xFFE6E6E6),
                    child: TextButton(
                      onPressed: () {
                        PrefUtils().deleteToken();
                        PrefUtils().deleteUser();
                        PrefUtils().deleteLogin();
                        Get.offAllNamed(MyRoutes.loginRoute);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Icons/log_out.png',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'Log Out',
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF000000)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField({
  required TextInputType keyboardType,
  required TextEditingController controller,
  required String labeltext,
  required bool enabled,
}) {
  return Expanded(
    child: TextSelectionTheme(
      data: const TextSelectionThemeData(
        selectionColor: Color(0x33000000),
        selectionHandleColor: Color(0xFF808080),
      ),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: const Color(0xFFFFFFFF),
        style: TextStyle(color: Color(0xFFFFFFFF)),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(
            color: Color(0xFF808080),
          ),
          filled: false,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF808080)),
            borderRadius: BorderRadius.zero,
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF808080)),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 7.5),
        ),
        obscureText: false,
        enabled: enabled,
      ),
    ),
  );
}

Widget buildDropdown<T>({
  required T? value,
  required List<DropdownMenuItem<T>> items,
  required ValueChanged<T?>? onChanged,
  required String label,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border.all(color: const Color(0xFF666666)),
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        dropdownColor: const Color(0xFFFFFFFF),
        icon: Container(),
        style: TextStyle(color: Color(0xFFFFFFFF)),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xFF808080),
            fontWeight: FontWeight.bold,
          ),
        ),
        onChanged: onChanged,
        items: items,
      ),
    ),
  );
}
