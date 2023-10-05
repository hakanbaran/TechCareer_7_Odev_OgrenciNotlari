//
//  StudentsRepository.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import Foundation
import RxSwift

class StudentsRepository {
    
    var studentsArray = BehaviorSubject<[Students]>(value: [Students]())
    
    let db:FMDatabase?
    
    init() {
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("TechCareer_7_Odev.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
        
    }
    
    
    func saveStudent(student_name: String, student_score: String) {
        print("Save : \(student_name) -- \(student_score)")
    }
    
    func updateStudent(student_id: Int,student_name: String, student_score: String) {
        print("Update : \(student_id) --\(student_name) -- \(student_score)")
    }
    
    func searchStudent(search_name: String) {
        
        print("Search : \(search_name)")
        
    }
    
    func deleteStudent(student_id: Int) {
        print("Delete : \(student_id)")
    }
    
    
    func loadStudents() {
        
        
//        let s1 = Students(student_id: 1, student_name: "Hakan", student_score: "11")
//        let s2 = Students(student_id: 2, student_name: "Aysu", student_score: "22")
//        let s3 = Students(student_id: 3, student_name: "Kasım", student_score: "33")
//        
//        array.append(s1)
//        array.append(s2)
//        array.append(s3)
        
        
        
        db?.open()
        
        var array = [Students]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM students", values: nil)
            
            while rs.next() {
                let student_id = Int(rs.string(forColumn: "student_id"))!
                let student_name = rs.string(forColumn: "student_name")!
                let student_score = rs.string(forColumn: "student_score")!
                
                let student = Students(student_id: student_id, student_name: student_name, student_score: student_score)
                
                array.append(student)
            }
            
            studentsArray.onNext(array)
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
    }
    
    func veritabaniKopyala(){
            let bundleYolu = Bundle.main.path(forResource: "TechCareer_7_Odev", ofType: ".sqlite")
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("TechCareer_7_Odev.sqlite")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
        }
    
    
    
    
    
}
