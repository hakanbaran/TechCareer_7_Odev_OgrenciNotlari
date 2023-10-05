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
        
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databeseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("TechCareer_7_Odev.sqlite")
        
        db = FMDatabase(path: databeseURL.path)
        
    }
    
    
    func saveStudent(student_name: String, student_score: String) {
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("INSERT INTO students (student_name,student_score) VALUES (?,?)", values: [student_name,student_score])
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func updateStudent(student_id: Int,student_name: String, student_score: String) {
        
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("UPDATE students SET student_name=?, student_score=? WHERE student_id=?", values: [student_name,student_score,student_id])
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func searchStudent(search_name: String) {
        
        db?.open()
        var array = [Students]()
        do {
            let rs = try db!.executeQuery("SELECT * FROM students WHERE student_name like '%\(search_name)%'", values: nil)
            
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
    
    func deleteStudent(student_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM students WHERE student_id=?", values: [student_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func loadStudents() {
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
