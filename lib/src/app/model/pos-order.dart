class PosOrder {
  String sLastUpdate;
  List<dynamic> accountMove;
  int amountPaid;
  int amountReturn;
  int amountTax;
  int amountTotal;
  bool checkCodeUrl;
  List<dynamic> companyId;
  List<dynamic> configId;
  String createDate;
  List<dynamic> createUid;
  int currencyRate;
  int customerCount;
  String dateOrder;
  String displayName;
  bool fiscalPositionId;
  int id;
  bool invoiceGroup;
  bool invoiceId;
  List<dynamic> lines;
  List<dynamic> locationId;
  String name;
  int nbPrint;
  bool note;
  bool partnerId;
  List<dynamic> pickingId;
  List<dynamic> pickingTypeId;
  String posReference;
  List<dynamic> pricelistId;
  List<dynamic> saleJournal;
  int sequenceNumber;
  List<dynamic> sessionId;
  String state;
  List<dynamic> statementIds;
  List<dynamic> tableId;
  List<dynamic> userId;
  String writeDate;
  List<dynamic> writeUid;
  bool xEInvoiceDate;
  String xEInvoiceNumber;
  bool xInvoiceReceiptCode;
  bool xVatNumber;

  PosOrder(
      {this.sLastUpdate,
      this.accountMove,
      this.amountPaid,
      this.amountReturn,
      this.amountTax,
      this.amountTotal,
      this.checkCodeUrl,
      this.companyId,
      this.configId,
      this.createDate,
      this.createUid,
      this.currencyRate,
      this.customerCount,
      this.dateOrder,
      this.displayName,
      this.fiscalPositionId,
      this.id,
      this.invoiceGroup,
      this.invoiceId,
      this.lines,
      this.locationId,
      this.name,
      this.nbPrint,
      this.note,
      this.partnerId,
      this.pickingId,
      this.pickingTypeId,
      this.posReference,
      this.pricelistId,
      this.saleJournal,
      this.sequenceNumber,
      this.sessionId,
      this.state,
      this.statementIds,
      this.tableId,
      this.userId,
      this.writeDate,
      this.writeUid,
      this.xEInvoiceDate,
      this.xEInvoiceNumber,
      this.xInvoiceReceiptCode,
      this.xVatNumber});

  PosOrder.fromJson(Map<String, dynamic> json) {
    sLastUpdate = json['__last_update'];
    if (json["account_move"] != null) {
      accountMove = List<dynamic>.from(
          json["account_move"] != null ? json["account_move"] : []);
    }
    amountPaid = json['amount_paid'];
    amountReturn = json['amount_return'];
    amountTax = json['amount_tax'];
    amountTotal = json['amount_total'];
    checkCodeUrl = json['check_code_url'];
    if (json["company_id"] != null) {
      companyId = List<dynamic>.from(
          json["company_id"] != null ? json["company_id"] : []);
    }
    if (json["config_id"] != null) {
      configId = List<dynamic>.from(
          json["config_id"] != null ? json["config_id"] : []);
    }
    createDate = json['create_date'];
    if (json["create_uid"] != null) {
      createUid = List<dynamic>.from(
          json["create_uid"] != null ? json["create_uid"] : []);
    }
    currencyRate = json['currency_rate'];
    customerCount = json['customer_count'];
    dateOrder = json['date_order'];
    displayName = json['display_name'];
    fiscalPositionId = json['fiscal_position_id'];
    id = json['id'];
    invoiceGroup = json['invoice_group'];
    invoiceId = json['invoice_id'];
    if (json["lines"] != null) {
      lines = List<dynamic>.from(json["lines"] != null ? json["lines"] : []);
    }
    if (json["location_id"] != null) {
      locationId = List<dynamic>.from(
          json["location_id"] != null ? json["location_id"] : []);
    }
    name = json['name'];
    nbPrint = json['nb_print'];
    note = json['note'];
    partnerId = json['partner_id'];
    if (json["picking_id"] != null) {
      pickingId = List<dynamic>.from(
          json["picking_id"] != null ? json["picking_id"] : []);
    }
    if (json["picking_type_id"] != null) {
      pickingTypeId = List<dynamic>.from(
          json["picking_type_id"] != null ? json["picking_type_id"] : []);
    }
    posReference = json['pos_reference'];
    if (json["pricelist_id"] != null) {
      pricelistId = List<dynamic>.from(
          json["pricelist_id"] != null ? json["pricelist_id"] : []);
    }
    if (json["sale_journal"] != null) {
      saleJournal = List<dynamic>.from(
          json["sale_journal"] != null ? json["sale_journal"] : []);
    }
    sequenceNumber = json['sequence_number'];
    if (json["session_id"] != null) {
      sessionId = List<dynamic>.from(
          json["session_id"] != null ? json["session_id"] : []);
    }
    state = json['state'];
    if (json["statement_ids"] != null) {
      statementIds = List<dynamic>.from(
          json["statement_ids"] != null ? json["statement_ids"] : []);
    }
    if (json["table_id"] != null) {
      tableId =
          List<dynamic>.from(json["table_id"] != null ? json["table_id"] : []);
    }
    if (json["user_id"] != null) {
      userId =
          List<dynamic>.from(json["user_id"] != null ? json["user_id"] : []);
    }
    writeDate = json['write_date'];
    if (json["write_uid"] != null) {
      writeUid = List<dynamic>.from(
          json["write_uid"] != null ? json["write_uid"] : []);
    }
    xEInvoiceDate = json['x_e_invoice_date'];
    xEInvoiceNumber = json['x_e_invoice_number'];
    xInvoiceReceiptCode = json['x_invoice_receipt_code'];
    xVatNumber = json['x_vat_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__last_update'] = this.sLastUpdate;
    data['account_move'] = this.accountMove;
    data['amount_paid'] = this.amountPaid;
    data['amount_return'] = this.amountReturn;
    data['amount_tax'] = this.amountTax;
    data['amount_total'] = this.amountTotal;
    data['check_code_url'] = this.checkCodeUrl;
    data['company_id'] = this.companyId;
    data['config_id'] = this.configId;
    data['create_date'] = this.createDate;
    data['create_uid'] = this.createUid;
    data['currency_rate'] = this.currencyRate;
    data['customer_count'] = this.customerCount;
    data['date_order'] = this.dateOrder;
    data['display_name'] = this.displayName;
    data['fiscal_position_id'] = this.fiscalPositionId;
    data['id'] = this.id;
    data['invoice_group'] = this.invoiceGroup;
    data['invoice_id'] = this.invoiceId;
    data['lines'] = this.lines;
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['nb_print'] = this.nbPrint;
    data['note'] = this.note;
    data['partner_id'] = this.partnerId;
    data['picking_id'] = this.pickingId;
    data['picking_type_id'] = this.pickingTypeId;
    data['pos_reference'] = this.posReference;
    data['pricelist_id'] = this.pricelistId;
    data['sale_journal'] = this.saleJournal;
    data['sequence_number'] = this.sequenceNumber;
    data['session_id'] = this.sessionId;
    data['state'] = this.state;
    data['statement_ids'] = this.statementIds;
    data['table_id'] = this.tableId;
    data['user_id'] = this.userId;
    data['write_date'] = this.writeDate;
    data['write_uid'] = this.writeUid;
    data['x_e_invoice_date'] = this.xEInvoiceDate;
    data['x_e_invoice_number'] = this.xEInvoiceNumber;
    data['x_invoice_receipt_code'] = this.xInvoiceReceiptCode;
    data['x_vat_number'] = this.xVatNumber;
    return data;
  }
}
