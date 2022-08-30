import 'package:flutter/material.dart';
import 'menu.dart';
import 'model/user_Model.dart';
import 'bdd/mysql.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cooking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Center(
                    child: Text('Login'),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: FormValidator.validateEmail,
                  onSaved: (value) {
                    email = value!.trim();
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Mot de passe"),
                  obscureText: true,
                  validator: FormValidator.validatePassword,
                  onSaved: (value) {
                    password = value!.trim();
                  },
                ),
                ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                )
              ],
            )),
      ),
    );
  }

  login() async {
    final FormState? form = _formkey.currentState;
    if (!form!.validate()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Les données renseignées ne sont pas valides')));
      });
    } else {
      form.save();
      if (password == '123456789' && email == 'test@test.fr') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'Cooking')),
        );
      }
    }
  }
}
class FormValidator {
   static String? validateEmail(String? email) {
    if (email!.isEmpty) return "Le champ email est vide";
    Pattern pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(email)) {
      return "Votre email est incorrect";
    }
    return null;
  }

   static String? validatePassword(String? value) {
    if (value!.isEmpty) return 'Le champ mot de passe est vide';
    if (value.length < 8) return 'Le mot de passe doit contenir au moins 8 caractères';
    return null;
  }
}