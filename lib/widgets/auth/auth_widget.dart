import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16.0, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Login to your account'),
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите кнопку, чтобы начать.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text('Регистрация'),
            style: AppButtonStyle.linkButton,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите кнопку, чтобы отправить письмо повторно.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text('Подтвердить email'),
            style: AppButtonStyle.linkButton,
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');

  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('Open app');
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
      print('show error');
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset passwword');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const textFieldBorderColor = Color(0xFF01B4E4);
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldBorderColor)),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      isCollapsed: true,

      // 01B4E4
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)
          Text(errorText, style: const TextStyle(color: Colors.red)),
        const Text('Имя пользователя', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        const SizedBox(height: 20),
        const Text('Пароль', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: AppButtonStyle.mainButton,
              child: const Text('Войти'),
            ),
            const SizedBox(width: 30),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text('Сбросить пароль'),
            ),
          ],
        )
      ],
    );
  }
}
