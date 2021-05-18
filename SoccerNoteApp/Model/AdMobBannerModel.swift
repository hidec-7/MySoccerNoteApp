//
//  AdMobModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/05/18.
//

import GoogleMobileAds

class AdMobBannerModel: NSObject {

    static let shared = AdMobBannerModel()

    func initSDK() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }

    func setupBannerAd(adBaseView: UIView, rootVC: UIViewController) {
        let adView = GADBannerView(adSize: kGADAdSizeBanner)
        #if DEBUG
        adView.adUnitID = "ca-app-pub-3723443781375723/9182822814"
        #else
        if rootVC is ViewController {
            adView.adUnitID = "ca-app-pub-3723443781375723/9182822814"
        } else if rootVC is ViewController2 {
            adView.adUnitID = "ca-app-pub-3723443781375723/9182822814"
        }
        #endif
        adView.rootViewController = rootVC
        adView.load(GADRequest())
        adBaseView.addSubview(adView)
        adView.translatesAutoresizingMaskIntoConstraints = false
        adView.centerXAnchor.constraint(equalTo: adBaseView.centerXAnchor).isActive = true
        adView.centerYAnchor.constraint(equalTo: adBaseView.centerYAnchor).isActive = true
        adView.widthAnchor.constraint(equalToConstant: 320.0).isActive = true
        adView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }

}
