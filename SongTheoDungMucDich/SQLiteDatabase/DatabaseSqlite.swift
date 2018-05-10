//
//  DatabaseSqlite.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/18/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//



import Foundation
import SQLite

class DatabaseSQLite{
    var dbName:String?
    var dbFormat:String?
    var destPathConnectSql:String?
    var dbConnection:Connection?
    
    init(dbname:String!, dbformat:String!) {
        self.dbName = dbname;
        self.dbFormat = dbformat;
    }
    
    private func CopyFileFromBundleToDirectory(){
        let bundlePath = Bundle.main.path(forResource: self.dbName, ofType: self.dbFormat);
//        print("bundlePath: \(bundlePath!)");
        
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!;
        
        let fileManager = FileManager.default
        let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(self.dbName!).\(self.dbFormat!)");
        let fullDestPathString = fullDestPath?.path
        
        self.destPathConnectSql = fullDestPathString;
        //Copy file qua
        do
        {
            //Copy file database
            if (fileManager.fileExists(atPath: fullDestPathString!)){
                //let originalURL = URL(fileURLWithPath: fullDestPathString!);
                //let urlItem = URL(fileURLWithPath: bundlePath!);
                //try fileManager.replaceItemAt(originalURL, withItemAt: urlItem);
                
                try fileManager.removeItem(atPath: fullDestPathString!);
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString!)
                print("DB replaced")
            }else{
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString!)
                print("DB Copied")
            }
            
            //            //Copy toàn bộ file từ bundle sang document directory(copy các file font chữ sang mới dùng được)
            //            if let filelist = try? FileManager.default.contentsOfDirectory(atPath: Bundle.main.bundlePath ){
            //                for filename in filelist {
            //                    let bundleFilePath = Bundle.main.resourceURL!.appendingPathComponent(filename).path;
            //                    print("bundle: \(bundleFilePath)");
            //                    let fullPathURL = NSURL(fileURLWithPath: destPath).appendingPathComponent(filename);
            //                    let fullDestFilePath = fullPathURL?.path
            //
            //                    try? fileManager.copyItem(atPath: bundleFilePath, toPath: fullDestFilePath!);
            //                }
            //            }
        }
        catch
        {
            print("\n")
            print(error)
        }
    }
    
    func GetConnection(){
        self.CopyFileFromBundleToDirectory();
        
        //Connect to DB SQLite
        do{
            let db = try Connection(self.destPathConnectSql!);
            self.dbConnection = db;
        }catch{
            print(error);
        }
    }
    
    func SelectData(querySelect: String, CompleteHandler: (_ connection:Connection,_ query:String)->Void){
        
        CompleteHandler(self.dbConnection!, querySelect);
    }
    
//    func SelectData()->[FaithStory]{
//        var arrStory = [FaithStory]();
//        let table = Table("Story");
//        let id = Expression<Int>("ID");
//        let storyname = Expression<String>("StoryName");
//        let storycontent = Expression<String>("StoryContent");
//        //Select* from Story
//        if let db = dbConnection{
//            do{
//                for row in try db.prepare(table) {
//                    //print(row[storyname]);
//                    arrStory.append(FaithStory(id: row[id], name: row[storyname], content: row[storycontent]));
//                }
//            }catch{
//                print("Query Error");
//            }
//            
//        }
//        return arrStory;
//    }
}

