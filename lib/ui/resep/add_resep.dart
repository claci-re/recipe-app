import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddResepPage extends StatefulWidget {
  const AddResepPage({super.key});

  @override
  _AddResepPageState createState() => _AddResepPageState();
}

class _AddResepPageState extends State<AddResepPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _ingredients = '';
  String _steps = '';
  String _imagePath = '';

  void _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imagePath = pickedFile.path;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Resep'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Judul Resep'),
                  onSaved: (value) {
                    _title = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Judul tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Bahan-bahan'),
                  onSaved: (value) {
                    _ingredients = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Bahan-bahan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Langkah-langkah'),
                  onSaved: (value) {
                    _steps = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Langkah-langkah tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _getImage,
                  icon: const Icon(Icons.file_upload),
                  label: const Text('Upload Gambar'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Implementasi penyimpanan resep
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      'Simpan Resep',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
