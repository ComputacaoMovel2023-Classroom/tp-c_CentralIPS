import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import '../loginPage/login_page.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _numberController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _birthdateController = TextEditingController();
final TextEditingController _genderController = TextEditingController();
final TextEditingController _roleController = TextEditingController();
final TextEditingController _photoController = TextEditingController();

final FirebaseAuth auth = FirebaseAuth.instance;

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

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
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
          validator: emailValidator,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira um email';
  } else if (!value.contains('@')) {
    return 'Insira um email válido';
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

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Password',
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
          validator: passwordValidator,
          controller: _passwordController,
          obscureText: true,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza a sua password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira a sua password';
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
            final UserCredential userCredential =
                await auth.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );
            final userRef = FirebaseDatabase.instance
                .ref()
                .child('users')
                .child(userCredential.user!.uid);

            userCredential.user?.updatePhotoURL(_photoController.text);
            userCredential.user?.updateDisplayName(_nameController.text);

            await userRef.set({
              'name': _nameController.text,
              'photo': _photoController.text,
              'number': _numberController.text,
              'birthdate': _birthdateController.text,
              'gender': _genderController.text,
              'role': _roleController.text,
            });

            //create ipshealth user
            final ipshealthUserRef = FirebaseDatabase.instance
                .ref('ipshealth/${userCredential.user?.uid}');

            //set a data of today
            final DateTime now = DateTime.now();
            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            final String formatted = formatter.format(now);

            await ipshealthUserRef.set({formatted: 0});

            // Imprima o UID do usuário recém-criado
            print(userCredential.user?.uid);

            //if is all valid send a verification email
            await userCredential.user?.sendEmailVerification();
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Erro'),
                    content: const Text('A senha fornecida é muito fraca.'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              return;
            } else if (e.code == 'email-already-in-use') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Erro'),
                    content: const Text(
                        'O e-mail fornecido já está em uso por outra conta.'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              return;
            }
          } catch (e) {
            print(e);
          }
//wait for check if the email is not being use

          // If the form is valid, display a Snackbar.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email De verificação enviado!')),
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
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

Widget buildLoginBtn(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    },
    child: RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'Já tem uma conta? ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: 'Iniciar Sessão',
            style: TextStyle(
                color: Colors.blue.shade300,
                fontSize: 18,
                fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    DateTime birthdate;
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
                          'Registar',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Registe-se na nossa aplicação',
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
                              buildEmail(),
                              const SizedBox(height: 15),
                              buildBirthdate(context),
                              const SizedBox(height: 15),
                              buildGender(context),
                              const SizedBox(height: 15),
                              buildRole(context),
                              const SizedBox(height: 15),
                              buildNumber(),
                              const SizedBox(height: 15),
                              buildPassword(),
                              const SizedBox(height: 15),
                              buildPhoto(),
                              const SizedBox(height: 15),
                              buildRegisterBtn(context, _formKey),
                              const SizedBox(height: 5),
                              buildLoginBtn(context),
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
