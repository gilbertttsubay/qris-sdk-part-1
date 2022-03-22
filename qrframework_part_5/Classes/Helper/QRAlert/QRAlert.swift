//
// Created by Gilbert on 3/16/22.
//

import Foundation
//
//  Alert.swift
//  PJIOnlineTransport
//
//  Created by Tirta Rivaldi on 7/18/18.
//  Copyright © 2018 Tirta Rivaldi. All rights reserved.
//
//MARK: USED

import Foundation
import UIKit

enum QRAlertInfo: String{

    case errorTitle = "Oops :("
    case successTitle = "Sukses"
    case errorMsg = "Sedang terjadi masalah, harap coba beberapa saat lagi"
    case emptyTitle = ""
    case comfrimTitle = "Konfirmasi"
    case errorConnection = "Koneksi Anda bermasalah. \n Cek jaringan Anda dan coba kembali."

    //Setting Change Email
    case sameEmailValidate = "Email pengganti tidak boleh sama dengan email lama anda."
    case newEmailValidate = "Email pengganti tidak boleh kosong!"
    case changeEmailSuccesPopUP = "Emailmu berhasil diganti."

    //Setting Change Name
    case sameNameValidate = "Nama pengganti tidak boleh sama dengan nama lama anda."
    case newNameValidate = "Nama pengganti tidak boleh kosong!"
    case changeNameSuccesPopUP = "Ganti nama berhasil."
    case changeNameUpgradeProses = "Penggantian nama tidak sukses. Kamu dalam proses upgrade akun."

    //walkthrough
    case quoteTitle1 = "Bayar Cicilan FIF BISA"
    case quoteTitle2 = "Tarik atau Transfer BISA"
    case quoteTitle3 = "Bayar Apapun BISA"
    case quote1 = "Pertama kalinya, kamu bisa langsung bayar\ncicilan FIF langsung dari AstraPay.\n#SemuaBisadiAstraPay"
    case quote2 = "Kamu bisa transfer ke sesama member AstraPay\ndan tarik tunai di ATM yang bekerjasama.\n#SemuaBisadiAstraPay"
    case quote3 = "Mulai dari pulsa, paket data, sampai ke\nasuransi semua bisa di AstraPay.\nApa saja pokoknya bisa. #SemuaBisadiAstraPay"

    case checkConnection = "Periksa kembali koneksi Anda"
    case validateEmail = "Masukkan Email Anda"
    case wrongFormatEmail = "Format Email salah"
    case agreementSnk = "Apakah Anda menyetujui syarat dan ketentuan ?"
    //case validatePwd = "Please enter your password"
    case validateEmailPin = "Apakah Anda yakin tidak melanjutkan proses penggantian pin yang anda dapatkan pada email?"
    case validateOldPwd = "Masukkan PIN lama Anda"
    case validateNewPwd = "Masukkan PIN baru Anda"
    case validateConfirmNewPwd = "Masukkan PIN konfirmasi Anda"
    case validateEqualPwd = "Pastikan bahwa konfirmasi PIN Anda sama"
    case validateCode = "Masukkan kode rahasia Anda"
    case successCheckEmail = "Kami telah mengirimkan kode rahasia di email Anda"
    case successVerifyCode = "Kode Anda telah diverifikasi"
    case failureVerifyCode = "Kode tidak sama"
    case successResetPwd = "PIN berhasil diperbaharui"
    case sendEmail = "Pengiriman bukti pembayaran telah berhasil"
    case notEnoughSaldo = "Maaf saldo Anda tidak mencukupi untuk melakukan transaksi"

    case successRequest = "Permintaan berhasil"
    case successUpdateProfile = "Update Profile Sukses"
    case validateVoucher = "Masukkan voucher anda"
    case validateNote = "Berikan alasan"
    case successReject = "Transaksi berhasil dikembalikan"
    case successApprove = "Terima kasih sudah menyetujui"
    case successSubmit = "Komentar telah diajukan harap menunggu persetujuan"
    case validateId = "ID tidak ditemukan, segarkan artikel"

    case validatePhone = "Nomor telepon tidak boleh kosong!"
    case validateSamePhone = "Nomor telepon baru anda sama dengan nomor telepon lama!"
    case validatePwd = "PIN tidak boleh kosong"
    case validateFAQ = "Harap menyetujui ketentuan dan persyaratan"
    case readingFAQ = "Silahkan membaca syarat dan ketentuan terlebih dahulu"
    case validateOTP = "Kode OTP tidak boleh kosong!"
    case validateEmailIndo = "Alamat Email tidak boleh kosong"
    case invalidEmail = "Format email salah"
    case invalidOTP = "Kode OTP tidak valid"
    case invalidToken = "Kode token tidak valid"

    case sessionTimeout = "Sesi Anda telah berakhir, silahkan login kembali"
    case validateBirthday = "Tanggal lahir tidak boleh melebihi tanggal hari ini!"
    case validateKTP = "Silahkan unggah foto KTP terlebih dahulu"
    case validateSignature = "Silahkan unggah foto tanda tangan dahulu"
    case validateSelfieKTP = "Silahkan unggah foto selfie beserta KTP dahulu"

    case existbank = "Nomor rekening dengan bank tersebut sudah \n pernah disimpan"
    case deleteBankAccount = "Akun bank kamu akan dihapus. Yakin mau lanjut?"
    case successUpgradeProfile = "Berhasil memperbarui data. Status Anda akan berubah menjadi Preferred setelah diverifikasi dalam 1x24 jam."
    case preferedPrior = "Akun Anda telah terverifikasi dan data Anda tidak dapat diubah kembali."
    case onProgressClassicVerification = "Akun Anda dalam proses verifikasi dan data Anda tidak dapat diubah sekarang"
    case successUpdateEmail = "Email berhasil diperbarui!"
    case successUpdatePhone = "Nomor handphone berhasil diperbarui!"
    case successUpdatePIN = "PIN berhasil diperbarui!"
    case insufficientBalance = "Saldo tidak mencukupi"
    case wrongVAnumber = "Nomor VA salah / tagihan sudah terbayar"
    case wrongPIN = "PIN salah!"
    case requestFail = "Nomor pelanggan tidak terdaftar \n Coba periksa kembali nomor pelanggan Anda"//"Permintaan tidak dapat diproses"
    case hasTransactionFif = "Nomor pelanggan tidak terdaftar. \n Coba periksa kembali nomor pelanggan Anda."
    case paymentFailFound = "Tagihan tidak ditemukan. Hubungi Customer Service kami (1500793)"
    case wrongPIN1 = "Maaf, PIN Anda salah"
    case invalidAccountPrefix = "Kombinasi nomor handphone dan PIN salah"
    case accountBeforeLocked = "Anda hanya memiliki satu kali kesempatan lagi atau akun Anda terblokir"
    case wrongPINsetting = "Maaf, PIN lama Anda salah"
    case wrongTemporaryPin = "PIN Sementara anda salah"
    case agreeTermCondition = "Anda harus membaca Syarat dan Ketentuan terlebih dahulu"
    case notFoundPayment = "Anda belum memiliki tagihan"
    case duplicatePIN = "PIN lama dan baru tidak boleh sama"
    case accountDuplicate = "Nomor yang Anda masukkan sudah terdaftar"
    case accountBankHasBeenSaved = "Nomor rekening dengan bank tersebut sudah pernah disimpan."
    case accountHasUsed = "Nomor handphone sudah digunakan"
    case maximalBalance = "Jumlah Transfer ke akun tujuan melebihi limit balance."
    case waitingResponse = "Kami sedang memproses transaksi Anda sebelumnya, mohon menunggu selambat-lambatnya 1x24 jam sebelum mengajukan kembali"
    case infoTitle = "Info"
    case validateLogout = "Anda yakin ingin keluar ?"
    case notVerified = "Untuk menggunakan fitur transfer, Anda harus memperbarui identitas. Apakah Anda ingin memperbarui data?"
    case progressKYC = "Mohon menunggu, proses verifikasi data Anda belum selesai."
    case wrongNumber = "Nomor handphone salah"
    case verificationOnProcess = "Mohon menunggu proses verifikasi data Anda belum selesai"
    case verificationRejected = "Verifikasi data ditolak"
    case emptyAmount = "Jumlah tidak boleh kosong!"
    case minimTransaction = "Minimum transaksi Rp 10.000"
    case errorAmountMinimumWithFee = "Jumlah Transfer kurang dari Rp. 16.500"
    case errorAmountMinimum = "Jumlah Transfer kurang dari Rp. 10.000"
    case warningTransaction = "Harap perhatikan jumlah minimal saldo"
    case limitTransaction = "Pastikan jumlah yang akan di transfer tidak kurang dari Rp 10.000"
    case successPayment = "Transaksi Anda telah berhasil"
    case emptyBank = "Tidak ada akun bank, silahkan simpan akun bank di Kelola Bank"
    case succesLoadBank = "Akun bank berhasil diperbaharui"
    case invalidDestination = "Nomor Handphone tujuan salah"
    case sameDestination = "Nomor akun yang dituju sama dengan nomor akun Anda"
    case invalidAccount = "Nomor handphone atau PIN Anda salah"
    case accountDoesntFound = "Akun Anda tidak ditemukan"
    case waitingForClose = "Akun Anda sedang dalam proses penutupan"
    case warningCloseAccount = "Apakah Anda yakin ingin menutup akun?"
    case removeBankSuccess = "Hapus akun bank berhasil"
    case information = "Minimal informasi keterangan adalah 5 huruf"
    case informationMax200 = "Maksimal informasi keterangan adalah 200 huruf"
    case insuficientBalance = "Balance Anda tidak mencukupi untuk melakukan penarikan"
    case accountLocked = "Mohon maaf, akun terkunci"
    case accountLockedOther = "Akun anda terblokir. Harap hubungi Customer Service 1500793"
    case emptyField = "Silahkan isi dengan benar"
    case phoneField = "Minimal nomor handphone yang terdaftar harus 10 digit"
    case maxResend = "Anda telah mencapai batas maksimum pengiriman kode OTP. Silahkan tunggu beberapa saat lagi"
    case successForgot = "Periksa email untuk mengetahui PIN baru Anda"
    case emptyPIN = "PIN tidak boleh kosong!"
    case jobDoesntMatch = "Pekerjaan tidak sesuai"
    case lessNoBpjs = "Nomor BPJS Anda tidak valid"
    case wrongConfirmationPIN = "PIN baru dan Konfirmasi PIN Baru harus sama"
    case uncompletePIN = "PIN tidak lengkap!"
    case periodMonth = "Pilih bulan yang akan dibayar"
    case limitBalanceDest = "Akun tujuan telah melewati batas maksimum transaksi masuk dalam 1 bulan (maksimal transaksi masuk 20 juta/bulan)"
    case sendEmailFif = "Bukti pembayaran telah dikirim.\n Silahkan cek email Anda"
    case idCardDuplicate = "Mohon maaf nomor KTP sudah digunakan"

    case hasTransactionFifOne = "Nomor kontrak tidak terdaftar. \nCoba periksa kembali nomor kontrak Anda."
    case hasTransactionAcc = "Nomor perjanjian tidak terdaftar. \nCoba periksa kembali nomor perjanjian Anda."

    case requestFailAnother = "Permintaan tidak dapat diproses, silahkan coba beberapa saat lagi"
    case lastAngsuran = "Angsuran terakhir. Harap melakukan pembayaran di cabang FIFGROUP terdekat"
    case errorDuplicateEmail = "Email yang Anda masukkan sudah digunakan"
    case errorSudahTarikSaldo = "Kami sedang memproses transaksi Anda sebelumnya, mohon menunggu selambat-lambatnya 1x24 jam sebelum mengajukan kembali."

    case productNotFound = "Produk sedang tidak tersedia"

    case errorTryAgain = "Maaf, terjadi kesalahan silakan coba lagi"
    case notFoundAccountNumber = "Nomor rekening tidak dikenali. Mohon cek kembali nomor rekening tujuan"
    case transactionTryAgain = "Maaf, transaksi anda tidak dapat dilakukan silakan coba lagi"
    case bankNotFound = "Maaf, bank yang tujuan Anda tidak terdaftar"

    //MARK: NEED TO DISCUSS TAF -Sandy
    case virtualAccountNotFound = "Nomor Virtual Account tidak terdaftar. \nCoba periksa kembali nomor virtual account"
    case tidakTersediaTAF = "Tagihan tidak ditemukan. Untuk pertanyaan silakan hubungi customer service kami (1500793)"
    case tagihanLunasTAF = "Tagihan sudah lunas"
    case expiredTAF = "Tagihan sudah kadaluarsa"
    case jatuhTempoTAF = "Tagihan melewati jatuh tempo. Hubungi kantor layanan terdekat."


    case serverNotRespond = "Koneksi dengan server bermasalah \n Silahkan coba beberapa saat lagi"

    case qrNotFound = "QR tidak dikenali"

    case jailBreakTittle = "Error"
    case jailBreakMessage = "Aplikasi AstraPay tidak dapat dijalankan pada device yang telah di root"

    case changePinSuccess = "Ganti PIN Kamu berhasil. \n Gunakan PIN baru Kamu untuk bertransaksi."
    case changeInfoTemporaryPin = "PIN sementara telah dikirim ke email kamu.\nPakai PIN sementara kamu untuk login ya."

    case successKlaimVoucher = "Kode voucher berhasil di-klaim."
    case failureKlaimVoucher = "Kode voucher tidak dikenali."
    case successCopyCodeVoucher = "Kode voucher tersalin"

    case cashoutServerError = "Server Bermasalah"
}

protocol QRAlertProtocol: class{
    func pressAlertOkButton()
    func pressAlertCancelButton()
}

class QRAlert {

    internal static var alert:UIAlertController!

    internal static func showAlertServer(title: QRAlertInfo, msg: [QRErrorResponse]){
        var msgs: String = ""

        let last = msg.last
        for o in msg {
            if o.code == last?.code {
                msgs.append("\(o.text!).")
            }else{
                msgs.append("\(o.text!), ")
            }
        }

        alert = UIAlertController(title: title.rawValue, message: msgs, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return

    }

    internal static func showCustom(title: QRAlertInfo, msg: String){

        alert = UIAlertController(title: title.rawValue, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return

    }

    internal static func show(title: QRAlertInfo, msg: QRAlertInfo){

        alert = UIAlertController(title: title.rawValue, message: msg.rawValue, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        //        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
        //            controller.present(Alert.alert, animated: true, completion: nil)
        //        }
        //        else{
        //            UIApplication.shared.delegate?.window!!.rootViewController?.present(Alert.alert, animated: true, completion: nil)
        //        }

        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return

    }

    internal static func showWithCallback(title: QRAlertInfo, msg: QRAlertInfo, complete: @escaping(() -> Void) ){

        alert = UIAlertController(title: title.rawValue, message: msg.rawValue, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alert in
            complete()
        }))

        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true)
        return
    }

    internal static func showDynamic(title: QRAlertInfo, message: QRAlertInfo, options: String..., completion: @escaping (Int) -> Void) {
        alert = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alert.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        //        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
        //            controller.present(Alert.alert, animated: true, completion: nil)
        //        }
        //        else{
        //            UIApplication.shared.delegate?.window!!.rootViewController?.present(Alert.alert, animated: true, completion: nil)
        //        }
        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return
    }

    internal static func showDefault(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alert.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return
    }

    internal static func showWithCallback(title: QRAlertInfo, msg: QRAlertInfo,_ result: @escaping (Bool) -> Void){

        alert = UIAlertController(title: title.rawValue, message: msg.rawValue, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (res: UIAlertAction) in
            result(true)
        }))

        //        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
        //            controller.present(Alert.alert, animated: true, completion: nil)
        //        }
        //        else{
        //            UIApplication.shared.delegate?.window!!.rootViewController?.present(Alert.alert, animated: true, completion: nil)
        //        }
        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return

    }

    internal static func close(){

        UIApplication.QRtopViewController()?.dismiss(animated: true, completion: nil)

        //        Alert.alert.dismiss(animated: true, completion: nil)
        //        return

    }

    internal static func closeThen(_ result: @escaping (Bool) -> Void){

        UIApplication.QRtopViewController()?.dismiss(animated: true, completion: { ()
            result(true)
        })

        //        Alert.alert.dismiss(animated: true, completion: { () in
        //            result(true)
        //        })
    }

    internal static func showTwoButton(title: QRAlertInfo, msg: QRAlertInfo, delegate:QRAlertProtocol){
        alert = UIAlertController(title: title.rawValue, message: msg.rawValue, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ya", style: .default, handler: { (res: UIAlertAction) in
            delegate.pressAlertOkButton()
        }))
        alert.addAction(UIAlertAction(title: "Tidak", style: .default, handler: { (res: UIAlertAction) in
            delegate.pressAlertCancelButton()
        }))

        //        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
        //            controller.present(Alert.alert, animated: true, completion: nil)
        //        }
        //        else{
        //            UIApplication.shared.delegate?.window!!.rootViewController?.present(Alert.alert, animated: true, completion: nil)
        //        }

        UIApplication.QRtopViewController()?.present(QRAlert.alert, animated: true, completion: nil)

        return

    }

    internal static func showToast(controller: UIViewController, message : QRAlertInfo, seconds: Double, isImage: Bool = false) {
        let alert = UIAlertController(title: nil, message: message.rawValue, preferredStyle: .alert)
        if isImage {
            let imgViewTitle = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
            imgViewTitle.image = UIImage(named:"ic_copy_black")
            alert.view.addSubview(imgViewTitle)
        }
        alert.view.backgroundColor = .clear
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }


}
