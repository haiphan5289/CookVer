// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let backOpacity06 = ColorAsset(name: "backOpacity06")
  internal static let primary = ColorAsset(name: "primary")
  internal static let bachTuotNgamXaTac = ImageAsset(name: "bach-tuot-ngam-xa-tac")
  internal static let bachTuotNhungGiam = ImageAsset(name: "bach-tuot-nhung-giam")
  internal static let bachTuotSaTe = ImageAsset(name: "bach-tuot-sa-te")
  internal static let banhBotLoc = ImageAsset(name: "banh-bot-loc")
  internal static let banhBotMiChien = ImageAsset(name: "banh-bot-mi-chien")
  internal static let banhCanNhaTrang = ImageAsset(name: "banh-can-nha-trang")
  internal static let banhCanhCaLocHue = ImageAsset(name: "banh-canh-ca-loc-hue")
  internal static let banhCanhChaCaNhaTrang = ImageAsset(name: "banh-canh-cha-ca-nha-trang")
  internal static let banhCay = ImageAsset(name: "banh-cay")
  internal static let banhItTran = ImageAsset(name: "banh-it-tran")
  internal static let banhKhoaiHue = ImageAsset(name: "banh-khoai-hue")
  internal static let banhNamHue = ImageAsset(name: "banh-nam-hue")
  internal static let banhTieuNhanThit = ImageAsset(name: "banh-tieu-nhan-thit")
  internal static let banhTo = ImageAsset(name: "banh-to")
  internal static let banhTrangCuon = ImageAsset(name: "banh-trang-cuon")
  internal static let banhTrangTron = ImageAsset(name: "banh-trang-tron")
  internal static let banhXeo = ImageAsset(name: "banh-xeo")
  internal static let baoTuHamTieu = ImageAsset(name: "bao-tu-ham-tieu")
  internal static let bapBoLuocGungXa = ImageAsset(name: "bap-bo-luoc-gung-xa")
  internal static let boBia = ImageAsset(name: "bo-bia")
  internal static let boBitTet = ImageAsset(name: "bo-bit-tet")
  internal static let boCuonTomNuong = ImageAsset(name: "bo-cuon-tom-nuong")
  internal static let boKhoChay = ImageAsset(name: "bo-kho-chay")
  internal static let boLucLac = ImageAsset(name: "bo-luc-lac")
  internal static let boNuongLaLop = ImageAsset(name: "bo-nuong-la-lop")
  internal static let botChienTrung = ImageAsset(name: "bot-chien-trung")
  internal static let bunBoHue = ImageAsset(name: "bun-bo-hue")
  internal static let bunCaKienGiang = ImageAsset(name: "bun-ca-kien-giang")
  internal static let bunChaHaNoi = ImageAsset(name: "bun-cha-ha-noi")
  internal static let bunDauMamTom = ImageAsset(name: "bun-dau-mam-tom")
  internal static let bunGaoXaoChay = ImageAsset(name: "bun-gao-xao-chay")
  internal static let bunMamThomNgon = ImageAsset(name: "bun-mam-thom-ngon")
  internal static let bunMucThit = ImageAsset(name: "bun-muc-thit")
  internal static let bunOcChuoiDau = ImageAsset(name: "bun-oc-chuoi-dau")
  internal static let bunOcHaNoi = ImageAsset(name: "bun-oc-ha-noi")
  internal static let bunRieuChay = ImageAsset(name: "bun-rieu-chay")
  internal static let bunSuaNuocLeo = ImageAsset(name: "bun-sua-nuoc-leo")
  internal static let bunThitNuong = ImageAsset(name: "bun-thit-nuong")
  internal static let caBongKhoTieu = ImageAsset(name: "ca-bong-kho-tieu")
  internal static let caChachNuong = ImageAsset(name: "ca-chach-nuong")
  internal static let caChepOmDua = ImageAsset(name: "ca-chep-om-dua")
  internal static let caChuonChien = ImageAsset(name: "ca-chuon-chien")
  internal static let caComKhoTieu = ImageAsset(name: "ca-com-kho-tieu")
  internal static let caComRangChuaNgot = ImageAsset(name: "ca-com-rang-chua-ngot")
  internal static let caKhoNuocCotDua = ImageAsset(name: "ca-kho-nuoc-cot-dua")
  internal static let caKhoTo = ImageAsset(name: "ca-kho-to")
  internal static let caLocHapBia = ImageAsset(name: "ca-loc-hap-bia")
  internal static let caLocHapMe = ImageAsset(name: "ca-loc-hap-me")
  internal static let caNuongChamMuoiOtXanh = ImageAsset(name: "ca-nuong-cham-muoi-ot-xanh")
  internal static let caRoKhoTo = ImageAsset(name: "ca-ro-kho-to")
  internal static let caThuChienNuocMam = ImageAsset(name: "ca-thu-chien-nuoc-mam")
  internal static let caThuKhoTieu = ImageAsset(name: "ca-thu-kho-tieu")
  internal static let cachLamLauOcChuaCay = ImageAsset(name: "cach-lam-lau-oc-chua-cay")
  internal static let cachNauMiKimChiThitBo = ImageAsset(name: "cach-nau-mi-kim-chi-thit-bo")
  internal static let cangCumRangMuoiOt = ImageAsset(name: "cang-cum-rang-muoi-ot")
  internal static let canhBapHamHeo = ImageAsset(name: "canh-bap-ham-heo")
  internal static let canhChuaCaLoc = ImageAsset(name: "canh-chua-ca-loc")
  internal static let canhChuaRauMuong = ImageAsset(name: "canh-chua-rau-muong")
  internal static let canhGaNuongChao = ImageAsset(name: "canh-ga-nuong-chao")
  internal static let canhGaSotChuaCayThai = ImageAsset(name: "canh-ga-sot-chua-cay-thai")
  internal static let canhHenNauDuaChua = ImageAsset(name: "canh-hen-nau-dua-chua")
  internal static let canhKimChiNauSuon = ImageAsset(name: "canh-kim-chi-nau-suon")
  internal static let canhSuonNauChua = ImageAsset(name: "canh-suon-nau-chua")
  internal static let canhThitBoNauXoaiXanh = ImageAsset(name: "canh-thit-bo-nau-xoai-xanh")
  internal static let canhTomYunThai = ImageAsset(name: "canh-tom-yun-thai")
  internal static let caoLauHoiAn = ImageAsset(name: "cao-lau-hoi-an")
  internal static let catHeoXao = ImageAsset(name: "cat-heo-xao")
  internal static let chaCuaChay = ImageAsset(name: "cha-cua-chay")
  internal static let chaDumBo = ImageAsset(name: "cha-dum-bo")
  internal static let chanGaMuoi = ImageAsset(name: "chan-ga-muoi")
  internal static let chanGaNauCaRi = ImageAsset(name: "chan-ga-nau-ca-ri")
  internal static let chanGioKhoRieng = ImageAsset(name: "chan-gio-kho-rieng")
  internal static let chaoBaoNgu = ImageAsset(name: "chao-bao-ngu")
  internal static let chaoThitBam = ImageAsset(name: "chao-thit-bam")
  internal static let cheMitSuaDua = ImageAsset(name: "che-mit-sua-dua")
  internal static let chuoiBocNepNuong = ImageAsset(name: "chuoi-boc-nep-nuong")
  internal static let comChienDuongChau = ImageAsset(name: "com-chien-duong-chau")
  internal static let comGaHoiAn = ImageAsset(name: "com-ga-hoi-an")
  internal static let comLam = ImageAsset(name: "com-lam")
  internal static let comNamCuonJambon = ImageAsset(name: "com-nam-cuon-jambon")
  internal static let comNamThapCam = ImageAsset(name: "com-nam-thap-cam")
  internal static let comRuouMienNam = ImageAsset(name: "com-ruou-mien-nam")
  internal static let cuCaiKhoCa = ImageAsset(name: "cu-cai-kho-ca")
  internal static let cuaHapBia = ImageAsset(name: "cua-hap-bia")
  internal static let dauBapXaoToi = ImageAsset(name: "dau-bap-xao-toi")
  internal static let dauHuSotTrungCa = ImageAsset(name: "dau-hu-sot-trung-ca")
  internal static let dauPhongRangToiOt = ImageAsset(name: "dau-phong-rang-toi-ot")
  internal static let doiTruongXaoCaiChua = ImageAsset(name: "doi-truong-xao-cai-chua")
  internal static let duaMon = ImageAsset(name: "dua-mon")
  internal static let gaRangLaChanh = ImageAsset(name: "ga-rang-la-chanh")
  internal static let gaRangLaGung = ImageAsset(name: "ga-rang-la-gung")
  internal static let gaRangMuoi = ImageAsset(name: "ga-rang-muoi")
  internal static let gaTronKhoaiTy = ImageAsset(name: "ga-tron-khoai-ty")
  internal static let gaUMuoiXongKhoi = ImageAsset(name: "ga-u-muoi-xong-khoi")
  internal static let gaXaoHanhNhan = ImageAsset(name: "ga-xao-hanh-nhan")
  internal static let giaXaoThitBo = ImageAsset(name: "gia-xao-thit-bo")
  internal static let gioHeoXongKhoi = ImageAsset(name: "gio-heo-xong-khoi")
  internal static let gioSongNhoiDau = ImageAsset(name: "gio-song-nhoi-dau")
  internal static let gioThuNgon = ImageAsset(name: "gio-thu-ngon")
  internal static let goiBoBopThau = ImageAsset(name: "goi-bo-bop-thau")
  internal static let goiCuonTomThit = ImageAsset(name: "goi-cuon-tom-thit")
  internal static let goiGaNgoiSen = ImageAsset(name: "goi-ga-ngoi-sen")
  internal static let goiOcDangBapChuoi = ImageAsset(name: "goi-oc-dang-bap-chuoi")
  internal static let goiOcGiac = ImageAsset(name: "goi-oc-giac")
  internal static let goiVitBapCai = ImageAsset(name: "goi-vit-bap-cai")
  internal static let hauNuongPhoMai = ImageAsset(name: "hau-nuong-pho-mai")
  internal static let henXaoMit = ImageAsset(name: "hen-xao-mit")
  internal static let henXucBanhDa = ImageAsset(name: "hen-xuc-banh-da")
  internal static let hotVitLonXaoMe = ImageAsset(name: "hot-vit-lon-xao-me")
  internal static let hotVitNuongMuoiOt = ImageAsset(name: "hot-vit-nuong-muoi-ot")
  internal static let huongDanCachLamXoiDauXanhDuaSoiXoiDauXanhDuaSoi = ImageAsset(name: "huong-dan-cach-lam-xoi-dau-xanh-dua-soi-xoi-dau-xanh-dua-soi")
  internal static let kemXoi = ImageAsset(name: "kem-xoi")
  internal static let khoaiSoKhoThitBo = ImageAsset(name: "khoai-so-kho-thit-bo")
  internal static let kimBap = ImageAsset(name: "kim-bap")
  internal static let kimChi = ImageAsset(name: "kim-chi")
  internal static let lauGaOtHiem = ImageAsset(name: "lau-ga-ot-hiem")
  internal static let lauKimChiHaiSan = ImageAsset(name: "lau-kim-chi-hai-san")
  internal static let lauLuon = ImageAsset(name: "lau-luon")
  internal static let lauMangChuaRieuCua = ImageAsset(name: "lau-mang-chua-rieu-cua")
  internal static let longXaoDuaChua = ImageAsset(name: "long-xao-dua-chua")
  internal static let longXaoNghe = ImageAsset(name: "long-xao-nghe")
  internal static let luocGheThomNgon = ImageAsset(name: "luoc-ghe-thom-ngon")
  internal static let luonLuonXa = ImageAsset(name: "luon-luon-xa")
  internal static let mangLeXaoGan = ImageAsset(name: "mang-le-xao-gan")
  internal static let miHonagThanhHeo = ImageAsset(name: "mi-honag-thanh-heo")
  internal static let miTronHanhGung = ImageAsset(name: "mi-tron-hanh-gung")
  internal static let miTronThai = ImageAsset(name: "mi-tron-thai")
  internal static let miXaoBo = ImageAsset(name: "mi-xao-bo")
  internal static let miXaoThitGa = ImageAsset(name: "mi-xao-thit-ga")
  internal static let mienTronTomThit = ImageAsset(name: "mien-tron-tom-thit")
  internal static let mitTronTomThit = ImageAsset(name: "mit-tron-tom-thit")
  internal static let muaRangMuoi = ImageAsset(name: "mua-rang-muoi")
  internal static let mucHapGung = ImageAsset(name: "muc-hap-gung")
  internal static let mucNhoiThitNuong = ImageAsset(name: "muc-nhoi-thit-nuong")
  internal static let mucNuongMuoiOtCay = ImageAsset(name: "muc-nuong-muoi-ot-cay")
  internal static let mucRimMe = ImageAsset(name: "muc-rim-me")
  internal static let mucXaoToi = ImageAsset(name: "muc-xao-toi")
  internal static let muopXaoTrung = ImageAsset(name: "muop-xao-trung")
  internal static let mutDuaNguSac = ImageAsset(name: "mut-dua-ngu-sac")
  internal static let myYThitBam = ImageAsset(name: "my-y-thit-bam")
  internal static let nemChuaBo = ImageAsset(name: "nem-chua-bo")
  internal static let nemCuaBe = ImageAsset(name: "nem-cua-be")
  internal static let nemLuiXuHue = ImageAsset(name: "nem-lui-xu-hue")
  internal static let nemNuongNhaTrang = ImageAsset(name: "nem-nuong-nha-trang")
  internal static let nemOc = ImageAsset(name: "nem-oc")
  internal static let ngheuHapThai = ImageAsset(name: "ngheu-hap-thai")
  internal static let ngheuXaoSate = ImageAsset(name: "ngheu-xao-sate")
  internal static let nomMySotVung = ImageAsset(name: "nom-my-sot-vung")
  internal static let ocBuouNhoiThit = ImageAsset(name: "oc-buou-nhoi-thit")
  internal static let ocBuouNuongMuoiOt = ImageAsset(name: "oc-buou-nuong-muoi-ot")
  internal static let ocBuouNuongTieuXanh = ImageAsset(name: "oc-buou-nuong-tieu-xanh")
  internal static let ocHuongRangMuoiOt = ImageAsset(name: "oc-huong-rang-muoi-ot")
  internal static let ocMongTayXaoRauMuong = ImageAsset(name: "oc-mong-tay-xao-rau-muong")
  internal static let ocOmChuoiDau = ImageAsset(name: "oc-om-chuoi-dau")
  internal static let ocXaoThapCam = ImageAsset(name: "oc-xao-thap-cam")
  internal static let ocXaoXaOt = ImageAsset(name: "oc-xao-xa-ot")
  internal static let otChuongNhoiHaiSanNuong = ImageAsset(name: "ot-chuong-nhoi-hai-san-nuong")
  internal static let phaLauLongBo = ImageAsset(name: "pha-lau-long-bo")
  internal static let phaLauTaiHeo = ImageAsset(name: "pha-lau-tai-heo")
  internal static let phoGa = ImageAsset(name: "pho-ga")
  internal static let rauCaiChipNamHuong = ImageAsset(name: "rau-cai-chip-nam-huong")
  internal static let saladBoCaHoi = ImageAsset(name: "salad-bo-ca-hoi")
  internal static let saladBoTrungGa = ImageAsset(name: "salad-bo-trung-ga")
  internal static let saladBo = ImageAsset(name: "salad-bo")
  internal static let saladCaNgua = ImageAsset(name: "salad-ca-ngua")
  internal static let saladCaRot = ImageAsset(name: "salad-ca-rot")
  internal static let saladDuaTom = ImageAsset(name: "salad-dua-tom")
  internal static let saladXoaiChua = ImageAsset(name: "salad-xoai-chua")
  internal static let soDiepNuongMoHanh = ImageAsset(name: "so-diep-nuong-mo-hanh")
  internal static let soHuyetXaoToi = ImageAsset(name: "so-huyet-xao-toi")
  internal static let soLongNuongMoHanh = ImageAsset(name: "so-long-nuong-mo-hanh")
  internal static let suonCotLetChienMatOng = ImageAsset(name: "suon-cot-let-chien-mat-ong")
  internal static let suonCotLet = ImageAsset(name: "suon-cot-let")
  internal static let suonKhoTrungCut = ImageAsset(name: "suon-kho-trung-cut")
  internal static let suonLonHap = ImageAsset(name: "suon-lon-hap")
  internal static let suonNonNuongTieu = ImageAsset(name: "suon-non-nuong-tieu")
  internal static let suonNuongMuoiOt = ImageAsset(name: "suon-nuong-muoi-ot")
  internal static let suonOmXiDau = ImageAsset(name: "suon-om-xi-dau")
  internal static let supCuaCuNang = ImageAsset(name: "sup-cua-cu-nang")
  internal static let supCua = ImageAsset(name: "sup-cua")
  internal static let supThitBo = ImageAsset(name: "sup-thit-bo")
  internal static let taiHeoNgamGiam = ImageAsset(name: "tai-heo-ngam-giam")
  internal static let taiHeoNgamNuocMam = ImageAsset(name: "tai-heo-ngam-nuoc-mam")
  internal static let thitBaRoiChienMuoi = ImageAsset(name: "thit-ba-roi-chien-muoi")
  internal static let thitBoKho = ImageAsset(name: "thit-bo-kho")
  internal static let thitChanGioKhoTieu = ImageAsset(name: "thit-chan-gio-kho-tieu")
  internal static let thitHeoLuoc = ImageAsset(name: "thit-heo-luoc")
  internal static let thitHeoXienNuong = ImageAsset(name: "thit-heo-xien-nuong")
  internal static let thitKhoMang = ImageAsset(name: "thit-kho-mang")
  internal static let thitKhoTrung = ImageAsset(name: "thit-kho-trung")
  internal static let thitNauDong = ImageAsset(name: "thit-nau-dong")
  internal static let tomChua = ImageAsset(name: "tom-chua")
  internal static let tomDuaNuong = ImageAsset(name: "tom-dua-nuong")
  internal static let tomNuongMuoiOt = ImageAsset(name: "tom-nuong-muoi-ot")
  internal static let tomSotCam = ImageAsset(name: "tom-sot-cam")
  internal static let tomSotThai = ImageAsset(name: "tom-sot-thai")
  internal static let trungBacThao = ImageAsset(name: "trung-bac-thao")
  internal static let trungHapSua = ImageAsset(name: "trung-hap-sua")
  internal static let trungRan = ImageAsset(name: "trung-ran")
  internal static let vitNuongMuoiOt = ImageAsset(name: "vit-nuong-muoi-ot")
  internal static let vitQuay = ImageAsset(name: "vit-quay")
  internal static let xoiComDua = ImageAsset(name: "xoi-com-dua")
  internal static let icAdd = ImageAsset(name: "ic_add")
  internal static let icFavorite = ImageAsset(name: "ic_favorite")
  internal static let icGravy = ImageAsset(name: "ic_gravy")
  internal static let icHome = ImageAsset(name: "ic_home")
  internal static let icSearch = ImageAsset(name: "ic_search")
  internal static let icSettings = ImageAsset(name: "ic_settings")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
