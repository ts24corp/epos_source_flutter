import 'package:epos_source_flutter/src/app/model/index.dart';

class SuoiTienModel {
  String phamViSuDung = "0";
  String maHieuQuayVe = "00";
  String ngayTaoMa = "000000";
  String loaiDichVu = "000";
  String kiemSoatRaVao = "0000";
  String soThuTu = "00000";
  String soKiemTra = "0";
  String maVe = "";

  List listPhamViSuDung = [
    {"id": "1", "name": "Suối Tiên", "id": "2", "name": "Sơn Tiên"}
  ];

  List listMaHieuQuayVe = [
    {"id": "01", "name": "Quầy 01 Văn phòng khu vực Suối Tiên"},
    {"id": "12", "name": "Quầy 12 bán vé vào cổng"},
  ];

  List listLoaiDichVu = [
    {"id": "000", "name": "Hỗn hợp nhiều dịch vụ"},
    {"id": "001", "name": "Vé vào cổng khu vực Suối Tiên"},
  ];

  //Tính số kiểm tra
  // 7.	Số kiểm tra : 01 chữ số sau cùng của mã vé. Số kiểm tra là kết quả của phép tính như sau :
  // •	A = (tổng các chữ số thứ 1, 5,  9, 13, 17 và 21) nhân với số nguyên tố 1.
  // •	B = (tổng các chữ số thứ 2, 6, 10, 14 và 18) nhân với số nguyên tố 3.
  // •	C = (tổng các chữ số thứ 3, 7, 11, 15 và 19) nhân với số nguyên tố 5.
  // •	D = (tổng các chữ số thứ 4, 8, 12, 16 và 20) nhân với số nguyên tố 7.
  // •	M = Modulo(A + B+ C+ D, 10)
  // •	K là số kiểm tra, nếu M = 0 thì K là 0, nếu M > 0 thì K = 10 – M.
  //Example: 112190714326050200139
  generateMaVe({String code: ""}) {
    try {
      var ordinalNum = 0, A = 0, B = 0, C = 0, D = 0, M = 0, K = 0;
      var sumCode = code != ""
          ? code
          : this.phamViSuDung +
              this.maHieuQuayVe +
              this.ngayTaoMa +
              this.loaiDichVu +
              this.kiemSoatRaVao +
              this.soThuTu;
      for (var index = 0; index < sumCode.length; index++) {
        ordinalNum = index + 1;
        switch (ordinalNum) {
          case 1:
          case 5:
          case 9:
          case 13:
          case 17:
          case 21:
            A += int.parse((sumCode[index]));
            break;
          case 2:
          case 6:
          case 10:
          case 14:
          case 18:
            B += int.parse((sumCode[index]));
            break;
          case 3:
          case 7:
          case 11:
          case 15:
          case 19:
            C += int.parse((sumCode[index]));
            break;
          case 4:
          case 8:
          case 12:
          case 16:
          case 20:
            D += int.parse((sumCode[index]));
            break;
        }
      }

      B = B * 3;
      C = C * 5;
      D = D * 7;
      M = (A + B + C + D) % 10;
      if (M == 0)
        K = 0;
      else if (M > 0) K = 10 - M;
      this.soKiemTra = K.toString();
      this.maVe = sumCode + this.soKiemTra;
    } catch (ex) {
      print(ex);
    }
  }

  bool checkMaVe(String code) {
    if (code.length == 22) {
      var codeSubString = code.substring(0, code.length - 1);
      this.generateMaVe(code: codeSubString);
      if (code == this.maVe)
        return true;
      else
        return false;
    }
    return false;
  }

  getObjectFromQRCode(String code) {
    if (this.checkMaVe(code)) {
      this.phamViSuDung = code.substring(0, 1);
      this.maHieuQuayVe = code.substring(1, 3);
      this.ngayTaoMa = code.substring(3, 9);
      this.loaiDichVu = code.substring(9, 12);
      this.kiemSoatRaVao = code.substring(12, 16);
      this.soThuTu = code.substring(16, 21);
      this.soKiemTra = code.substring(code.length - 1);
      this.maVe = code;
    }
  }

  TicketInfo convertCodeToTicketInfo(TicketInfo ticketInfo) {
    ticketInfo.ticketId = this.maVe;
    // Ngay Tao ma
    ticketInfo.ticketDate = "20" + this.ngayTaoMa;
    //Loại dịch vụ
    for (var i = 0; i < this.listLoaiDichVu.length; i++) {
      var item = this.listLoaiDichVu[i];
      if (item["id"] == this.loaiDichVu) ticketInfo.ticketName = item["name"];
    }
    var adultQuantity = '${this.kiemSoatRaVao[0]}${this.kiemSoatRaVao[1]}';
    ticketInfo.ticketAdultQuantity = int.parse(adultQuantity);
    var childQuantity = '${this.kiemSoatRaVao[2]}${this.kiemSoatRaVao[3]}';
    ticketInfo.ticketChildQuantity = int.parse(childQuantity);
    if (ticketInfo.ticketAdultQuantity > 1 ||
        ticketInfo.ticketChildQuantity > 1) {
      ticketInfo.ticketType = "Vé đoàn";
      ticketInfo.ticketCustomer = "Khách đoàn";
    } else {
      ticketInfo.ticketCustomer = "Khách lẻ";
      if (ticketInfo.ticketAdultQuantity != 0)
        ticketInfo.ticketType = "Vé người lớn";
      else if (ticketInfo.ticketChildQuantity != 0)
        ticketInfo.ticketType = "Vé trẻ em";
    }
    return ticketInfo;
  }
}
