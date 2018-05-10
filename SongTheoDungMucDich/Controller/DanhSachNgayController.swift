//
//  DanhSachNgayController.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/20/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DanhSachNgayController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADInterstitialDelegate {
    
    
    var currStatus:StatusModel!
    var lstContent = [ContentModel]();
    var currIndex:Int!;
    //Admob
    var interstitial: GADInterstitial!
    
    @IBOutlet weak var tableContent: UITableView!
    //Ẩn statusbar
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableContent.delegate = self;
        self.tableContent.dataSource = self;
        
        let queryData = "select NDCode, NDName, NDContent, NDDiemDeNho, NDCauGoc, NDSuyGam from Table_NoiDung where MDCode = '\(self.currStatus.MDCode!)'"
        
        let dbSqlite = DatabaseSQLite(dbname: "SongTheoDungMucDich", dbformat: "sqlite3");
        dbSqlite.GetConnection();
        dbSqlite.SelectData(querySelect: queryData) { (connection, query) in
            do{
                for item in try connection.prepare(query){
                    let ndcode = item[0] as! String;
                    let ndname = item[1] as! String;
                    let ndcontent = item[2] as! String;
                    let nddiemdenho = item[3] as! String;
                    let ndcaugoc = item[4] as! String;
                    let ndsuygam = item[5] as! String;
                    lstContent.append(ContentModel(ndcode: ndcode, ndname: ndname, ndcontent: ndcontent, nddiemdenho: nddiemdenho, ndcaugoc: ndcaugoc, ndsuygam: ndsuygam));
                }
            }catch{
                print("Lỗi load data Sql Table Nội dung");
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("viewWillAppear")
        
        //Khởi tạo admob
        interstitial = createAndLoadInterstitial()
    }
    
    @IBAction func PressBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
    
    //MARK: -Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstContent.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath) as! ContentTableViewCell;
        cell.ImgContent.image = UIImage(named: "Flower\(indexPath.row+1).png");
        cell.lblContentName.text = lstContent[indexPath.row].NDName;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if interstitial.isReady {
            self.interstitial.present(fromRootViewController: self)
            currIndex = indexPath.row;
        } else {
            print("Ad wasn't ready")
            self.performSegue(withIdentifier: "SegueShowContent", sender: lstContent[indexPath.row]);
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let des = segue.destination as? ContentDataController{
            if let content = sender as? ContentModel{
                des.currContent = content;
            }
        }
    }
    
    //MARK: - ADMOB
    func createAndLoadInterstitial() -> GADInterstitial {
        //Test ADMOB Interstitial
        //let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        
        //ADS ADMOB Intertitial
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3167518105754283/4066153273")
        interstitial.delegate = self
        
        let request = GADRequest()
        //Chỉ dùng dòng này khi test device, khi add app thì xoá
        request.testDevices = [ "43744b22b205846017e49d0314e591e4", kGADSimulatorID];
        interstitial.load(request)
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen");
        interstitial = createAndLoadInterstitial()
        
        //Nhảy tới trang nội dung
        performSegue(withIdentifier: "SegueShowContent", sender: lstContent[currIndex]);
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
