//
//  HomeController.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/19/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit
import Social

class HomeController: UIViewController {
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var lblSong: UILabel!
    @IBOutlet weak var lblTheoDung: UILabel!
    @IBOutlet weak var lblMucDich: UILabel!
    
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //User Notification
        let delegate = UIApplication.shared.delegate as? AppDelegate;
        delegate?.ScheduleNotification();
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        let transformTop = CATransform3DTranslate(CATransform3DIdentity,0,-500, 0);
        let transformRight = CATransform3DTranslate(CATransform3DIdentity,500,0, 0);
        let transformLeft = CATransform3DTranslate(CATransform3DIdentity,-500,0, 0);
        self.imgPicture.layer.transform = transformTop;
        
        self.lblSong.layer.transform = transformRight;
        self.lblTheoDung.layer.transform = transformLeft;
        self.lblMucDich.layer.transform = transformLeft;
        
        UIView.animate(withDuration: 1.0) {
            self.imgPicture.layer.transform = CATransform3DIdentity;
            self.lblSong.layer.transform = CATransform3DIdentity;
            self.lblTheoDung.layer.transform = CATransform3DIdentity;
            self.lblMucDich.layer.transform = CATransform3DIdentity;
        }
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
