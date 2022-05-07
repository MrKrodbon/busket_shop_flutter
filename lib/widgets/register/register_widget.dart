import 'package:busket_shop/Theme/appButtonStyle.dart';
import 'package:busket_shop/Theme/app_colors.dart';
import 'package:busket_shop/Theme/decoration_textFields.dart';
import 'package:busket_shop/modelUser/modelUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

User user = User();

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey();
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPass = TextEditingController();
  final _nameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();
  final _emailFocus = FocusNode();
  @override
  void dispose() {
    _nameFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Реєстрація',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainLightBlack,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Створення облікового запису легке та доступне.\nЗаповніть форму нижче, щоб почати.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _nameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _nameFocus, _emailFocus);
                  },
                  controller: _controllerName,
                  decoration: InputDecoration(
                    label: const Text(
                      'Ім\'я',
                      style: TextStyle(fontSize: 20),
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    icon: const Icon(Icons.person),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[A-Za-z]'),
                    ),
                  ],
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) => user.name = newValue!,
                  validator: (val) =>
                      val!.isEmpty ? 'Поле "Ім\'я порожнє' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _emailFocus,
                  controller: _controllerEmail,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _emailFocus, _passwordFocus);
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: const Text(
                      'Електронна пошта',
                      style: TextStyle(fontSize: 20),
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    icon: const Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => user.email = newValue!,
                  validator: (val) =>
                      val!.isEmpty ? 'Поле пошта порожнє' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _passwordFocus,
                  controller: _controllerConfirmPass,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _passwordFocus, _confirmFocus);
                  },
                  decoration: InputDecoration(
                    label: const Text(
                      'Пароль',
                      style: TextStyle(fontSize: 20),
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: const IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: null,
                    ),
                    icon: const Icon(Icons.shield),
                  ),
                  obscuringCharacter: '*',
                  obscureText: true,
                  validator: (val) =>
                      val!.isEmpty ? 'Поле пароль порожнє' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _confirmFocus,
                  controller: _controllerPassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: const Text(
                      'Підтвердіть пароль',
                      style: TextStyle(fontSize: 20),
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    icon: const Icon(Icons.edit),
                  ),
                  obscuringCharacter: '*',
                  obscureText: true,
                  validator: (val) =>
                      val!.isEmpty ? 'Поле підтвердження паролю порожнє' : null,
                ),
                const Text(
                  'Натиснувши кнопку \'Зареструватися\' нижче, я підтверджую, що ознайомлений та згоден \n Умовами виористання та Політикою конфіденційності',
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      //Добавить функции валидации пароля и подтверждение регистрации
                      onPressed: _verified,
                      child: const Text(
                        'Реєстрація',
                        style: AppButtonStyle.textStyleButton,
                      ),
                      style: AppButtonStyle.linkButton,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: _rejection,
                      child: const Text(
                        'Відмова',
                        style: DecorationTextFormFields.textStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _verified() {
    if (_formKey.currentState == null) {
      var snackBarError = SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Не всі поля форми заповнені'),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBarError);
    } else {
      _showDialog(name: _controllerName.text);

      Navigator.pushReplacementNamed(context, 'main_screen');
    }
  }

  void _showDialog({String? name}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text(
              'Registration succesful',
              style: TextStyle(color: Colors.green),
            ),
            content: Text(
              '$name is verified',
              style: const TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: _verified,
                child: const Text('yes'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('no')),
            ],
          );
        });
  }

  void _rejection() {
    Navigator.popAndPushNamed(context, 'auth');
  }
}
