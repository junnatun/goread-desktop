import 'package:carent_app/controllers/borrow_controller.dart';
import 'package:carent_app/services/borrow_detail_services.dart';
import 'package:carent_app/services/borrow_returns_services.dart';
import 'package:carent_app/services/borrow_services.dart';
import 'package:carent_app/services/member_services.dart';
import 'package:carent_app/services/rupiah_format.dart';
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
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class ReturnsPage extends StatefulWidget {
  const ReturnsPage({super.key});

  @override
  State<ReturnsPage> createState() => _ReturnsPageState();
}

class _ReturnsPageState extends State<ReturnsPage> {
  //NOTE: Textfields Controllers
  final TextEditingController idPeminjamanController = TextEditingController();
  final TextEditingController tglKembaliController = TextEditingController();
  final TextEditingController dendaController = TextEditingController();
  final TextEditingController idUserController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tglPinjamController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  String inputIdPeminjaman = '';
  String inputTglKembali = '';
  String inputDenda = '';
  String inputIdUser = '';
  String inputNama = '';
  String inputTglPinjam = '';
  String inputStatus = '';

  @override
  void initState() {
    idPeminjamanController.addListener(() {
      inputIdPeminjaman = idPeminjamanController.value.text;
    });
    tglKembaliController.addListener(() {
      inputTglKembali = tglKembaliController.value.text;
    });
    dendaController.addListener(() {
      inputDenda = dendaController.value.text;
    });
    idUserController.addListener(() {
      inputIdUser = idUserController.value.text;
    });
    namaController.addListener(() {
      inputNama = namaController.value.text;
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
    return Scaffold(
      body: BasicLayout(
        withButton: true,
        buttonOnTap: () {
          //NOTE: Untuk menambah data <button pojok kanan bawah>
          CustomModal.show(
            'Tambah Pengembalian', //title
            800.h, //width
            480.h, //height
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
                                  title: 'ID Peminjaman',
                                  hintText: 'ID Peminjaman..',
                                  withMargin: false,
                                  controller: idPeminjamanController,
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
                                    var getBorrowResult =
                                        await BorrowServices.getBorrow(
                                            inputIdPeminjaman);

                                    //NOTE: add value to controller
                                    borrowController.namaMember.value =
                                        getBorrowResult![0]['nama'];
                                    borrowController.tglPinjam.value =
                                        getBorrowResult![0]['tgl_pinjam'];
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
                              ],
                            ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal Pinjam',
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
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Text(
                                  borrowController.tglPinjam.value,
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
                                "Tanggal Kembali",
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
                                      tglKembaliController,
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
                          CustomTextField(
                            title: 'Denda',
                            hintText: 'Denda..',
                            controller: dendaController,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomButton(
                            title: 'Simpan',
                            onTap: () async {
                              var addBorrowReturnResult =
                                  await BorrowReturnServices.addBorrowReturn(
                                      inputIdPeminjaman,
                                      inputTglKembali,
                                      inputDenda);

                              var updateBorrowResult =
                                  await BorrowServices.editBorrow(
                                      inputIdPeminjaman, 'done');

                              setState(() {
                                Get.toNamed('/dashboardPage');
                                Get.toNamed('/returnsPage');
                                CustomSnackbar.show(
                                    'Yeay', addBorrowReturnResult!['message']);
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
          future: BorrowReturnServices.getBorrowReturns(),
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
                  DataColumn2(
                    fixedWidth: 170,
                    label: Text('TANGGAL PINJAM'),
                  ),
                  DataColumn2(
                    fixedWidth: 170,
                    label: Text('TANGGAL KEMBALI'),
                  ),
                  DataColumn2(
                    fixedWidth: 90,
                    label: Text('STATUS'),
                  ),
                  DataColumn2(
                    fixedWidth: 150,
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
                        Text(data['tgl_kembali']),
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
                                      'Detail Pengembalian ${data['id_peminjaman']}', //NOTE: title
                                      500.h, //NOTE: width
                                      600.h, //NOTE: height

                                      //NOTE: child
                                      Column(
                                        children: [
                                          Container(
                                            width: 400.h,
                                            height: 350.h,
                                            child:
                                                FutureBuilder<List<dynamic>?>(
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
                                                            .copyWith(
                                                                fontSize: 14),
                                                    headingTextStyle:
                                                        heading4BoldTextStyle
                                                            .copyWith(
                                                                fontSize: 14),
                                                    dataRowHeight: 80.h,
                                                    columns: const [
                                                      DataColumn2(
                                                        fixedWidth: 200,
                                                        label:
                                                            Text('JUDUL BUKU'),
                                                      ),
                                                      DataColumn2(
                                                        fixedWidth: 170,
                                                        label: Text('PENULIS'),
                                                      ),
                                                      DataColumn2(
                                                        fixedWidth: 70,
                                                        label: Text('JUMLAH'),
                                                      ),
                                                    ],
                                                    rows: List.generate(
                                                      snapshot.data!.length,
                                                      (index) {
                                                        var data = snapshot
                                                            .data![index];
                                                        return DataRow(cells: [
                                                          DataCell(
                                                            Text(data[
                                                                'judul_buku']),
                                                          ),
                                                          DataCell(
                                                            Text(data[
                                                                'penulis']),
                                                          ),
                                                          DataCell(
                                                            Text(data['jumlah']
                                                                .toString()),
                                                          ),
                                                        ]);
                                                      },
                                                    ).toList(),
                                                    showBottomBorder: true,
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return Text(snapshot.error
                                                      .toString());
                                                }
                                                // By default show a loading spinner.
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  color: orangeColor,
                                                ));
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 400.h,
                                            height: 100.h,
                                            // color: orangeColor,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Tanggal Pinjam',
                                                      style:
                                                          heading3RegulerTextStyle,
                                                    ),
                                                    Text(
                                                      '${data['tgl_pinjam']}',
                                                      style:
                                                          heading3BoldTextStyle,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Tanggal Kembali',
                                                      style:
                                                          heading3RegulerTextStyle,
                                                    ),
                                                    Text(
                                                      '${data['tgl_kembali']}',
                                                      style:
                                                          heading3BoldTextStyle,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Denda',
                                                      style:
                                                          heading3RegulerTextStyle,
                                                    ),
                                                    Text(
                                                      RupiahFormat.converToIDR(
                                                        int.parse(
                                                            data['denda']),
                                                        2,
                                                      ),
                                                      style:
                                                          heading3BoldTextStyle,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
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
                                            "Yakin mau hapus pengembalian ${data['id_peminjaman']}??"),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        CustomButton(
                                          title: 'Hapus',
                                          onTap: () async {
                                            var deleteBorrowReturnResult =
                                                await BorrowReturnServices
                                                    .deleteBorrowReturn(
                                                        data['id_peminjaman']);
                                            if (deleteBorrowReturnResult !=
                                                null) {
                                              var updateBorrowResult =
                                                  await BorrowServices
                                                      .editBorrow(
                                                          data['id_peminjaman'],
                                                          'ongoing');
                                              setState(() {
                                                Get.toNamed('/dashboardPage');
                                                Get.toNamed('/returnsPage');
                                                CustomSnackbar.show(
                                                    'Yeay', //NOTE: title

                                                    //NOTE: message
                                                    deleteBorrowReturnResult![
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
