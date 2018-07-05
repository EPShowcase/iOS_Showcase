//
//  BioTableViewCell.swift
//  EP Showcase
//
//  Created by Ernest on 10/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import AlamofireImage
import MessageUI

class BioCell: UITableViewCell, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var avatarImg: UIImageView!
    
    @IBOutlet weak var fullNameLbl: UILabel!
    
    @IBOutlet weak var emailBtn: UIButton!
    
    @IBOutlet weak var avatarStroke: UIView!

    @IBOutlet weak var curriculumVitae: UILabel!
    
    weak var controller: UIViewController?
    
    var model: BioModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImg.layer.cornerRadius = avatarImg.frame.height / 2

        avatarStroke.layer.cornerRadius = avatarStroke.frame.height / 2
    }

    @IBAction func emailClicked(_ sender: UIButton) {
        if !MFMessageComposeViewController.canSendText() {
            print("Cannot send email")
            return
        }
        let emailTitle = "Feedback"
        let messageBody = "Feature request or bug report?"
        let toRecipents = ["friend@stackoverflow.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        controller?.present(mc, animated: true, completion: nil)
    }
    
    @IBAction func linkedInClicked(_ sender: UIButton) {
        guard let url = URL(string: model!.linkedInUrl) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            print("Mail cancelled")
        case MFMailComposeResult.saved:
            print("Mail saved")
        case MFMailComposeResult.sent:
            print("Mail sent")
        case MFMailComposeResult.failed:
            let error: String = error!.localizedDescription
            print("Mail sent failure: \(error)")
        default:
            break
        }
        
        self.controller?.dismiss(animated: true, completion: nil)
    }
    
    func bindCell(model: BioModel) -> Void {
        
        self.model = model
        
        fullNameLbl.text = "\(model.firstName) \(model.lastName)"
        
        emailBtn.setTitle(model.email, for: .normal)
        
        if !model.avatarUrl.isEmpty {
            let url = URL(string: model.avatarUrl)!
            avatarImg.af_setImage(withURL: url)
        }
        
        let data = model.curriculumVitae.data(using: String.Encoding.unicode)!
        let attrStr = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        attrStr!.setFontFace(font: UIFont.systemFont(ofSize: 16))
        curriculumVitae.attributedText = attrStr
    }
}
