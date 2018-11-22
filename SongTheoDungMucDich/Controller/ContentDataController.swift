//
//  ContentDataController.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/21/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

class ContentDataController: UIViewController {
    var currContent: ContentModel!;
    
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    
    @IBOutlet weak var txtContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad");
        
        txtContent.text = currContent.NDContent;
        txtContent.scrollsToTop = true;
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated);
//        print("viewWillAppear");
//        txtContent.contentOffset = CGPoint.zero;
//    }
    
    override func viewDidLayoutSubviews() {
        self.txtContent.setContentOffset(.zero, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    //Quay trở lại
    @IBAction func PressBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
    
    //Button Suy gẫm
    @IBAction func PressThinkAbout(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueShowThinkAbout", sender: self.currContent);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? ThinkAboutController{
            if let content = sender as? ContentModel{
                des.currContent = content;
            }
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
