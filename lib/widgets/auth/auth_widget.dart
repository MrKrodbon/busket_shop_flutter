import 'package:busket_shop/Theme/app_colors.dart';
import 'package:busket_shop/Theme/decoration_textFields.dart';
import 'package:flutter/material.dart';
import 'package:busket_shop/Theme/appButtonStyle.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthState();
}

class _AuthState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Авторизація',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: AppColors.mainLightBlack,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: ListView(
          children: const [
            _HeaderWidget(),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Реєстрація у нашому інтернет-магазині дозволить Вам стати членом нашої великої баскетбольної сім\'ї🧡',
          style: TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: register,
          child: Text('Зареєструватись'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Якщо ви зареєструвалися але лист верифікації не прийшов. ',
          style: TextStyle(fontSize: 16),
        ),
        const TextButton(
          onPressed: null,
          child: Text('Відправити ще раз'),
        ),
      ],
    );
  }

  void register() {
    Navigator.of(context).pushReplacementNamed('register_screen');
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  final _loginAuthController = TextEditingController();
  final _passwordAuthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (errorMessage != null) ...[
            Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          TextFormField(
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
              icon: Icon(Icons.person),
            ),
            controller: _loginAuthController,
            validator: (val) => val!.isEmpty ? 'Введіть ім\'я' : null,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
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
              icon: Icon(Icons.shield),
               // TODO: Добавить изменение глазика на перечёркнутый 
              suffixIcon: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: null,
              ),
            ),
            controller: _passwordAuthController,
            validator: (pass) => pass!.isEmpty ? 'Введіть пароль' : null,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: auth,
                child: const Text(
                  'Підтвердити',
                  style: AppButtonStyle.textStyleButton,
                ),
                style: AppButtonStyle.linkButton,
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: resetPassword,
                child: const Text(
                  'Скинути пароль',
                  style: DecorationTextFormFields.textStyle,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void submitForm() {
    print("Form is valid");
  }

  void resetPassword() {
    if (_formKey.currentState!.validate()) {
      print("Reset password");
    }
  }

  void auth() {
    final login = _loginAuthController.text;
    final password = _passwordAuthController.text;

    if (login == 'admin' && password == 'admin') {
      errorMessage = '';
      print("Form is valid");
      Navigator.of(context).pushReplacementNamed('main_screen');
      /* navigator.push(
        MaterialPageRoute(
          builder: (context) => const MainScreenWidget(),
        ),
      ); */
    } else {
      _formKey.currentState!.validate();
      errorMessage = 'Не вірний логін чи пароль';
    }
    setState(() {});
  }
  /* void validateName(String value){
    final _nameExp = RegExp(r'^[A_Za-zА-яа-я]+$');
    if (value.isEmpty) {
       print('Введіть ім\'я');
    } else if(value !=_nameExp){
     print('Тільки букви підходять');
    }
    else{
      return null;
    }
    
  } */
}
