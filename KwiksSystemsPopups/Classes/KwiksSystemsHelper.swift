//
//  KwiksSystemsHelper.swift
//  KwiksSystemsPopups
//
//  Created by Charlie Arcodia on 3/26/23.
//


import Foundation

//bundled fonts
struct FontKit {
    
    static let shared = FontKit()
    
    let segoeRegular = "SegoeUI",
        segoeRegularItalic = "SegoeUI-Italic",
        segoeBold = "SegoeUI-Bold",
        segoeBoldItalic = "SegoeUI-BoldItalic"
}

//color extension
extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

//colorkit for color reference
struct ColorKit {
    static let shared = ColorKit()
    
    let kwiksGreen = UIColor(hex: 0x9AE769)
    let kwiksSmokeColor = UIColor(hex: 0x212121)
}

//imagekit for icon reference
struct ImageKit {
    
    static let shared = ImageKit()
    
    let kwiksLogo = "k_logo"
    let cardNotSupported = "card_not_supported"
    let downloadCloudIcon = "download_cloud_icon"
    let emailIcon = "email_icon"
    let emailNotVerified = "email_not_verified"
    let emailVerified = "email_verified_icon"
    let fileIcon = "file_icon"
    let hardFailIcon = "hard_fail_icon"
    let incorrectPasswordIcon = "incorrect_password_icon"
    let moneyWalletIcon = "money_wallet_icon"
    let phoneVerified = "phone_verified"
    let uploadCloudIcon = "upload_cloud_icon"
    let warningHollowIcon = "warning_hollow_icon"
    let soundBrokenIcon = "sound_broken_icon"
    let phoneNotVerified = "phone_not_verified"
}

//OPENS URLS AS STRINGS
extension UIView {
    
    func openUrl(passedUrlString : String) {
        guard let developerWebsiteUrl = URL(string: passedUrlString) else { return }
        
        if UIApplication.shared.canOpenURL(developerWebsiteUrl) {
            return UIApplication.shared.open(developerWebsiteUrl, options: [:],     completionHandler: nil)
        }
    }
}

