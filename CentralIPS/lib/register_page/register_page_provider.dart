import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/homePage/home_page_ui.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

import 'package:intl/intl.dart';

class RegisterPageProvider extends StatefulWidget {
  const RegisterPageProvider({super.key});

  @override
  _RegisterPageProviderState createState() => _RegisterPageProviderState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _numberController = TextEditingController();
final TextEditingController _birthdateController = TextEditingController();
final TextEditingController _genderController = TextEditingController();
final TextEditingController _roleController = TextEditingController();
final TextEditingController _photoController = TextEditingController();

User? user = FirebaseAuth.instance.currentUser;

Widget buildName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Nome Completo',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          validator: userNameValidator,
          controller: _nameController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu nome',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? userNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o seu nome';
  }
  return null; // Return null if the validation passes
}

Widget buildPhoto() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Url do Avatar',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          validator: userPhtolidator,
          controller: _photoController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o url do seu avatar',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? userPhtolidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o url do seu avatar';
  } //check if is an url or not
  else if ( //check if is a valid url
      !Uri.parse(value).isAbsolute ||
          !value.startsWith('http://') && !value.startsWith('https://') ||
          value.contains(' ')) {
    return 'Insira um url válido';
  }
  return null; // Return null if the validation passes
}

Widget buildBirthdate(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Data de Nascimento',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              // Format the date to show only the date part
              final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
              _birthdateController.text = formattedDate;
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              validator: birthDateValidator,
              controller: _birthdateController,
              keyboardType: TextInputType.datetime,
              style: const TextStyle(color: Colors.black87),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 6, left: 10),
                  hintText: 'Introduza a sua data de nascimento',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        ),
      )
    ],
  );
}

String? birthDateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira uma data';
  }
  final currentDate = DateTime.now();
  final enteredDate = DateTime.parse(value);
  if (!enteredDate.isBefore(currentDate)) {
    return 'Data não pode ser no futuro';
  }
  return null;
}

Widget buildGender(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Género',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: GestureDetector(
          onTap: () async {
            showMaterialScrollPicker<String>(
              context: context,
              title: 'Escolha o género',
              items: ["Masculino", "Feminino", "Outro"],
              selectedItem: _genderController.text,
              onChanged: (value) => _genderController.text = value,
            );
          },
          child: AbsorbPointer(
            child: TextFormField(
              validator: genderValidator,
              controller: _genderController,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.black87),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 6, left: 10),
                  hintText: 'Escolha o género',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        ),
      )
    ],
  );
}

String? genderValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira um género';
  }
  return null;
}

Widget buildRole(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Função',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: GestureDetector(
          onTap: () async {
            showMaterialScrollPicker<String>(
              context: context,
              title: 'Escolha a sua função',
              items: ["Estudante", "Docente", "Funcionário"],
              selectedItem: _roleController.text,
              onChanged: (value) => _roleController.text = value,
            );
          },
          child: AbsorbPointer(
            child: TextFormField(
              validator: roleValidator,
              controller: _roleController,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.black87),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 6, left: 10),
                  hintText: 'A sua função',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        ),
      )
    ],
  );
}

String? roleValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Introduza a sua função';
  }
  return null;
}

Widget buildNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Número de Estudante',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          validator: numberValidator,
          controller: _numberController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu número',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? numberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o seu número';
  } else if (value.length != 9) {
    return 'Insira um número válido';
  }
  return null;
}

Widget buildRegisterBtn(BuildContext context, GlobalKey<FormState> formKey) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            final userRef =
                FirebaseDatabase.instance.ref().child('users/${user?.uid}');
            user?.updatePhotoURL(_photoController.text);
            user?.updateDisplayName(_nameController.text);

            await userRef.set({
              'name': _nameController.text,
              'photo': _photoController.text,
              'number': _numberController.text,
              'birthdate': _birthdateController.text,
              'gender': _genderController.text,
              'role': _roleController.text,
            });

            //create ipshealth user
            final ipshealthUserRef =
                FirebaseDatabase.instance.ref('ipshealth/${user?.uid}');

            //set a data of today
            final DateTime now = DateTime.now();
            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            final String formatted = formatter.format(now);

            await ipshealthUserRef.set({formatted: 0});

            //catch error
          } catch (e) {
            print(e);
          }

          context.read<FooterMenuCubit>().selectItem(2);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: context.read<FooterMenuCubit>(),
                    child: const HomePage(),
                  )));
//wait for check if the email is not being use
        } else {
          print('not valid');
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 60),
        ),
      ),
      child: const Text(
        'Registar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _RegisterPageProviderState extends State<RegisterPageProvider> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        const Text(
                          'Dados',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Complete os seus dados',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              const SizedBox(height: 60),
                              buildName(),
                              const SizedBox(height: 15),
                              buildBirthdate(context),
                              const SizedBox(height: 15),
                              buildGender(context),
                              const SizedBox(height: 15),
                              buildRole(context),
                              const SizedBox(height: 15),
                              buildNumber(),
                              const SizedBox(height: 15),
                              buildPhoto(),
                              const SizedBox(height: 15),
                              buildRegisterBtn(context, _formKey),
                            ])),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
