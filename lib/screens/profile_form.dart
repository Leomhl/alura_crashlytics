import 'package:alura_crashlytics/components/transaction_auth_dialog.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('images/bytebank_logo.png'),
                ),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                      return value.length <= 3 ? 'Nome inválido!' : null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name'
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return value.length <= 3 ? 'Invalid email!' : null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email'
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return value.length != 11 ? 'Invalid cell phone!' : null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Cell phone'
                  ),
                ),
                TextFormField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return value.length != 11 ? 'Invalid CPF!' : null;
                  },
                  decoration: InputDecoration(
                      labelText: 'CPF (only numbers)'
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text('Save'),
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (contextDialog) {
                                return TransactionAuthDialog(
                                  onConfirm: (String password) {
                                    print(password);
                                    // _save(transactionCreated, password, context);
                                  },
                                );
                              });
                        },
                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}