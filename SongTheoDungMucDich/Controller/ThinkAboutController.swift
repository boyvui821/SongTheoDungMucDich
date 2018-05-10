//
//  ThinkAboutController.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/24/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ThinkAboutController: UIViewController, GADBannerViewDelegate {
    
    var currContent: ContentModel!;
    
    @IBOutlet weak var lblVanDe: UILabel!
    @IBOutlet weak var lblCauGoc: UILabel!
    @IBOutlet weak var lblCauHoi: UILabel!
    
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblVanDe.text = currContent.NDDiemDeNho;
        lblCauGoc.text = currContent.NDCauGoc;
        lblCauHoi.text = currContent.NDSuyGam;
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)

        //Ads ADMOB
        //TEST
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        //Khi build
        bannerView.adUnitID = "ca-app-pub-3167518105754283/8412592394"
        
        bannerView.rootViewController = self
        
        let request = GADRequest()
        //Chỉ dùng dòng này khi test device, khi add app thì xoá
        request.testDevices = [ "43744b22b205846017e49d0314e591e4", kGADSimulatorID];
        bannerView.load(request);
        bannerView.delegate = self;
        
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        // Add banner to view and add constraints as above.
        addBannerViewToView(self.bannerView);
    }
    
    @IBAction func PressCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
