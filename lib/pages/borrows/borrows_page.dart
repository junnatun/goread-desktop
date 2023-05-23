import 'package:carent_app/controllers/addBook_controller.dart';
import 'package:carent_app/controllers/borrow_controller.dart';
import 'package:carent_app/services/book_services.dart';
import 'package:carent_app/services/borrow_detail_services.dart';
import 'package:carent_app/services/borrow_services.dart';
import 'package:carent_app/services/member_services.dart';
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
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class BorrowsPage extends StatefulWidget {
  const BorrowsPage({super.key});

  @override
  State<BorrowsPage> createState() => _BorrowsPageState();
}

class _BorrowsPageState extends State<BorrowsPage> {
  //NOTE: Textfields Controllers
  final TextEditingController idUserController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController idBukuController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController tglPinjamController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  String inputIdUser = '';
  String inputNama = '';
  String inputIdBuku = '';
  String inputJumlah = '';
  String inputTglPinjam = '';
  String inputStatus = '';

  final _status = ["ongoing", "done"];

  @override
  void initState() {
    idUserController.addListener(() {
      inputIdUser = idUserController.value.text;
    });
    namaController.addListener(() {
      inputNama = namaController.value.text;
    });
    idBukuController.addListener(() {
      inputIdBuku = idBukuController.value.text;
    });
    jumlahController.addListener(() {
      inputJumlah = jumlahController.value.text;
    });
    tglPinjamController.addListener(() {
      inputTglPinjam = tglPinjamController.value.text;
    });
    statusController.addListener(() {
      inputStatus = statusController.value.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BorrowContoller borrowController = Get.put(BorrowContoller());
    AddBookController addBookController = Get.put(AddBookController());
    return Scaffold(
      body: BasicLayout(
        withButton: true,
        buttonOnTap: () {
          //NOTE: Untuk menambah data <button pojok kanan bawah>
          CustomModal.show(
            'Tambah Peminjaman', //title
            800.h, //width
            640.h, //height
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 275.h,
                                child: CustomTextField(
                                  title: 'ID User',
                                  hintText: 'ID User..',
                                  withMargin: false,
                                  controller: idUserController,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Material(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(5.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5.r),
                                  splashColor: pinkColor,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var getMemberResult =
                                        await MemberServices.getMember(
                                            inputIdUser);

                                    //NOTE: add value to controller
                                    borrowController.namaMember.value =
                                        getMemberResult![0]['nama'];
                                    borrowController.telpMember.value =
                                        getMemberResult![0]['telp'];
                                    borrowController.alamatMember.value =
                                        getMemberResult![0]['alamat'];
                                  },
                                  child: Container(
                                    width: 40.h,
                                    height: 40.h,
                                    padding: EdgeInsets.all(5.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/icons/icon_search.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Obx(
                            () => Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama Member',
                                      style: heading3MediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(
                                        borrowController.namaMember.value,
                                        style: heading3RegulerTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Telp Member',
                                      style: heading3MediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(
                                        borrowController.telpMember.value,
                                        style: heading3RegulerTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alamat Member',
                                      style: heading3MediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(
                                        borrowController.alamatMember.value,
                                        style: heading3RegulerTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tanggal Pinjam",
                                style: heading3MediumTextStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: double.infinity,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: TextfieldDatePicker(
                                  cupertinoDatePickerBackgroundColor:
                                      Colors.white,
                                  cupertinoDatePickerMaximumDate:
                                      DateTime(2024),
                                  cupertinoDatePickerMaximumYear:
                                      DateTime.now().year,
                                  cupertinoDatePickerMinimumYear: 1980,
                                  cupertinoDatePickerMinimumDate:
                                      DateTime(1990),
                                  cupertinoDateInitialDateTime: DateTime.now(),
                                  materialDatePickerFirstDate: DateTime(1980),
                                  materialDatePickerInitialDate: DateTime.now(),
                                  materialDatePickerLastDate: DateTime(2024),
                                  preferredDateFormat: DateFormat('yyyy-MM-dd'),
                                  textfieldDatePickerController:
                                      tglPinjamController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        heading4RegulerTextStyle.copyWith(
                                      color: purpleDarkColor.withOpacity(0.8),
                                    ),
                                    hintText: 'Pilih tanggal..',
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff312A4F),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 75.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 325.h,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 275.h,
                                child: CustomTextField(
                                  title: 'ID Buku',
                                  hintText: 'ID buku..',
                                  withMargin: false,
                                  controller: idBukuController,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Material(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(5.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5.r),
                                  splashColor: pinkColor,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var getBookResult =
                                        await BookServices.getBook(inputIdBuku);

                                    //NOTE: add value to controller
                                    addBookController.judulBuku.value =
                                        getBookResult![0]['judul_buku'];
                                    addBookController.penulisBuku.value =
                                        getBookResult![0]['penulis'];
                                    addBookController.stokBuku.value =
                                        getBookResult![0]['stok'];
                                  },
                                  child: Container(
                                    width: 40.h,
                                    height: 40.h,
                                    padding: EdgeInsets.all(5.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/icons/icon_search.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Obx(
                            () => Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Judul Buku',
                                      style: heading3MediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(
                                        addBookController.judulBuku.value,
                                        style: heading3RegulerTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Penulis Buku',
                                      style: heading3MediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(
                                        addBookController.penulisBuku.value,
                                        style: heading3RegulerTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Stok Buku',
                                      style: heading3MediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(
                                        addBookController.stokBuku.value,
                                        style: heading3RegulerTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextField(
                            title: 'Jumlah',
                            hintText: 'Jumlah..',
                            controller: jumlahController,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomButton(
                            title: 'Simpan',
                            onTap: () async {
                              var addBorrowResult =
                                  await BorrowServices.addBorrow(
                                      inputIdUser, inputTglPinjam);

                              if (addBorrowResult != null) {
                                var addBorrowDetailResult =
                                    await BorrowDetailsServices.addBorrowDetail(
                                        addBorrowResult!['id'],
                                        inputIdBuku,
                                        inputJumlah);
                                setState(() {
                                  Get.toNamed('/dashboardPage');
                                  Get.toNamed('/borrowsPage');
                                  CustomSnackbar.show(
                                      'Yeay', addBorrowResult!['message']);
                                });
                              }
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
          future: BorrowServices.getBorrows(),
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
                  DataColumn(
                    label: Text('ID PEMINJAMAN'),
                  ),
                  DataColumn(
                    label: Text('ID MEMBER'),
                  ),
                  DataColumn(
                    label: Text('NAMA'),
                  ),
                  DataColumn(
                    label: Text('TANGGAL PINJAM'),
                  ),
                  DataColumn(
                    label: Text('STATUS'),
                  ),
                  DataColumn(
                    label: Text('ACTION'),
                  ),
                ],
                rows: List.generate(
                  snapshot.data!.length,
                  (index) {
                    var data = snapshot.data![index];
                    return DataRow(cells: [
                      DataCell(
                        Text(data['id_peminjaman']),
                      ),
                      DataCell(
                        Text(data['id_user']),
                      ),
                      DataCell(
                        Text(data['nama']),
                      ),
                      DataCell(
                        Text(data['tgl_pinjam']),
                      ),
                      DataCell(
                        Text(data['status']),
                      ),
                      DataCell(
                        Row(
                          children: [
                            // Button Lihat Borrow Details
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  CustomModal.show(
                                      'Detail Peminjaman ${data['id_peminjaman']}', //NOTE: title
                                      500.h, //NOTE: width
                                      600.h, //NOTE: height

                                      //NOTE: child
                                      Container(
                                        width: 400.h,
                                        height: 500.h,
                                        child: FutureBuilder<List<dynamic>?>(
                                          future: BorrowDetailsServices
                                              .getBorrowDetail(
                                                  data['id_peminjaman']),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return DataTable2(
                                                columnSpacing: 12,
                                                horizontalMargin: 12,
                                                minWidth: 600,
                                                dataTextStyle:
                                                    heading4RegulerTextStyle
                                                        .copyWith(fontSize: 14),
                                                headingTextStyle:
                                                    heading4BoldTextStyle
                                                        .copyWith(fontSize: 14),
                                                dataRowHeight: 80.h,
                                                columns: const [
                                                  DataColumn2(
                                                    fixedWidth: 150,
                                                    label: Text('JUDUL BUKU'),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 150,
                                                    label: Text('PENULIS'),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 80,
                                                    label: Text('JUMLAH'),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 65,
                                                    label: Text('ACTION'),
                                                  ),
                                                ],
                                                rows: List.generate(
                                                  snapshot.data!.length,
                                                  (index) {
                                                    var data =
                                                        snapshot.data![index];
                                                    return DataRow(cells: [
                                                      DataCell(
                                                        Text(
                                                            data['judul_buku']),
                                                      ),
                                                      DataCell(
                                                        Text(data['penulis']),
                                                      ),
                                                      DataCell(
                                                        Text(data['jumlah']
                                                            .toString()),
                                                      ),
                                                      DataCell(
                                                        Row(
                                                          children: [
                                                            // NOTE: button delete
                                                            Material(
                                                              color:
                                                                  orangeColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r),
                                                              child: InkWell(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.r),
                                                                splashColor:
                                                                    pinkColor,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap: () {
                                                                  CustomModal
                                                                      .show(
                                                                    'Warning!', //NOTE: title
                                                                    400.h, //NOTE: width
                                                                    250.h, //NOTE: height

                                                                    //NOTE: child
                                                                    Column(
                                                                      children: [
                                                                        Text(
                                                                            "Yakin mau hapus buku ${data['id_buku']}??"),
                                                                        SizedBox(
                                                                          height:
                                                                              24.h,
                                                                        ),
                                                                        CustomButton(
                                                                          title:
                                                                              'Hapus',
                                                                          onTap:
                                                                              () async {
                                                                            var deleteBorrowDetailResult =
                                                                                await BorrowDetailsServices.deleteBorrowDetail(data['id_peminjaman'], data['id_buku']);
                                                                            setState(() {
                                                                              Get.toNamed('/dashboardPage');
                                                                              Get.toNamed('/borrowsPage');
                                                                              CustomSnackbar.show(
                                                                                  'Yeay', //NOTE: title

                                                                                  //NOTE: message
                                                                                  deleteBorrowDetailResult!['message']);
                                                                            });
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30.h,
                                                                  height: 30.h,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(5
                                                                              .h),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.r),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                    child:
                                                                        Image(
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
                                              return Text(
                                                  snapshot.error.toString());
                                            }
                                            // By default show a loading spinner.
                                            return Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: orangeColor,
                                            ));
                                          },
                                        ),
                                      ));
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

                            // NOTE: Button add detail
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  CustomModal.show(
                                    "Tambah Detail ${data['id_peminjaman']}",
                                    400.h,
                                    460.h,
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 300.h,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 250.h,
                                                    child: CustomTextField(
                                                      title: 'ID Buku',
                                                      hintText: 'ID buku..',
                                                      withMargin: false,
                                                      controller:
                                                          idBukuController,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.h,
                                                  ),
                                                  Material(
                                                    color: orangeColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                      splashColor: pinkColor,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var getBookResult =
                                                            await BookServices
                                                                .getBook(
                                                                    inputIdBuku);

                                                        //NOTE: add value to controller
                                                        addBookController
                                                                .judulBuku
                                                                .value =
                                                            getBookResult![0]
                                                                ['judul_buku'];
                                                        addBookController
                                                                .penulisBuku
                                                                .value =
                                                            getBookResult![0]
                                                                ['penulis'];
                                                        addBookController
                                                                .stokBuku
                                                                .value =
                                                            getBookResult![0]
                                                                ['stok'];
                                                      },
                                                      child: Container(
                                                        width: 40.h,
                                                        height: 40.h,
                                                        padding:
                                                            EdgeInsets.all(5.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                        ),
                                                        child: const Center(
                                                          child: Image(
                                                            image: AssetImage(
                                                                'assets/icons/icon_search.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Obx(
                                          () => Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Judul Buku',
                                                    style:
                                                        heading3MediumTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40.h,
                                                    padding:
                                                        EdgeInsets.all(10.h),
                                                    decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Text(
                                                      addBookController
                                                          .judulBuku.value,
                                                      style:
                                                          heading3RegulerTextStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Penulis Buku',
                                                    style:
                                                        heading3MediumTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40.h,
                                                    padding:
                                                        EdgeInsets.all(10.h),
                                                    decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Text(
                                                      addBookController
                                                          .penulisBuku.value,
                                                      style:
                                                          heading3RegulerTextStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Stok Buku',
                                                    style:
                                                        heading3MediumTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40.h,
                                                    padding:
                                                        EdgeInsets.all(10.h),
                                                    decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Text(
                                                      addBookController
                                                          .stokBuku.value,
                                                      style:
                                                          heading3RegulerTextStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        CustomTextField(
                                          title: 'Jumlah',
                                          hintText: 'Jumlah..',
                                          controller: jumlahController,
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        CustomButton(
                                          title: 'Simpan',
                                          onTap: () async {
                                            var addBorrowDetailResult =
                                                await BorrowDetailsServices
                                                    .addBorrowDetail(
                                                        data['id_peminjaman'],
                                                        inputIdBuku,
                                                        inputJumlah);

                                            setState(() {
                                              Get.toNamed('/dashboardPage');
                                              Get.toNamed('/borrowsPage');
                                              CustomSnackbar.show(
                                                  'Yeay',
                                                  addBorrowDetailResult![
                                                      'message']);
                                            });
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
                                          'assets/icons/icon_paper_plus.png'),
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
                                            "Yakin mau hapus peminjaman ${data['id_peminjaman']}??"),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        CustomButton(
                                          title: 'Hapus',
                                          onTap: () async {
                                            var deleteBorrowResult =
                                                await BorrowServices
                                                    .deleteBorrow(
                                                        data['id_peminjaman']);
                                            setState(() {
                                              Get.toNamed('/dashboardPage');
                                              Get.toNamed('/borrowsPage');
                                              CustomSnackbar.show(
                                                  'Yeay', //NOTE: title

                                                  //NOTE: message
                                                  deleteBorrowResult![
                                                      'message']);
                                            });
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
