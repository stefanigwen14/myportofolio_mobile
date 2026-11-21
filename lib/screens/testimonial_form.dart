import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class TestimonialFormPage extends StatefulWidget {
  const TestimonialFormPage({super.key});

  @override
  State<TestimonialFormPage> createState() => _TestimonialFormPageState();
}

class _TestimonialFormPageState extends State<TestimonialFormPage> {
  final _formKey = GlobalKey<FormState>();
  final RegExp format = RegExp(
    r'^https:\/\/drive\.google\.com\/thumbnail\?id=[a-zA-Z0-9_-]+(&sz=[a-zA-Z0-9]+)?$',
  );

  String _testimonialMessage = "";
  String _senderName = "Anonymous"; // default
  String _testimonialLink = "";
  String _relatedExperience = "Experience";

  final List<String> _relatedExperiences = [
    'Education',
    'Experience',
    'Project',
  ]; // Placeholder sementara karena belum ada integrasi dengan DRF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Testimonial Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Related Experience ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Pengalaman Terkait",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _relatedExperience,
                  items: _relatedExperiences
                      .map(
                        (experience) => DropdownMenuItem(
                          value: experience,
                          child: Text(experience),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _relatedExperience = newValue!;
                    });
                  },
                ),
              ),

              // === Testimonial Message ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Pesan Testimonial",
                    labelText: "Pesan Testimonial",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _testimonialMessage = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Pesan testimonial tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
          
              // === Sender Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Pengirim",
                    labelText: "Nama Pengirim",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _senderName,
                  onChanged: (String? value) {
                    setState(() {
                      _senderName = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama pengirim tidak boleh kosong!";
                    }
                    if (value.length > 30) {
                      return "Nama pengirim maksimal 30 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Testimonial Link ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Gambar Testimonial (opsional)",
                    labelText: "Tautan Gambar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if(value != null && value.trim().isNotEmpty && !format.hasMatch(value.trim())) {
                      return "Format link harus berupa https://drive.google.com/thumbnail?id=FILE_ID";
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      _testimonialLink = value!;
                    });
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Testimonial berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pengalaman Terkait: $_relatedExperience'),
                                    Text('Pesan Testimonial: $_testimonialMessage'),
                                    Text('Pengirim: $_senderName'),
                                    Text('Tautan Gambar: $_testimonialLink'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
