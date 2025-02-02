import 'package:flutter/material.dart';
import 'success_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
          leading:
              const Icon(Icons.account_circle_outlined, color: Colors.white),
          title: const Text(
            "Welcome to iT",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const InputForm(),
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  // สร้างตัวควบคุมสำหรับ TextField

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // ล้างข้อมูลในตัวควบคุมเมื่อวิดเจ็ตถูกลบ
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    // รับค่าจาก TextField
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "test@gmail.com" && password == "1234") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SuccessPage()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ข้อมูล Login'),
            content: Text('อีเมลล์หรือรหัสผ่านไม่ถูกต้อง'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    // แสดง AlertDialog พร้อมข้อมูลที่กรอก
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'อีเมลล์',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'รหัสผ่าน',
              ),
            ),
            const SizedBox(height: 16),
            RawMaterialButton(
              onPressed: handleSubmit,
              fillColor: Colors.blue,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Click',
                style: TextStyle(color: Color(0xffffffff), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success page',
            style: TextStyle(fontSize: 24, color: Color(0xffffffff))),
        backgroundColor: Color(0xff000000),
      ),
      body: const Center(
        child: Text(
          'Welecome to the next page',
          style: TextStyle(fontSize: 24, color: Color(0xff1cff23)),
        ),
      ),
    );
  }
}
