import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/pref_utils.dart';
import 'package:Octanet/features/profile/controller/pincode_controller.dart';
import 'package:Octanet/features/profile/controller/profile_controller.dart';
import 'package:Octanet/features/profile/models/pincode_model.dart';
import 'package:Octanet/features/profile/models/profile_request_model.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/custom_dropdown.dart';
import 'package:Octanet/features/widgets/password_textfield.dart';
import 'package:Octanet/features/widgets/permissions.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:Octanet/features/widgets/toggle_button.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? selectedImage;
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

  Future<void> pickImage() async {
    if (await requestPermission()) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    }
  }

  Future<bool> requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      showStoragePermissionDeniedDialog(context);
      return false;
    }
  }

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
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
    final profileController = Get.find<ProfileController>();
    final pincodeResponseController = Get.find<PincodeController>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'Profile',
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
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipOval(
                                child: Obx(() {
                                  final profilePhoto = profileController
                                      .profileData.value.profilePhoto;
                                  return Container(
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: Theme.of(context).brightness ==
                                    //             Brightness.dark
                                    //         ? const Color(0xFFCCCCCC)
                                    //         : const Color(0xFF1A1A1A),
                                    //   ),
                                    //   shape: BoxShape.circle,
                                    color: profilePhoto != null &&
                                            profilePhoto.isNotEmpty
                                        ? Color(0xFFFFFFFF)
                                        : Color(0xFF009345),
                                    // ),
                                    width: 72,
                                    height: 72,
                                    child: profilePhoto != null &&
                                            profilePhoto.isNotEmpty
                                        ? Center(
                                            child: Image.network(
                                              profilePhoto,
                                              fit: BoxFit.contain,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/Icons/profile_filled.png',
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Center(
                                            child: Image.asset(
                                              'assets/Icons/profile_filled.png',
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  );
                                }),
                              ),
                              //if (isEditing)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF000000),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: IconButton(
                                    onPressed: pickImage,
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xFFFFFFFF),
                                      size: 10,
                                    ),
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          buildTextField(
                            keyboardType: TextInputType.name,
                            controller: ownerNameController,
                            labeltext: 'Owner Name',
                            enabled: isEditing,
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            return buildDropdown<City>(
                              value: selectedCity,
                              label: 'City',
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
                              context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
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
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
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
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Theme',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.color,
                              )),
                          const Spacer(),
                          ToggleButton(),
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
                    color: const Color(0xFFCCCCCC),
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
                          Text('Log Out',
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xFF000000))),
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
