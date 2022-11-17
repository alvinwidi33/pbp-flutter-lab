1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
  -  Navigator push adalah  Metode push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. 
   Halaman baru ditampilkan di atas halaman sebelumnya.
  - Navigator pushReplacement adalah metode push yang digunakan untuk mengganti rute navigator saat ini dengan mendorong rute yang diberikan 
2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
  - Scaffold : menampung widget-widget lain 
  - AppBar : control menu aplikasi
  - Body : primary content dari Scaffold
  - Column : mengatur posisi secara vertikal
  - Row : mengatur posisi secara horizontal
Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
  - onPressed
  - onLongPress
  - onTap
  - onDrawerChanged
Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator bekerja menggunakan prinsip Last In First Out. Route widget akan disimpan oleh BuildContext, kemudian akan diakses oleh Navigator dan akan di push atau di pop
Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
- Membuat drawer.dart pada file terpisah untuk memunculkan tombol navigasi dengan kode berikut 
```
    import 'package:flutter/material.dart';
    import 'package:counter_7/main.dart';
    import 'package:counter_7/form.dart';
    import 'package:counter_7/show_budget.dart';

    Drawer buildDrawer(BuildContext context) {
      return Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke counter
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowBudget()),
                );
              },
            ),
          ],
        ),
      );
    }
```
- Membuat form.dart yang berguna untuk mengisi form yang sesuai
```
    import 'package:flutter/material.dart';
    import 'package:counter_7/drawer.dart';
    import 'package:counter_7/budget.dart';

    class MyFormPage extends StatefulWidget {
      const MyFormPage({super.key});

      @override
      State<MyFormPage> createState() => _MyFormPageState();
    }

    class _MyFormPageState extends State<MyFormPage> {
      final _formKey = GlobalKey<FormState>();
      String _judul = "";
      int? _nominal = 0;
      String? _jenis;
      DateTime? _dateTime;
      final _controllerJudul = TextEditingController();
      final _controllerNominal = TextEditingController();

      void clearText() {
        _controllerJudul.clear();
        _controllerNominal.clear();

        setState(() {
          _jenis = null;
          _dateTime = null;
        });
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Form Budget'),
          ),
          drawer: buildDrawer(context),
          body: Form(
              key: _formKey,
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        // Menggunakan padding sebesar 8 pixel
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Contoh: Sate Pacil",
                                    labelText: "Judul",

                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  controller: _controllerJudul,
                                  // Menambahkan behavior saat nama diketik
                                  onChanged: (String? value) {
                                    setState(() {
                                      _judul = value!;
                                    });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                    setState(() {
                                      _judul = value!;
                                    });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Judul tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10, // <-- SEE HERE
                                ),
                                TextFormField(
                                  controller: _controllerNominal,
                                  decoration: InputDecoration(
                                    hintText: "Contoh: 20000",
                                    labelText: "Nominal",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _nominal = int.tryParse(value!);
                                    });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                    setState(() {
                                      _nominal = int.parse(value!);
                                    });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Nominal tidak boleh kosong!';
                                    } else if (_nominal == null) {
                                      return 'Nominal harus angka!';
                                    }
                                    return null;
                                  },
                                )
                              ])),
                      const SizedBox(
                        height: 10, // <-- SEE HERE
                      ),

                      SizedBox(
                        width: 120,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            // isCollapsed: true,
                            enabledBorder: InputBorder.none,
                          ),
                          hint: const Text("Pilih Jenis"),
                          value: _jenis,
                          validator: (value) =>
                          value == null ? "Pilih Jenis" : null,
                          items: const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: 'Pengeluaran',
                              child: Text('Pengeluaran'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Pemasukan',
                              child: Text('Pemasukan'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _jenis = value!;
                            });
                          },
                        ), // <-- SEE HERE
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      TextButton(
                        child: Text(_dateTime == null
                            ? "Pick a date"
                            : "${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}"),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099),
                          ).then((date) {
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        },
                      ),

                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _dateTime != null) {
                              ListBudget.data.add(
                                  Budget(_judul, _nominal, _jenis!, _dateTime!));

                              clearText();
                            }
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ))),
        );
      }
    }
 ```
 - Membuat budget.dart untuk menyimpan data budget
 ```
      class Budget {
      String judul = "";
      int? nominal = 0;
      String jenis;
      DateTime date;
      Budget(this.judul, this.nominal, this.jenis, this.date);
    }

    class ListBudget {
      static List<Budget> data = [];
    }
  ```
  - Menampilkan data-data budget dengan membuat file show_budget.dart
  ```
    import 'package:flutter/material.dart';
  import 'package:counter_7/drawer.dart';
  import 'package:counter_7/budget.dart';

  class ShowBudget extends StatefulWidget {
    const ShowBudget({super.key});

    @override
    State<ShowBudget> createState() => _ShowBudgetState();
  }

  class _ShowBudgetState extends State<ShowBudget> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Form Budget'),
          ),
          drawer: buildDrawer(context),
          body: SingleChildScrollView(
              child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                      children: ListBudget.data
                          .map((budget) => Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.15),
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: const Offset(
                                1.0, // Move to right 10  horizontally
                                1.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SizedBox(
                            height: 100,
                            child: Container(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            budget.judul,
                                            style: const TextStyle(
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "${budget.date.day}/${budget.date.month}/${budget.date.year}",
                                          ),
                                        ]),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(budget.nominal
                                            .toString()),
                                        Text(budget.jenis)
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ))
                          .toList()
                  ))));
    }
  }
```
