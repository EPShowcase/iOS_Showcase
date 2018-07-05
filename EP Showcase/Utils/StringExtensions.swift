//
//  StringExtensions.swift
//  EP Showcase
//
//  Created by Ernest on 30/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }

    func asMongoDate() -> Date? {
        let fromISO = DateFormatter()
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        fromISO.locale = enUSPosixLocale
        fromISO.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return fromISO.date(from: self)
    }
}
