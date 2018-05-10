//
//  MenuController.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/18/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit
import Social
import FBSDKCoreKit
import FBSDKShareKit
class MenuController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionMenu: UICollectionView!
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    
    var lstStatusModel = [StatusModel]();
    
    var query = "select MDCode, MDName from Table_MucDich";
    
    var urlMyApp = "https://itunes.apple.com/vn/app/s%E1%BB%91ng-theo-%C4%91%C3%BAng-m%E1%BB%A5c-%C4%91%C3%ADch/id1376114910?l=vi&ls=1&mt=8";

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionMenu.delegate = self;
        self.collectionMenu.dataSource = self;
        // Do any additional setup after loading the view.
        
        let dbSqlite = DatabaseSQLite(dbname: "SongTheoDungMucDich", dbformat: "sqlite3");
        dbSqlite.GetConnection();
        dbSqlite.SelectData(querySelect: self.query) { (connection, queryString) in
            do{
                for item in try connection.prepare(self.query){
                    let mdcode = item[0] as! String;
                    let mdname = item[1] as! String;
                    self.lstStatusModel.append(StatusModel(mdcode: mdcode, mdname: mdname));
                }
            }catch{
                print("Lỗi lấy dữ liệu Mục Đích.");
            }
        }
    }
    @IBAction func PressBackToHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func PressShareFacebook(_ sender: UIButton) {
        let myContent = FBSDKShareLinkContent();
        myContent.contentURL = URL(string: self.urlMyApp);
        let shareDialog = FBSDKShareDialog();
        shareDialog.fromViewController = self;
        shareDialog.mode = .native;
        shareDialog.shareContent = myContent;
        shareDialog.show();
    }
    
    func showAlertError(){
        let alert = UIAlertController(title: "Error", message: "Please login to Facebook", preferredStyle: .alert);
        let action = UIAlertAction(title: "Dimiss", style: .cancel, handler: nil);
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
    }
    
    //MARK: -CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lstStatusModel.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseCell", for: indexPath) as! MenuCollectionViewCell;
        cell.imgCell.image = UIImage(named: "FlowerIcon\(indexPath.row + 1)");
        cell.lblStatusName.text = self.lstStatusModel[indexPath.row].MDName;
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = self.view.bounds.size;
        let width = (size.width-10)/2;
        let height = (size.height - 100)/2;
        let cellSize = CGSize(width: width, height: height);
        return cellSize;
        //return CGSize(width: 100, height: 100);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueShowDay", sender: self.lstStatusModel[indexPath.row]);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let des = segue.destination as? DanhSachNgayController{
            if let status = sender as? StatusModel{
                des.currStatus = status;
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
