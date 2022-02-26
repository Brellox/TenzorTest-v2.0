//
//  DetailApiDelegate.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import Foundation
protocol DetailApiDelegate: AnyObject{
    func MemberResult(cast: [Cast], crew: [Crew])
}
