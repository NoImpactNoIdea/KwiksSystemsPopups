//
//  KwiksSystemsPopups.swift
//  KwiksSystemsPopups
//
//  Created by Charlie Arcodia on 3/26/23.
//

import Foundation
import UIKit

public class KwiksSystemPopups : NSObject {
    
    public enum PopupType{
        case UpdateKwiks
        case AgeRestriction
        case SendingFailed
        case PermissionNeeded
        case UploadFailed
        case DownloadFailed
        case VerificationFailed
        case VideoResolutionLow
        case FileNotSupported
        case VideoNotSupported
        case UnknownError
        case MaximumPostsReached
        case AccountRestricted
        case MaxTagReached
        case LargeImage
        case UserAccountNotFound
        case LoginFailed
        case AccessDenied
        case SoundNotWorking
        case EmailNotVerified
        case EmailVerified
        case VerifyPhoneNumber
        case PhoneNumberVerified
        case IncorrectPassword
        case IncorrectUsername
        case FailedTransaction
        case CardNotSupported
        case InsufficientBalanceHard
        case InsufficientBalanceLight
        case PaymentDeclined
        case LoginToAccess
    }
    
    public var rootController: UIViewController?
    public var popupType: PopupType?
    public var popupFinalHeight = 0.0
    
    var screenHeight : CGFloat = 0.0,
        screenWidth : CGFloat = 0.0
    
      lazy var smokeScreen : UIView = {
        
        let ss = UIView()
        ss.translatesAutoresizingMaskIntoConstraints = true
        ss.backgroundColor = ColorKit().kwiksSmokeColor.withAlphaComponent(0.6)
        ss.alpha = 0.0
        ss.isUserInteractionEnabled = true

       return ss
    }()
    
    let headerIcon : UIImageView = {
        
        let dcl = UIImageView()
        dcl.translatesAutoresizingMaskIntoConstraints = false
        dcl.backgroundColor = .clear
        dcl.contentMode = .scaleAspectFill
        dcl.isUserInteractionEnabled = false
        dcl.clipsToBounds = true
        
        return dcl
    }()
    
    var headerLabel : UILabel = {
        
        let hfl = UILabel()
        hfl.translatesAutoresizingMaskIntoConstraints = false
        hfl.backgroundColor = .clear
        hfl.textColor = UIColor .black
        hfl.textAlignment = .center
        hfl.adjustsFontSizeToFitWidth = true
        
        return hfl
    }()
    
    var subHeaderLabel : UILabel = {
        
        let hfl = UILabel()
        hfl.translatesAutoresizingMaskIntoConstraints = false
        hfl.backgroundColor = .clear
        hfl.textColor = UIColor .black
        hfl.textAlignment = .center
        hfl.numberOfLines = -1
        
        return hfl
    }()
    
    lazy var confirmationButton : UIButton = {

        let cbf = UIButton(type: .system)
        cbf.translatesAutoresizingMaskIntoConstraints = false
        cbf.titleLabel?.adjustsFontSizeToFitWidth = true
        cbf.titleLabel?.numberOfLines = 1
        cbf.titleLabel?.adjustsFontForContentSizeCategory = true
        cbf.backgroundColor = ColorKit().kwiksGreen
        cbf.tintColor = UIColor .black
        cbf.layer.cornerRadius = 9
        cbf.alpha = 0.0
        cbf.isEnabled = true
        cbf.isUserInteractionEnabled = true
        cbf.layer.zPosition = 100

        return cbf
        
    }()
    
    public var dynamicPopUpContainer : UIButton = {
        let dpp = UIButton(type: .system)
          dpp.translatesAutoresizingMaskIntoConstraints = true
          dpp.backgroundColor = UIColor .white
          dpp.isUserInteractionEnabled = true
          dpp.layer.cornerRadius = 25
          dpp.layer.masksToBounds = true
         return dpp
      }()
    
    public init(presentingViewController: UIViewController? = nil, popupType : PopupType? = nil) {
        super.init()
        
        if presentingViewController != nil && popupType != nil {
            self.rootController = presentingViewController
            self.popupType = popupType
            
            self.loadFonts { complete in
                self.copyDecision(popupType: popupType!)
            }
        }
    }
    
    public func copyDecision(popupType : PopupType) {
        
        switch popupType {
       
        case .UpdateKwiks:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().kwiksLogo)
            self.headerLabel.text = "Update Kwiks"
            self.subHeaderLabel.text = "Kwiks app version is too low. To continue, update to the latest version of the app."
            self.confirmationButton.setTitle("Update Now", for: .normal)
        
        case .AgeRestriction:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().kwiksLogo)
            self.headerLabel.text = "Feature is not available"
            self.subHeaderLabel.text = "This feature is not available for your account due to the age restriction."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .SendingFailed:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().emailIcon)
            self.headerLabel.text = "Sending Failed!"
            self.subHeaderLabel.text = "Sending Failed. Please try again."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .PermissionNeeded:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Permission Needed!"
            self.subHeaderLabel.text = "Kwiks need to permission to access files and photos."
            self.confirmationButton.setTitle("Go to settings", for: .normal)
            
        case .UploadFailed:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().uploadCloudIcon)
            self.headerLabel.text = "Upload Failed!"
            self.subHeaderLabel.text = "Upload failed due to poor network connectivity."
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .DownloadFailed:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().downloadCloudIcon)
            self.headerLabel.text = "Download Failed!"
            self.subHeaderLabel.text = "Download failed due to poor network connections"
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .VerificationFailed:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Verification Failed!"
            self.subHeaderLabel.text = "Photo & ID doesn’t meet the requirements."
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .VideoResolutionLow:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().uploadCloudIcon)

            self.headerLabel.text = "Upload Failed!"
            self.subHeaderLabel.text = "Video resolution is too low."
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .FileNotSupported:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().fileIcon)

            self.headerLabel.text = "File not supported!"
            self.subHeaderLabel.text = "File must be in jpg, png, mp3, mp4, mpeg4 format."
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .VideoNotSupported:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().fileIcon)
            self.headerLabel.text = "Video not supported!"
            self.subHeaderLabel.text = "Video format is not supported. Supported format- mp4, mpeg4 "
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .UnknownError:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Unknown Error"
            self.subHeaderLabel.text = "An unknown error occured during upload."
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .MaximumPostsReached:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Maximum Post reached!"
            self.subHeaderLabel.text = "You have reached maximum of posts that is allowed a day. Please try again tomorrow"
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .AccountRestricted:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Account Restricted!"
            self.subHeaderLabel.text = "Your Kwiks Account is restricted. Contact support to reactive your account."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .MaxTagReached:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Maximum Tag Reached!"
            self.subHeaderLabel.text = "You can tag maximum 20 kwiks user in your video."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .LargeImage:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Image is too large."
            self.subHeaderLabel.text = "Image exceeded maximum file size 8MB. Please try again with a smaller image."
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .UserAccountNotFound:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "This user account is not found"
            self.subHeaderLabel.text = "Account of this user may deleted/ suspended/ restricted by the kwiks."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .LoginFailed:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Login Failed!"
            self.subHeaderLabel.text = "Your user id/password are not matched. Please try again with correct credential."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .AccessDenied:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Access Denied!"
            self.subHeaderLabel.text = "This profile is in private mode. You cann’t access this profile."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .SoundNotWorking:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().soundBrokenIcon)
            self.headerLabel.text = "Sound not working!"
            self.subHeaderLabel.text = "Please try with uploading / choosing another sound from list"
            self.confirmationButton.setTitle("Retry", for: .normal)
            
        case .EmailNotVerified:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().emailNotVerified)
            self.headerLabel.text = "Email is not verified!"
            self.subHeaderLabel.text = "Please verify your email to keep your account safe."
            self.confirmationButton.setTitle("Verify Now", for: .normal)
            
        case .EmailVerified:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().emailVerified)
            self.headerLabel.text = "Email verified!"
            self.subHeaderLabel.text = "Your email account is verified successfully."
            self.confirmationButton.setTitle("Okay", for: .normal)
            
        case .VerifyPhoneNumber:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().phoneNotVerified)
            self.headerLabel.text = "Verify Phone Number!"
            self.subHeaderLabel.text = "Please verify your email to keep your account safe."
            self.confirmationButton.setTitle("Verify Now", for: .normal)
            
        case .PhoneNumberVerified:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().phoneVerified)
            self.headerLabel.text = "Phone number verified!"
            self.subHeaderLabel.text = "Your phone number  is verified successfully."
            self.confirmationButton.setTitle("Okay", for: .normal)
            
        case .IncorrectPassword:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().incorrectPasswordIcon)
            self.headerLabel.text = "Incorrect Password!"
            self.subHeaderLabel.text = "The password is not correct. Please try again."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .IncorrectUsername:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().incorrectPasswordIcon)
            self.headerLabel.text = "Incorrect Username"
            self.subHeaderLabel.text = "The username is not correct. Please try again."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .FailedTransaction:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().hardFailIcon)
            self.headerLabel.text = "Your transaction has failed."
            self.subHeaderLabel.text = "Your payment request was declined by your bank. Please try again or use a different payment method to complete the payment."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .CardNotSupported:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().cardNotSupported)
            self.headerLabel.text = "Card Not Supported!"
            self.subHeaderLabel.text = "This card is not supported. Please try using MasterCard, Visa, Amex, Mestro."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .InsufficientBalanceHard:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().hardFailIcon)
            self.headerLabel.text = "Insufficient Balance!"
            self.subHeaderLabel.text = "You don’t have enough balance to boost your video. Add balance to your wallet and then try again."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .InsufficientBalanceLight:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().moneyWalletIcon)
            self.headerLabel.text = "Insufficient Balance!"
            self.subHeaderLabel.text = "You don’t have enough balance to boost your video. Add balance to your wallet and then try again."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .PaymentDeclined:
            
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().moneyWalletIcon)
            self.headerLabel.text = "Payment Declined!"
            self.subHeaderLabel.text = "Your transaction has declined by your card issuer bank. Please contact with your bank or try using another card."
            self.confirmationButton.setTitle("Continue", for: .normal)
            
        case .LoginToAccess:
            self.headerIcon.image = UIImage.init(fromPodAssetName: ImageKit().warningHollowIcon)
            self.headerLabel.text = "Login to access!"
            self.subHeaderLabel.text = "You must need to login to access all features"
            self.confirmationButton.setTitle("Login Now", for: .normal)
        }
    }
    
    public func engagePopup() {
        
        self.headerLabel.font = UIFont(name: FontKit().segoeBold, size: 20)
        self.subHeaderLabel.font = UIFont(name: FontKit().segoeRegular, size: 16)
        self.confirmationButton.titleLabel?.font = UIFont(name: FontKit().segoeRegular, size: 18)

        let height = self.rootController?.view.frame.height,
            width = self.rootController?.view.frame.width
        
        //nil check prior
        if height != nil && width != nil {
            self.screenWidth = width!
            self.screenHeight = height!
            self.rootController?.view.addSubview(self.smokeScreen)
            self.smokeScreen.frame = CGRect(x: 0, y: 0, width: width!, height: height!)
            self.smokeScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismiss)))
            self.presentPopup()

        } else {
            print("🔴 COCOAPOD ERROR: NIL - LET KWIKS DEV LIBRARY MAGICIAN KNOW - SERIAL (64574)")
        }
    }
    
    public func presentPopup() {
        
        //always suceeds
        if let root = self.rootController {
            
            //no children, nils the selector
            root.view.addSubview(self.dynamicPopUpContainer)
            dynamicPopUpContainer.addSubview(self.headerIcon)
            dynamicPopUpContainer.addSubview(self.headerLabel)
            dynamicPopUpContainer.addSubview(self.subHeaderLabel)
            root.view.addSubview(self.confirmationButton)

            self.headerIcon.topAnchor.constraint(equalTo: self.dynamicPopUpContainer.topAnchor, constant: 52).isActive = true
            self.headerIcon.centerXAnchor.constraint(equalTo: self.dynamicPopUpContainer.centerXAnchor, constant: 0).isActive = true
            self.headerIcon.heightAnchor.constraint(equalToConstant: 90).isActive = true
            self.headerIcon.widthAnchor.constraint(equalToConstant: 90).isActive = true
            
            self.headerLabel.topAnchor.constraint(equalTo: self.headerIcon.bottomAnchor, constant: 20).isActive = true
            self.headerLabel.leftAnchor.constraint(equalTo: self.dynamicPopUpContainer.leftAnchor, constant: 24).isActive = true
            self.headerLabel.rightAnchor.constraint(equalTo: self.dynamicPopUpContainer.rightAnchor, constant: -24).isActive = true
            self.headerLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
           
            self.confirmationButton.bottomAnchor.constraint(equalTo: self.dynamicPopUpContainer.bottomAnchor, constant: -24).isActive = true
            self.confirmationButton.leftAnchor.constraint(equalTo: self.dynamicPopUpContainer.leftAnchor, constant: 27).isActive = true
            self.confirmationButton.rightAnchor.constraint(equalTo: self.dynamicPopUpContainer.rightAnchor, constant: -27).isActive = true
            self.confirmationButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            self.subHeaderLabel.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 16).isActive = true
            self.subHeaderLabel.leftAnchor.constraint(equalTo: self.dynamicPopUpContainer.leftAnchor, constant: 24).isActive = true
            self.subHeaderLabel.rightAnchor.constraint(equalTo: self.dynamicPopUpContainer.rightAnchor, constant: -24).isActive = true
            self.subHeaderLabel.bottomAnchor.constraint(equalTo: self.confirmationButton.topAnchor, constant: -16).isActive = true
         
            self.runLogic(root: root)
  
        }
    }
    
    public func runLogic(root : UIViewController) {

        let baselineHeight = 325.0
    
        let textToSize = self.subHeaderLabel.text ?? "",
            size = CGSize(width: self.screenWidth - 80.0 - 48, height: 2000),
            options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let estimatedFrame = NSString(string: textToSize).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont(name: FontKit().segoeRegular, size: 16)!], context: nil)
        let estimatedHeight = estimatedFrame.height

        self.popupFinalHeight = baselineHeight + estimatedHeight

        self.dynamicPopUpContainer.frame = CGRect(x: 0, y: screenHeight, width: screenWidth - 80, height: popupFinalHeight)
        self.dynamicPopUpContainer.center.x = root.view.center.x
        
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseInOut) {
            self.smokeScreen.alpha = 1.0
            self.dynamicPopUpContainer.frame = CGRect(x: 0, y: self.screenHeight - (self.screenHeight / 2.0) - (self.popupFinalHeight / 2), width: self.screenWidth - 80.0, height: self.popupFinalHeight)
            self.dynamicPopUpContainer.center.x = root.view.center.x
        } completion: { complete in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                self.confirmationButton.alpha = 1.0
            } completion: { complete in
                self.confirmationButton.addTarget(self, action: #selector(self.handleAction(sender:)), for: .touchUpInside)
            }
        }
    }
    
    @objc public func handleAction(sender:UIButton) {

        switch popupType {
            
        case .UpdateKwiks://product page
            self.dynamicPopUpContainer.openUrl(passedUrlString: "https://www.google.com")
            self.perform(#selector(self.dismiss), with: nil, afterDelay: 0.75)
            
        case .AgeRestriction://close
            self.dismiss()
            
        case .SendingFailed://close
            self.dismiss()
            
        case .UploadFailed://close
            self.dismiss()
            
        case .DownloadFailed://close
            self.dismiss()
            
        case .VerificationFailed://close
            self.dismiss()
            
        case .VideoResolutionLow://close
            self.dismiss()
            
        case .FileNotSupported://close
            self.dismiss()
            
        case .VideoNotSupported://close
            self.dismiss()
            
        case .UnknownError://close
            self.dismiss()
            
        case .MaximumPostsReached://close
            self.dismiss()
            
        case .AccountRestricted://close
            self.dismiss()
            
        case .MaxTagReached://close
            self.dismiss()
            
        case .LargeImage://close
            self.dismiss()
            
        case .UserAccountNotFound://close
            self.dismiss()
            
        case .LoginFailed://close
            self.dismiss()
            
        case .AccessDenied://close
            self.dismiss()
            
        case .SoundNotWorking://close
            self.dismiss()
            
        case .EmailNotVerified://close
            self.dismiss()
            
        case .EmailVerified://close
            self.dismiss()
            
        case .VerifyPhoneNumber://close
            self.dismiss()
            
        case .PhoneNumberVerified://close
            self.dismiss()
            
        case .IncorrectPassword://close
            self.dismiss()
            
        case .IncorrectUsername://close
            self.dismiss()
            
        case .FailedTransaction://close
            self.dismiss()
            
        case .CardNotSupported://close
            self.dismiss()
            
        case .InsufficientBalanceHard://close
            self.dismiss()
            
        case .InsufficientBalanceLight://close
            self.dismiss()
            
        case .PaymentDeclined://close
            self.dismiss()
            
        case .LoginToAccess://close
            self.dismiss()
            
        case .PermissionNeeded:
            self.perform(#selector(self.dismiss), with: nil, afterDelay: 0.75)

        default: debugPrint("defaults for popup selector")
        }
    }
    
    @objc public func dismiss() {
        
        if let root = self.rootController {

            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                self.smokeScreen.alpha = 0.0
                self.confirmationButton.alpha = 0.0
                self.dynamicPopUpContainer.frame = CGRect(x: 0, y: self.screenHeight, width: self.screenWidth - 80, height: self.popupFinalHeight)
                self.dynamicPopUpContainer.center.x = root.view.center.x
            }
        }
    }
    
    public func loadFonts(completion : @escaping(_ complete : Bool) -> () ) {
        if let _ = UIFont(name: FontKit().segoeRegular, size: 16) {
            completion(true)
        } else {
            registerFont(with: "SegoeBoldItalic.ttf")
            registerFont(with: "SegoeBold.ttf")
            registerFont(with: "SegoeItalic.ttf")
            registerFont(with: "SegoeRegular.ttf")
            completion(true)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
