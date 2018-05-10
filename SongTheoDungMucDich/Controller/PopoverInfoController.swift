//
//  PopoverInfoController.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/18/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

class PopoverInfoController: UIViewController {

    @IBOutlet weak var txtInfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true;
    }

    @IBAction func PressCancelPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        txtInfo.setContentOffset(.zero, animated: false);
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
