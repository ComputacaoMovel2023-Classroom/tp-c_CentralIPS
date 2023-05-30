//ui for form of new book

import 'package:centralips/Bibliographic%20Research/book.dart';
import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:centralips/Bibliographic%20Research/library.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:centralips/UTILS/DialogCentralIPS.dart';
import 'package:centralips/homePage/home_page_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class NewBookUI extends StatefulWidget {
  const NewBookUI({super.key});

  @override
  _NewBookUIState createState() => _NewBookUIState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _authorsController = TextEditingController();
final TextEditingController _editionController = TextEditingController();
final TextEditingController _isbnController = TextEditingController();
final TextEditingController _languageController = TextEditingController();
final TextEditingController _categoriesController = TextEditingController();
final TextEditingController _numberOfPagesController = TextEditingController();
final TextEditingController _schoolController = TextEditingController();
final TextEditingController _synopsisController = TextEditingController();
final TextEditingController _urlImageController = TextEditingController();

//list to save all the categories
List<BookCategory> _categoriesList = [
  // a list fo all the categories
  BookCategory.accao,
  BookCategory.aventura,
  BookCategory.biografias,
  BookCategory.conto,
  BookCategory.drama,
  BookCategory.romances,
  BookCategory.terror
];
//categorys selected
List<BookCategory> _selectedCategories = [];

//list for School
List<School> _schoolList = [
  // a list fo all the categories
  School.ese,
  School.ests,
  School.estb,
  School.esce,
  School.ess,
];

School selectedSchool = School.na;

//list for School selected

Widget buildName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Nome do Livro',
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
          validator: bookNameValidator,
          controller: _nameController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Nome do Livro',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? bookNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o nome do livro';
  }
  return null; // Return null if the validation passes
}

Widget buildAuthors() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Autores',
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
          validator: auhtorsValidator,
          controller: _authorsController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza nomes divididos por vírgula',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? auhtorsValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o nome do/s autor/es';
  }
  return null; // Return null if the validation passes
}

Widget builCategories(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'categorias',
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
            showMaterialCheckboxPicker<String>(
              headerColor: Colors.blue, // background color of the header area
              headerTextColor:
                  const Color(0xFFFFFFFF), // text fcolor of the header
              backgroundColor: const Color.fromARGB(
                  255, 255, 255, 255), // background color of the entire dialog
              buttonTextColor: const Color.fromARGB(
                  255, 0, 0, 0), // text color of the action bar buttons
              context: context,
              title: 'Escolha a/s categoria/s',
              items: //show the string of the categories
                  _categoriesList.map((category) => category.name).toList(),
              selectedItems:
                  _selectedCategories.map((category) => category.name).toList(),
              onChanged: (value) {
                _selectedCategories =
                    // use getCategoriesByName
                    value.map((name) => getCategoriesByName(name)).toList();

                _categoriesController.text = value.join(', ');
                print(_selectedCategories);
                print(value);
              },
            );
          },
          child: AbsorbPointer(
            child: TextFormField(
              validator: categoriesValidator,
              controller: _categoriesController,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.black87),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 6, left: 10),
                  hintText: 'Escolha a/s Categoria/s',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        ),
      )
    ],
  );
}

String? categoriesValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira pelo menos um categoria';
  }
  return null;
}

Widget buildEdition() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Número da Edição',
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
          validator: editionValidator,
          controller: _editionController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza a edição',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? editionValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira a edição';
  }
  return null;
}

Widget buildIsbn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'ISBN',
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
          validator: isbnValidator,
          controller: _isbnController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o ISBN',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? isbnValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o ISBN';
  } else if (value.length != 13) {
    return 'O ISBN deve ter 13 digitos';
  }
  return null;
}

//for language
Widget buildLanguage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Linguagem',
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
          validator: languageValidator,
          controller: _languageController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza a Linguagem',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? languageValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira a Linguagem';
  }
  return null;
}

// for number of pages
Widget buildNumberOfPages() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Número de Páginas',
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
          validator: numberOfPagesValidator,
          controller: _numberOfPagesController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o número de páginas',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? numberOfPagesValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira o número de páginas';
  }
  return null;
}

//for school
Widget buildSchool(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Escola',
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
              headerColor: Colors.blue, // background color of the header area
              headerTextColor:
                  const Color(0xFFFFFFFF), // text fcolor of the header
              backgroundColor: const Color.fromARGB(
                  255, 255, 255, 255), // background color of the entire dialog
              buttonTextColor: const Color.fromARGB(
                  255, 0, 0, 0), // text color of the action bar buttons
              context: context,
              title: 'Escolha a escola',
              items: //show the string of the categories
                  //print the name of the school

                  _schoolList.map((school) => school.name).toList(),
              selectedItem: selectedSchool.name,
              onChanged: (value) {
                print(value);
                selectedSchool = getSchoolByName(value);
                _schoolController.text = selectedSchool.name;
              },
            );
          },
          child: AbsorbPointer(
            child: TextFormField(
              validator: schoolValidator,
              controller: _schoolController,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.black87),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 6, left: 10),
                  hintText: 'Escolha a escola',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        ),
      )
    ],
  );
}

String? schoolValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira a escola';
  }
  return null;
}

// for synopsis
Widget buildSynopsis() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Sinopse',
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
        child: TextFormField(
          validator: synopsisValidator,
          controller: _synopsisController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: OutlineInputBorder(

                  //remove the line around the textformfield
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza a sinopse',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? synopsisValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira a sinopse';
  }
  return null;
}

Widget buildPhoto() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Url do Livro',
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
          validator: phtolidator,
          controller: _urlImageController,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o url do livro',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

String? phtolidator(String? value) {
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

//button to submit and save the info into the database
Widget buildRegisterBtn(BuildContext context, GlobalKey<FormState> formKey) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            //set a data of today

            //create a new book
            Book newBook = Book(
                name: _nameController.text,
                authors: _authorsController.text.split(','),
                school: selectedSchool,
                synopsis: _synopsisController.text,
                edition: _editionController.text,
                isbn: _isbnController.text,
                language: _languageController.text,
                numberOfPages: int.parse(_numberOfPagesController.text),
                categories: _selectedCategories,
                urlImage: _urlImageController.text);
            print(newBook.infoBook());

            //insert in the database

            // library method to add
            Library library = Library();
            library.addBookToDatabase(newBook);

            //catch error
          } catch (e) {
            print(e);
          }

          //show the success message
          /*ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registo efetuado com sucesso'),
              backgroundColor: Colors.green,
            ),
          );*/

          //show a dialog from utils

          showDialog(
              context: context,
              builder: (_) {
                return CentralIPSDialog.dialogRedirect(
                    context,
                    "Livro Criado Com Sucesso",
                    "assets/images/happyBook.png",
                    const HomePage());
              });

          /*  context.read<FooterMenuCubit>().selectItem(2);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: context.read<FooterMenuCubit>(),
                    child: const HomePage(),
                  )));*/
        } else {
          print('not valid');
        }
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5),
      child: const Text(
        'Registar',
        style: TextStyle(
            color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _NewBookUIState extends State<NewBookUI> {
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
                          'Novo Livro',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Insira os dados do livro',
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
                              buildAuthors(),
                              const SizedBox(height: 15),
                              builCategories(context),
                              const SizedBox(height: 15),
                              buildEdition(),
                              const SizedBox(height: 15),
                              buildIsbn(),
                              const SizedBox(height: 15),
                              buildLanguage(),
                              const SizedBox(height: 15),
                              buildNumberOfPages(),
                              const SizedBox(height: 15),
                              buildSchool(context),
                              const SizedBox(height: 15),
                              buildSynopsis(),
                              const SizedBox(height: 15),
                              buildPhoto(),
                              const SizedBox(height: 15),
                              buildRegisterBtn(context, _formKey),

                              /*buildBirthdate(context),
                              const SizedBox(height: 15),
                              buildGender(context),
                              const SizedBox(height: 15),
                              buildRole(context),
                              const SizedBox(height: 15),
                              buildNumber(),
                              const SizedBox(height: 15),
                              buildPhoto(),
                              const SizedBox(height: 15),
                              buildRegisterBtn(context, _formKey),*/
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
