import 'package:carent_app/controllers/book_controller.dart';
import 'package:carent_app/services/book_services.dart';
import 'package:carent_app/themes/themes.dart';
import 'package:carent_app/widgets/basic_layout.dart';
import 'package:carent_app/widgets/custom_button.dart';
import 'package:carent_app/widgets/custom_modal.dart';
import 'package:carent_app/widgets/custom_snackbar.dart';
import 'package:carent_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:group_radio_button/group_radio_button.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  //NOTE: Textfields Controllers
  final TextEditingController judulBukuController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController thnTerbitController = TextEditingController();
  final TextEditingController jmlHalController = TextEditingController();
  final TextEditingController sinopsisController = TextEditingController();
  final TextEditingController coverController = TextEditingController();

  String inputJudulBuku = '';
  String inputKategori = '';
  String inputStok = '';
  String inputIsbn = '';
  String inputPenerbit = '';
  String inputPenulis = '';
  String inputThnTerbit = '';
  String inputJmlHal = '';
  String inputSinopsis = '';
  String inputCover = '';

  final _kategori = ["fiksi", "non-fiksi"];

  @override
  void initState() {
    judulBukuController.addListener(() {
      inputJudulBuku = judulBukuController.value.text;
    });
    kategoriController.addListener(() {
      inputKategori = kategoriController.value.text;
    });
    stokController.addListener(() {
      inputStok = stokController.value.text;
    });
    isbnController.addListener(() {
      inputIsbn = isbnController.value.text;
    });
    penerbitController.addListener(() {
      inputPenerbit = penerbitController.value.text;
    });
    penulisController.addListener(() {
      inputPenulis = penulisController.value.text;
    });
    thnTerbitController.addListener(() {
      inputThnTerbit = thnTerbitController.value.text;
    });
    jmlHalController.addListener(() {
      inputJmlHal = jmlHalController.value.text;
    });
    sinopsisController.addListener(() {
      inputSinopsis = sinopsisController.value.text;
    });
    coverController.addListener(() {
      inputCover = coverController.value.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookController kategoriController = Get.put(BookController());
    return Scaffold(
      body: BasicLayout(
        withButton: true,
        buttonOnTap: () {
          //NOTE: Untuk menambah data <button pojok kanan bawah>
          CustomModal.show(
            'Tambah Buku', //title
            800.h, //width
            630.h, //height
            //child
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 325.h,
                      child: Column(
                        children: [
                          CustomTextField(
                            title: 'Judul buku',
                            hintText: 'Judul buku..',
                            controller: judulBukuController,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kategori',
                                style: heading3MediumTextStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 70.0,
                                child: Obx(
                                  () => RadioGroup<String>.builder(
                                    direction: Axis.horizontal,
                                    fillColor: const Color(0xff312A4F),
                                    activeColor: const Color(0xff312A4F),
                                    groupValue:
                                        kategoriController.selectedItem.value,
                                    horizontalAlignment:
                                        MainAxisAlignment.spaceAround,
                                    onChanged: (value) => setState(() {
                                      kategoriController.selectedItem.value =
                                          value ?? '';
                                    }),
                                    items: _kategori,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: const Color(0xff312A4F),
                                    ),
                                    itemBuilder: (item) => RadioButtonBuilder(
                                      item,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          CustomTextField(
                            title: 'Penerbit',
                            hintText: 'Penerbit buku..',
                            controller: penerbitController,
                          ),
                          CustomTextField(
                            title: 'Tahun Terbit',
                            hintText: 'Tahun terbit..',
                            controller: thnTerbitController,
                          ),
                          CustomTextField(
                            title: 'Cover Buku',
                            hintText: 'Cover buku..',
                            controller: coverController,
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 325.h,
                      child: Column(
                        children: [
                          CustomTextField(
                            title: 'ISBN',
                            hintText: 'ISBN..',
                            controller: isbnController,
                          ),
                          CustomTextField(
                            title: 'Stok buku',
                            hintText: 'Stok buku..',
                            controller: stokController,
                          ),
                          CustomTextField(
                            title: 'Penulis buku',
                            hintText: 'Penulis buku..',
                            controller: penulisController,
                          ),
                          CustomTextField(
                            title: 'Jumlah Halaman',
                            hintText: 'Jumlah halaman..',
                            controller: jmlHalController,
                          ),
                          CustomTextField(
                            title: 'Sinopsis Buku',
                            hintText: 'Sinopsis buku..',
                            controller: sinopsisController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomButton(
                            title: 'Simpan',
                            onTap: () async {
                              var addBookResult = await BookServices.addBook(
                                  inputJudulBuku,
                                  kategoriController.selectedItem.value,
                                  inputStok,
                                  inputIsbn,
                                  inputPenerbit,
                                  inputPenulis,
                                  inputThnTerbit,
                                  inputJmlHal,
                                  inputSinopsis,
                                  inputCover);
                              setState(() {
                                Get.toNamed('/dashboardPage');
                                Get.toNamed('/booksPage');
                                CustomSnackbar.show(
                                    'Yeay', addBookResult?['message']);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        // NOTE: untuk menampilkan data ke tabel
        child: FutureBuilder<List<dynamic>?>(
          future: BookServices.getBooks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                dataTextStyle: heading4RegulerTextStyle.copyWith(fontSize: 14),
                headingTextStyle: heading4BoldTextStyle.copyWith(fontSize: 14),
                dataRowHeight: 100.h,
                columns: const [
                  DataColumn2(
                    fixedWidth: 70,
                    label: Text('ID'),
                  ),
                  DataColumn(
                    label: Text('JUDUL'),
                  ),
                  DataColumn2(
                    fixedWidth: 90,
                    label: Text('KATEGORI'),
                  ),
                  DataColumn2(
                    fixedWidth: 50,
                    label: Text('STOK'),
                  ),
                  DataColumn(
                    label: Text('ISBN'),
                  ),
                  DataColumn(
                    label: Text('PENULIS'),
                  ),
                  DataColumn(
                    label: Text('PENERBIT'),
                  ),
                  DataColumn2(
                    fixedWidth: 65,
                    label: Text('TAHUN'),
                  ),
                  DataColumn2(
                    fixedWidth: 75,
                    label: Text('JML HAL'),
                  ),
                  // DataColumn(
                  //   label: Text('SINOPSIS'),
                  // ),
                  DataColumn2(
                    fixedWidth: 130,
                    label: Text('ACTION'),
                  ),
                ],
                rows: List.generate(
                  snapshot.data!.length,
                  (index) {
                    var data = snapshot.data![index];
                    return DataRow(cells: [
                      DataCell(
                        Text(data['id_buku']),
                      ),
                      DataCell(
                        Text(data['judul_buku']),
                      ),
                      DataCell(
                        Text(data['kategori']),
                      ),
                      DataCell(
                        Text(data['stok']),
                      ),
                      DataCell(
                        Text(data['isbn']),
                      ),
                      DataCell(
                        Text(data['penulis']),
                      ),
                      DataCell(
                        Text(data['penerbit']),
                      ),
                      DataCell(
                        Text(data['thn_terbit']),
                      ),
                      DataCell(
                        Text(data['jml_hal']),
                      ),
                      // DataCell(
                      //   Text(data['sinopsis']),
                      // ),
                      DataCell(
                        Row(
                          children: [
                            //NOTE: Button lihat sinopsis
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  CustomModal.show(
                                    'Sinopsis ${data['judul_buku']}', //NOTE: title
                                    500.h, //NOTE: width
                                    600.h, //NOTE: height

                                    //NOTE: child
                                    Column(
                                      children: [
                                        Text(
                                          "${data['sinopsis']}",
                                          style: heading4RegulerTextStyle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 30.h,
                                  height: 30.h,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/icon_show.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            // NOTE: Button Edit
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  // NOTE: for default value
                                  judulBukuController.text = data['judul_buku'];
                                  stokController.text = data['stok'];
                                  isbnController.text = data['isbn'];
                                  penerbitController.text = data['penerbit'];
                                  penulisController.text = data['penulis'];
                                  thnTerbitController.text = data['thn_terbit'];
                                  jmlHalController.text = data['jml_hal'];
                                  sinopsisController.text = data['sinopsis'];
                                  coverController.text = data['cover'];

                                  kategoriController.selectedItem.value =
                                      data['kategori'];

                                  CustomModal.show(
                                    "Edit Book ${data['id_buku']}",
                                    800.h,
                                    630.h,
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 325.h,
                                              child: Column(
                                                children: [
                                                  CustomTextField(
                                                    title: 'Judul buku',
                                                    hintText: 'Judul buku..',
                                                    controller:
                                                        judulBukuController,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Kategori',
                                                        style:
                                                            heading3MediumTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      SizedBox(
                                                        height: 70.0,
                                                        child: Obx(
                                                          () => RadioGroup<
                                                              String>.builder(
                                                            direction:
                                                                Axis.horizontal,
                                                            fillColor:
                                                                const Color(
                                                                    0xff312A4F),
                                                            activeColor:
                                                                const Color(
                                                                    0xff312A4F),
                                                            groupValue:
                                                                kategoriController
                                                                    .selectedItem
                                                                    .value,
                                                            horizontalAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              kategoriController
                                                                      .selectedItem
                                                                      .value =
                                                                  value ?? '';
                                                            }),
                                                            items: _kategori,
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 20,
                                                              color: const Color(
                                                                  0xff312A4F),
                                                            ),
                                                            itemBuilder: (item) =>
                                                                RadioButtonBuilder(
                                                              item,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  CustomTextField(
                                                    title: 'Penerbit Buku',
                                                    hintText: 'Penerbit buku..',
                                                    controller:
                                                        penerbitController,
                                                  ),
                                                  CustomTextField(
                                                    title: 'Tahun Terbit',
                                                    hintText: 'Tahun terbit..',
                                                    controller:
                                                        thnTerbitController,
                                                  ),
                                                  CustomTextField(
                                                    title: 'Cover Buku',
                                                    hintText: 'Cover buku..',
                                                    controller: coverController,
                                                  ),
                                                  SizedBox(
                                                    height: 60.h,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 325.h,
                                              child: Column(
                                                children: [
                                                  CustomTextField(
                                                    title: 'ISBN',
                                                    hintText: 'ISBN..',
                                                    controller: isbnController,
                                                  ),
                                                  CustomTextField(
                                                    title: 'Stok Buku',
                                                    hintText: 'Stok buku..',
                                                    controller: stokController,
                                                  ),
                                                  CustomTextField(
                                                    title: 'Penulis Buku',
                                                    hintText: 'Penulis buku..',
                                                    controller:
                                                        penulisController,
                                                  ),
                                                  CustomTextField(
                                                    title: 'Jumlah Halaman',
                                                    hintText:
                                                        'Jumlah halaman..',
                                                    controller:
                                                        jmlHalController,
                                                  ),
                                                  CustomTextField(
                                                    title: 'Sinopsis Buku',
                                                    hintText: 'Sinopsis buku..',
                                                    controller:
                                                        sinopsisController,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  CustomButton(
                                                    title: 'Simpan Perubahan',
                                                    onTap: () async {
                                                      var editBookResult =
                                                          await BookServices.editBook(
                                                              data['id_buku'],
                                                              inputJudulBuku,
                                                              kategoriController
                                                                  .selectedItem
                                                                  .value,
                                                              inputStok,
                                                              inputIsbn,
                                                              inputPenerbit,
                                                              inputPenulis,
                                                              inputThnTerbit,
                                                              inputJmlHal,
                                                              inputSinopsis,
                                                              inputCover);
                                                      setState(() {
                                                        Get.toNamed(
                                                            '/dashboardPage');
                                                        Get.toNamed(
                                                            '/booksPage');
                                                        CustomSnackbar.show(
                                                            'Yeay',
                                                            editBookResult?[
                                                                'message']);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 30.h,
                                  height: 30.h,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/icon_edit.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            // NOTE: button delete
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  CustomModal.show(
                                    'Warning!', //NOTE: title
                                    400.h, //NOTE: width
                                    250.h, //NOTE: height

                                    //NOTE: child
                                    Column(
                                      children: [
                                        Text(
                                            "Yakin mau hapus buku ${data['judul_buku']}??"),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        CustomButton(
                                          title: 'Hapus',
                                          onTap: () async {
                                            var deleteBookResult =
                                                await BookServices.deleteBook(
                                                    data['id_buku']);

                                            if (deleteBookResult != null) {
                                              setState(() {
                                                Get.toNamed('/dashboardPage');
                                                Get.toNamed('/booksPage');
                                                CustomSnackbar.show(
                                                    'Yeay', //NOTE: title

                                                    //NOTE: message
                                                    deleteBookResult[
                                                        'message']);
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 30.h,
                                  height: 30.h,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/icon_delete.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  },
                ).toList(),
                showBottomBorder: true,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            // By default show a loading spinner.
            return Center(
                child: CircularProgressIndicator(
              color: orangeColor,
            ));
          },
        ),
      ),
    );
  }
}
