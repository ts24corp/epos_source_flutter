class PosOrderLine {
  String sLastUpdate;
  List<dynamic> companyId;
  String createDate;
  List<dynamic> createUid;
  int discount;
  String displayName;
  int id;
  String name;
  bool notice;
  List<dynamic> orderId;
  List<dynamic> packLotIds;
  int priceSubtotal;
  int priceSubtotalIncl;
  int priceUnit;
  List<dynamic> productId;
  int qty;
  List<dynamic> taxIds;
  List<dynamic> taxIdsAfterFiscalPosition;
  String writeDate;
  List<dynamic> writeUid;

  PosOrderLine(
      {this.sLastUpdate,
      this.companyId,
      this.createDate,
      this.createUid,
      this.discount,
      this.displayName,
      this.id,
      this.name,
      this.notice,
      this.orderId,
      this.packLotIds,
      this.priceSubtotal,
      this.priceSubtotalIncl,
      this.priceUnit,
      this.productId,
      this.qty,
      this.taxIds,
      this.taxIdsAfterFiscalPosition,
      this.writeDate,
      this.writeUid});

  PosOrderLine.fromJson(Map<String, dynamic> json) {
    sLastUpdate = json['__last_update'];
    if (json["company_id"] != null) {
      companyId = List<dynamic>.from(
          json["company_id"] != null ? json["company_id"] : []);
    }
    createDate = json['create_date'];
    if (json["create_uid"] != null) {
      createUid = List<dynamic>.from(
          json["create_uid"] != null ? json["create_uid"] : []);
    }
    discount = json['discount'];
    displayName = json['display_name'];
    id = json['id'];
    name = json['name'];
    notice = json['notice'];
    if (json["order_id"] != null) {
      orderId =
          List<dynamic>.from(json["order_id"] != null ? json["order_id"] : []);
    }
    if (json["pack_lot_ids"] != null) {
      packLotIds = List<dynamic>.from(
          json["pack_lot_ids"] != null ? json["pack_lot_ids"] : []);
    }
    priceSubtotal = json['price_subtotal'];
    priceSubtotalIncl = json['price_subtotal_incl'];
    priceUnit = json['price_unit'];
    if (json["product_id"] != null) {
      productId = List<dynamic>.from(
          json["product_id"] != null ? json["product_id"] : []);
    }
    qty = json['qty'];
    if (json["tax_ids"] != null) {
      taxIds =
          List<dynamic>.from(json["tax_ids"] != null ? json["tax_ids"] : []);
    }
    if (json["tax_ids_after_fiscal_position"] != null) {
      taxIdsAfterFiscalPosition = List<dynamic>.from(
          json["tax_ids_after_fiscal_position"] != null
              ? json["tax_ids_after_fiscal_position"]
              : []);
    }
    writeDate = json['write_date'];
    if (json["write_uid"] != null) {
      writeUid = List<dynamic>.from(
          json["write_uid"] != null ? json["write_uid"] : []);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__last_update'] = this.sLastUpdate;
    data['company_id'] = this.companyId;
    data['create_date'] = this.createDate;
    data['create_uid'] = this.createUid;
    data['discount'] = this.discount;
    data['display_name'] = this.displayName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['notice'] = this.notice;
    data['order_id'] = this.orderId;
    data['pack_lot_ids'] = this.packLotIds;
    data['price_subtotal'] = this.priceSubtotal;
    data['price_subtotal_incl'] = this.priceSubtotalIncl;
    data['price_unit'] = this.priceUnit;
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['tax_ids'] = this.taxIds;
    data['tax_ids_after_fiscal_position'] = this.taxIdsAfterFiscalPosition;
    data['write_date'] = this.writeDate;
    data['write_uid'] = this.writeUid;
    return data;
  }
}
