class PosConfig {
  String sLastUpdate;
  bool active;
  bool allowLoadOrders;
  List<dynamic> availableCateg;
  List<dynamic> availablePricelistIds;
  List<dynamic> barcodeNomenclatureId;
  bool barcodeScanner;
  bool cashControl;
  List<dynamic> companyId;
  String createDate;
  List<dynamic> createUid;
  List<dynamic> crmTeamId;
  List<dynamic> currencyId;
  List<dynamic> currentSessionId;
  String currentSessionState;
  String customerFacingDisplayHtml;
  List<dynamic> defaultCashboxLinesIds;
  bool defaultFiscalPositionId;
  int discountPc;
  bool discountProductId;
  String displayName;
  List<dynamic> fiscalPositionIds;
  List<dynamic> floorIds;
  bool groupBy;
  List<dynamic> groupPosManagerId;
  List<dynamic> groupPosUserId;
  int id;
  bool ifaceBigScrollbars;
  bool ifaceCashdrawer;
  bool ifaceCustomerFacingDisplay;
  bool ifaceDiscount;
  bool ifaceDisplayCategImages;
  bool ifaceElectronicScale;
  bool ifaceOrderlineNotes;
  bool ifacePaymentTerminal;
  bool ifacePrecomputeCash;
  bool ifacePrintAuto;
  bool ifacePrintSkipScreen;
  bool ifacePrintViaProxy;
  bool ifacePrintbill;
  bool ifaceScanViaProxy;
  bool ifaceSplitbill;
  bool ifaceStartCategId;
  String ifaceTaxIncluded;
  bool ifaceTipproduct;
  bool ifaceVkeyboard;
  List<dynamic> invoiceJournalId;
  bool isHeaderOrFooter;
  bool isInstalledAccountAccountant;
  bool isOrderPrinter;
  bool isPosbox;
  bool isTableManagement;
  List<dynamic> journalId;
  List<dynamic> journalIds;
  int lastSessionClosingCash;
  String lastSessionClosingDate;
  bool moduleAccount;
  bool modulePosDiscount;
  bool modulePosLoyalty;
  bool modulePosMercury;
  bool modulePosReprint;
  bool modulePosRestaurant;
  String name;
  List<dynamic> pickingTypeId;
  String posSessionDuration;
  dynamic posSessionState;
  String posSessionUsername;
  List<dynamic> pricelistId;
  List<dynamic> printerIds;
  bool proxyIp;
  bool receiptFooter;
  bool receiptHeader;
  bool restrictPriceControl;
  List<dynamic> sequenceId;
  List<dynamic> sequenceLineId;
  List<dynamic> sessionIds;
  bool startCategory;
  List<dynamic> stockLocationId;
  bool taxRegime;
  bool taxRegimeSelection;
  bool tipProductId;
  bool useExistingLots;
  bool usePricelist;
  String uuid;
  String writeDate;
  List<dynamic> writeUid;
  List<dynamic> wvLodadConfig;
  int wvOrderDate;

  PosConfig(
      {this.sLastUpdate,
      this.active,
      this.allowLoadOrders,
      this.availableCateg,
      this.availablePricelistIds,
      this.barcodeNomenclatureId,
      this.barcodeScanner,
      this.cashControl,
      this.companyId,
      this.createDate,
      this.createUid,
      this.crmTeamId,
      this.currencyId,
      this.currentSessionId,
      this.currentSessionState,
      this.customerFacingDisplayHtml,
      this.defaultCashboxLinesIds,
      this.defaultFiscalPositionId,
      this.discountPc,
      this.discountProductId,
      this.displayName,
      this.fiscalPositionIds,
      this.floorIds,
      this.groupBy,
      this.groupPosManagerId,
      this.groupPosUserId,
      this.id,
      this.ifaceBigScrollbars,
      this.ifaceCashdrawer,
      this.ifaceCustomerFacingDisplay,
      this.ifaceDiscount,
      this.ifaceDisplayCategImages,
      this.ifaceElectronicScale,
      this.ifaceOrderlineNotes,
      this.ifacePaymentTerminal,
      this.ifacePrecomputeCash,
      this.ifacePrintAuto,
      this.ifacePrintSkipScreen,
      this.ifacePrintViaProxy,
      this.ifacePrintbill,
      this.ifaceScanViaProxy,
      this.ifaceSplitbill,
      this.ifaceStartCategId,
      this.ifaceTaxIncluded,
      this.ifaceTipproduct,
      this.ifaceVkeyboard,
      this.invoiceJournalId,
      this.isHeaderOrFooter,
      this.isInstalledAccountAccountant,
      this.isOrderPrinter,
      this.isPosbox,
      this.isTableManagement,
      this.journalId,
      this.journalIds,
      this.lastSessionClosingCash,
      this.lastSessionClosingDate,
      this.moduleAccount,
      this.modulePosDiscount,
      this.modulePosLoyalty,
      this.modulePosMercury,
      this.modulePosReprint,
      this.modulePosRestaurant,
      this.name,
      this.pickingTypeId,
      this.posSessionDuration,
      this.posSessionState,
      this.posSessionUsername,
      this.pricelistId,
      this.printerIds,
      this.proxyIp,
      this.receiptFooter,
      this.receiptHeader,
      this.restrictPriceControl,
      this.sequenceId,
      this.sequenceLineId,
      this.sessionIds,
      this.startCategory,
      this.stockLocationId,
      this.taxRegime,
      this.taxRegimeSelection,
      this.tipProductId,
      this.useExistingLots,
      this.usePricelist,
      this.uuid,
      this.writeDate,
      this.writeUid,
      this.wvLodadConfig,
      this.wvOrderDate});

  PosConfig.fromJson(Map<String, dynamic> json) {
    sLastUpdate = json['__last_update'];
    active = json['active'];
    allowLoadOrders = json['allow_load_orders'];
    if (json["available_categ"] != null) {
      availableCateg = List<dynamic>.from(
          json["available_categ"] != null ? json["available_categ"] : []);
    }
    if (json["available_pricelist_ids"] != null) {
      availablePricelistIds = List<dynamic>.from(
          json["available_pricelist_ids"] != null
              ? json["available_pricelist_ids"]
              : []);
    }
    if (json["barcode_nomenclature_id"] != null) {
      barcodeNomenclatureId = List<dynamic>.from(
          json["barcode_nomenclature_id"] != null
              ? json["barcode_nomenclature_id"]
              : []);
    }
    barcodeScanner = json['barcode_scanner'];
    cashControl = json['cash_control'];
    if (json["company_id"] != null) {
      companyId = List<dynamic>.from(
          json["company_id"] != null ? json["company_id"] : []);
    }
    createDate = json['create_date'];
    if (json["create_uid"] != null) {
      createUid = List<dynamic>.from(
          json["create_uid"] != null ? json["create_uid"] : []);
    }
    if (json["crm_team_id"] != null) {
      crmTeamId = List<dynamic>.from(
          json["crm_team_id"] != null ? json["crm_team_id"] : []);
    }
    if (json["currency_id"] != null) {
      currencyId = List<dynamic>.from(
          json["currency_id"] != null ? json["currency_id"] : []);
    }
    if (json["current_session_id"] != null) {
      currentSessionId = List<dynamic>.from(
          json["current_session_id"] != null ? json["current_session_id"] : []);
    }
    currentSessionState = json['current_session_state'];
    customerFacingDisplayHtml = json['customer_facing_display_html'];
    if (json["default_cashbox_lines_ids"] != null) {
      defaultCashboxLinesIds = List<dynamic>.from(
          json["default_cashbox_lines_ids"] != null
              ? json["default_cashbox_lines_ids"]
              : []);
    }
    defaultFiscalPositionId = json['default_fiscal_position_id'];
    discountPc = json['discount_pc'];
    discountProductId = json['discount_product_id'];
    displayName = json['display_name'];
    if (json["fiscal_position_ids"] != null) {
      fiscalPositionIds = List<dynamic>.from(json["fiscal_position_ids"] != null
          ? json["fiscal_position_ids"]
          : []);
    }
    if (json["floor_ids"] != null) {
      floorIds = List<dynamic>.from(
          json["floor_ids"] != null ? json["floor_ids"] : []);
    }
    groupBy = json['group_by'];
    if (json["group_pos_manager_id"] != null) {
      groupPosManagerId = List<dynamic>.from(
          json["group_pos_manager_id"] != null
              ? json["group_pos_manager_id"]
              : []);
    }
    if (json["group_pos_user_id"] != null) {
      groupPosUserId = List<dynamic>.from(
          json["group_pos_user_id"] != null ? json["group_pos_user_id"] : []);
    }
    id = json['id'];
    ifaceBigScrollbars = json['iface_big_scrollbars'];
    ifaceCashdrawer = json['iface_cashdrawer'];
    ifaceCustomerFacingDisplay = json['iface_customer_facing_display'];
    ifaceDiscount = json['iface_discount'];
    ifaceDisplayCategImages = json['iface_display_categ_images'];
    ifaceElectronicScale = json['iface_electronic_scale'];
    ifaceOrderlineNotes = json['iface_orderline_notes'];
    ifacePaymentTerminal = json['iface_payment_terminal'];
    ifacePrecomputeCash = json['iface_precompute_cash'];
    ifacePrintAuto = json['iface_print_auto'];
    ifacePrintSkipScreen = json['iface_print_skip_screen'];
    ifacePrintViaProxy = json['iface_print_via_proxy'];
    ifacePrintbill = json['iface_printbill'];
    ifaceScanViaProxy = json['iface_scan_via_proxy'];
    ifaceSplitbill = json['iface_splitbill'];
    ifaceStartCategId = json['iface_start_categ_id'];
    ifaceTaxIncluded = json['iface_tax_included'];
    ifaceTipproduct = json['iface_tipproduct'];
    ifaceVkeyboard = json['iface_vkeyboard'];
    if (json["invoice_journal_id"] != null) {
      invoiceJournalId = List<dynamic>.from(
          json["invoice_journal_id"] != null ? json["invoice_journal_id"] : []);
    }
    isHeaderOrFooter = json['is_header_or_footer'];
    isInstalledAccountAccountant = json['is_installed_account_accountant'];
    isOrderPrinter = json['is_order_printer'];
    isPosbox = json['is_posbox'];
    isTableManagement = json['is_table_management'];
    if (json["journal_id"] != null) {
      journalId = List<dynamic>.from(
          json["journal_id"] != null ? json["journal_id"] : []);
    }
    if (json["journal_ids"] != null) {
      journalIds = List<dynamic>.from(
          json["journal_ids"] != null ? json["journal_ids"] : []);
    }
    lastSessionClosingCash = json['last_session_closing_cash'];
    lastSessionClosingDate = json['last_session_closing_date'];
    moduleAccount = json['module_account'];
    modulePosDiscount = json['module_pos_discount'];
    modulePosLoyalty = json['module_pos_loyalty'];
    modulePosMercury = json['module_pos_mercury'];
    modulePosReprint = json['module_pos_reprint'];
    modulePosRestaurant = json['module_pos_restaurant'];
    name = json['name'];
    if (json["picking_type_id"] != null) {
      pickingTypeId = List<dynamic>.from(
          json["picking_type_id"] != null ? json["picking_type_id"] : []);
    }
    posSessionDuration = json['pos_session_duration'];
    posSessionState = json['pos_session_state'];
    posSessionUsername = json['pos_session_username'];
    if (json["pricelist_id"] != null) {
      pricelistId = List<dynamic>.from(
          json["pricelist_id"] != null ? json["pricelist_id"] : []);
    }
    if (json["printer_ids"] != null) {
      printerIds = List<dynamic>.from(
          json["printer_ids"] != null ? json["printer_ids"] : []);
    }
    proxyIp = json['proxy_ip'];
    receiptFooter = json['receipt_footer'];
    receiptHeader = json['receipt_header'];
    restrictPriceControl = json['restrict_price_control'];
    if (json["sequence_id"] != null) {
      sequenceId = List<dynamic>.from(
          json["sequence_id"] != null ? json["sequence_id"] : []);
    }
    if (json["sequence_line_id"] != null) {
      sequenceLineId = List<dynamic>.from(
          json["sequence_line_id"] != null ? json["sequence_line_id"] : []);
    }
    if (json["session_ids"] != null) {
      sessionIds = List<dynamic>.from(
          json["session_ids"] != null ? json["session_ids"] : []);
    }
    startCategory = json['start_category'];
    if (json["stock_location_id"] != null) {
      stockLocationId = List<dynamic>.from(
          json["stock_location_id"] != null ? json["stock_location_id"] : []);
    }
    taxRegime = json['tax_regime'];
    taxRegimeSelection = json['tax_regime_selection'];
    tipProductId = json['tip_product_id'];
    useExistingLots = json['use_existing_lots'];
    usePricelist = json['use_pricelist'];
    uuid = json['uuid'];
    writeDate = json['write_date'];
    if (json["write_uid"] != null) {
      writeUid = List<dynamic>.from(
          json["write_uid"] != null ? json["write_uid"] : []);
    }
    if (json["wv_lodad_config"] != null) {
      wvLodadConfig = List<dynamic>.from(
          json["wv_lodad_config"] != null ? json["wv_lodad_config"] : []);
    }
    wvOrderDate = json['wv_order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__last_update'] = this.sLastUpdate;
    data['active'] = this.active;
    data['allow_load_orders'] = this.allowLoadOrders;
    data['available_categ'] = this.availableCateg;
    data['available_pricelist_ids'] = this.availablePricelistIds;
    data['barcode_nomenclature_id'] = this.barcodeNomenclatureId;
    data['barcode_scanner'] = this.barcodeScanner;
    data['cash_control'] = this.cashControl;
    data['company_id'] = this.companyId;
    data['create_date'] = this.createDate;
    data['create_uid'] = this.createUid;
    data['crm_team_id'] = this.crmTeamId;
    data['currency_id'] = this.currencyId;
    data['current_session_id'] = this.currentSessionId;
    data['current_session_state'] = this.currentSessionState;
    data['customer_facing_display_html'] = this.customerFacingDisplayHtml;
    data['default_cashbox_lines_ids'] = this.defaultCashboxLinesIds;
    data['default_fiscal_position_id'] = this.defaultFiscalPositionId;
    data['discount_pc'] = this.discountPc;
    data['discount_product_id'] = this.discountProductId;
    data['display_name'] = this.displayName;
    data['fiscal_position_ids'] = this.fiscalPositionIds;
    data['floor_ids'] = this.floorIds;
    data['group_by'] = this.groupBy;
    data['group_pos_manager_id'] = this.groupPosManagerId;
    data['group_pos_user_id'] = this.groupPosUserId;
    data['id'] = this.id;
    data['iface_big_scrollbars'] = this.ifaceBigScrollbars;
    data['iface_cashdrawer'] = this.ifaceCashdrawer;
    data['iface_customer_facing_display'] = this.ifaceCustomerFacingDisplay;
    data['iface_discount'] = this.ifaceDiscount;
    data['iface_display_categ_images'] = this.ifaceDisplayCategImages;
    data['iface_electronic_scale'] = this.ifaceElectronicScale;
    data['iface_orderline_notes'] = this.ifaceOrderlineNotes;
    data['iface_payment_terminal'] = this.ifacePaymentTerminal;
    data['iface_precompute_cash'] = this.ifacePrecomputeCash;
    data['iface_print_auto'] = this.ifacePrintAuto;
    data['iface_print_skip_screen'] = this.ifacePrintSkipScreen;
    data['iface_print_via_proxy'] = this.ifacePrintViaProxy;
    data['iface_printbill'] = this.ifacePrintbill;
    data['iface_scan_via_proxy'] = this.ifaceScanViaProxy;
    data['iface_splitbill'] = this.ifaceSplitbill;
    data['iface_start_categ_id'] = this.ifaceStartCategId;
    data['iface_tax_included'] = this.ifaceTaxIncluded;
    data['iface_tipproduct'] = this.ifaceTipproduct;
    data['iface_vkeyboard'] = this.ifaceVkeyboard;
    data['invoice_journal_id'] = this.invoiceJournalId;
    data['is_header_or_footer'] = this.isHeaderOrFooter;
    data['is_installed_account_accountant'] = this.isInstalledAccountAccountant;
    data['is_order_printer'] = this.isOrderPrinter;
    data['is_posbox'] = this.isPosbox;
    data['is_table_management'] = this.isTableManagement;
    data['journal_id'] = this.journalId;
    data['journal_ids'] = this.journalIds;
    data['last_session_closing_cash'] = this.lastSessionClosingCash;
    data['last_session_closing_date'] = this.lastSessionClosingDate;
    data['module_account'] = this.moduleAccount;
    data['module_pos_discount'] = this.modulePosDiscount;
    data['module_pos_loyalty'] = this.modulePosLoyalty;
    data['module_pos_mercury'] = this.modulePosMercury;
    data['module_pos_reprint'] = this.modulePosReprint;
    data['module_pos_restaurant'] = this.modulePosRestaurant;
    data['name'] = this.name;
    data['picking_type_id'] = this.pickingTypeId;
    data['pos_session_duration'] = this.posSessionDuration;
    data['pos_session_state'] = this.posSessionState;
    data['pos_session_username'] = this.posSessionUsername;
    data['pricelist_id'] = this.pricelistId;
    data['printer_ids'] = this.printerIds;
    data['proxy_ip'] = this.proxyIp;
    data['receipt_footer'] = this.receiptFooter;
    data['receipt_header'] = this.receiptHeader;
    data['restrict_price_control'] = this.restrictPriceControl;
    data['sequence_id'] = this.sequenceId;
    data['sequence_line_id'] = this.sequenceLineId;
    data['session_ids'] = this.sessionIds;
    data['start_category'] = this.startCategory;
    data['stock_location_id'] = this.stockLocationId;
    data['tax_regime'] = this.taxRegime;
    data['tax_regime_selection'] = this.taxRegimeSelection;
    data['tip_product_id'] = this.tipProductId;
    data['use_existing_lots'] = this.useExistingLots;
    data['use_pricelist'] = this.usePricelist;
    data['uuid'] = this.uuid;
    data['write_date'] = this.writeDate;
    data['write_uid'] = this.writeUid;
    data['wv_lodad_config'] = this.wvLodadConfig;
    data['wv_order_date'] = this.wvOrderDate;
    return data;
  }
}
