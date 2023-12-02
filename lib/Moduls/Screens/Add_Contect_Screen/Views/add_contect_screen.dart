import 'dart:io';import 'package:contect_diary_1/Moduls/Screens/Add_Contect_Screen/Model/add_contect_model_contect_detail.dart';import 'package:contect_diary_1/Moduls/Screens/Add_Contect_Screen/Providers/contect_provider.dart';import 'package:flutter/material.dart';import 'package:image_picker/image_picker.dart';import 'package:provider/provider.dart';import '../../../../Utils/Global.dart';import '../Model/add_contect_image_model.dart';class add_conect_screen extends StatefulWidget {  const add_conect_screen({super.key});  @override  State<add_conect_screen> createState() => _add_conect_screenState();}class _add_conect_screenState extends State<add_conect_screen> {  @override  Widget build(BuildContext context) {    File? imageFile;    void selectFile() async {      XFile? file = await ImagePicker().pickImage(          source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);      if (file != null) {        imageFile = File(file.path);        // imageFile = File(file.path);      }    }    // ImagePicker picker = ImagePicker();    // File? pic;    return Scaffold(      appBar: AppBar(        title: const Text("Add Contect"),        centerTitle: true,        actions: [          IconButton(            onPressed: () {              Provider.of<ContectProvider>(context, listen: false).addContect(                contect_details: Contect(                  name: Global.name!,                  email: Global.email!,                  phone: Global.phone!,                ),              );              Global.nameController.clear();              Global.emailController.clear();              Global.phoneController.clear();              Navigator.pushNamed(context, 'home');            },            icon: const Icon(Icons.add),          ),        ],      ),      body: Stepper(        onStepContinue: () {          Provider.of<ContectProvider>(context, listen: false).stepContinue();        },        onStepCancel: () {          Provider.of<ContectProvider>(context, listen: false).stepCancel();        },        currentStep: Provider.of<ContectProvider>(context, listen: false)            .cI            .currentIndex,        steps: [          Step(            state: (Provider.of<ContectProvider>(context, listen: true)                        .cI                        .currentIndex ==                    0)                ? StepState.editing                : StepState.indexed,            isActive: (Provider.of<ContectProvider>(context, listen: true)                        .cI                        .currentIndex ==                    0)                ? true                : false,            title: const Text("Photo"),            content: GestureDetector(              // onTap: selectFile,              child: CircleAvatar(                // foregroundImage: AssetImage('lib/Utils/Assets/contact-icon.png'),                // foregroundImage: FileImage(                //   File(),                // ),                radius: 80,                // foregroundImage: AssetImage('lib/Utils/Assets/contact-icon.png'),                child: (imageFile != null)                    ? Image.file(                        File(imageFile!.path),                        fit: BoxFit.cover,                      )                    : const SizedBox(),              ),            ),          ),          Step(            state: (Provider.of<ContectProvider>(context, listen: false)                        .cI                        .currentIndex ==                    1)                ? StepState.editing                : StepState.indexed,            isActive: (Provider.of<ContectProvider>(context, listen: false)                        .cI                        .currentIndex ==                    1)                ? true                : false,            title: const Text("Name"),            content: TextFormField(              controller: Global.nameController,              onChanged: (val) {                Global.name = val;              },              decoration: const InputDecoration(                hintText: "Enter Your Name",                border: OutlineInputBorder(),              ),            ),          ),          Step(            state: (Provider.of<ContectProvider>(context, listen: false)                        .cI                        .currentIndex ==                    2)                ? StepState.editing                : StepState.indexed,            isActive: (Provider.of<ContectProvider>(context, listen: false)                        .cI                        .currentIndex ==                    2)                ? true                : false,            title: const Text("Phone"),            content: TextFormField(              maxLength: 10,              keyboardType: TextInputType.phone,              controller: Global.phoneController,              onChanged: (val) {                Global.phone = val;              },              decoration: const InputDecoration(                hintText: "Enter Your Phone Number",                border: OutlineInputBorder(),              ),            ),          ),          Step(            state: (Provider.of<ContectProvider>(context, listen: false)                        .cI                        .currentIndex ==                    3)                ? StepState.editing                : StepState.indexed,            isActive: (Provider.of<ContectProvider>(context, listen: false)                        .cI                        .currentIndex ==                    3)                ? true                : false,            title: const Text("Email"),            content: TextFormField(              controller: Global.emailController,              onChanged: (val) {                Global.email = val;              },              decoration: const InputDecoration(                hintText: "Enter Your email",                border: OutlineInputBorder(),              ),            ),          ),        ],      ),    );  }}