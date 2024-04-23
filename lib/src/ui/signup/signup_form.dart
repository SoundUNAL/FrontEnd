import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';
import 'package:sound_frontend/src/ui/utils/has_account.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

const List<String> rolelist = <String>['Oyente', 'Artista'];

final TextEditingController _dateController = TextEditingController();

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    var col1 = [
      TextFormField(
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.orange,
        onSaved: (name) {},
        decoration: const InputDecoration(
          hintText: "Name",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.person),
          ),
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.orange,
        onSaved: (lastname) {},
        decoration: const InputDecoration(
          hintText: "Last Name",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.person),
          ),
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.orange,
        onSaved: (email) {},
        decoration: const InputDecoration(
          hintText: "Email",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.person),
          ),
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.orange,
        onSaved: (username) {},
        decoration: const InputDecoration(
          hintText: "Username",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.person),
          ),
        ),
      ),
    ];
    var col2 = [
      TextFormField(
        textInputAction: TextInputAction.done,
        obscureText: true,
        cursorColor: Colors.orange,
        decoration: const InputDecoration(
          hintText: "Password",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.lock),
          ),
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.orange,
        onSaved: (phone) {},
        decoration: const InputDecoration(
          hintText: "Phone Number",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.phone),
          ),
        ),
      ),
      const SelectBirthDate(),
      const SelectRole(),
    ];
    return Form(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: col1),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: col2,
              )),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Sign Up".toUpperCase(),
            ),
          ),
          const SizedBox(height: 16),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SelectBirthDate extends StatelessWidget {
  const SelectBirthDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _dateController,
            readOnly: true, // Impide la edición directa del campo de texto
            decoration: const InputDecoration(
              hintText: 'Seleccionar fecha de nacimiento',
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.calendar_today),
              ),
              //border: OutlineInputBorder(),
            ),
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                _dateController.text = pickedDate.toString();
              }
            },
          ),
        ],
      ),
    );
  }
}

class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  String? _selectedRole;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedRole,
      icon: const Icon(Icons.person_2_outlined),
      style: const TextStyle(color: Colors.white),
      /*underline: Container(
        height: 2,
        color: Colors.white,
      ),*/
      hint: const Text('Elige tu rol'),
      padding: const EdgeInsets.all(8),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          _selectedRole = value!;
        });
      },
      items: rolelist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}