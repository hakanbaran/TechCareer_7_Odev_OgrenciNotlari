//
//  HomeVCViewModel.swift
//  TechCareer_7_Odev_OgrenciNotlari
//
//  Created by Hakan Baran on 5.10.2023.
//

import Foundation
import RxSwift


class HomeVCViewModel {
    
    var sRepo = StudentsRepository()
    var studentsArray = BehaviorSubject<[Students]>(value: [Students]())
    
    
    
    init() {
        
        sRepo.veritabaniKopyala()
        studentsArray = sRepo.studentsArray
        
    }
    
    func search(searchName: String) {
        sRepo.searchStudent(search_name: searchName)
    }
    
    func delete(student_id:Int) {
        sRepo.deleteStudent(student_id: student_id)
        sRepo.loadStudents()
    }
    
    func loadStudents() {
        sRepo.loadStudents()
    }
    
    
    
    
}
