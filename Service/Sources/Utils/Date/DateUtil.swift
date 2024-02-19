import Foundation

public extension String {
    func toBitgouelDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.date(from: self) ?? .init()
    }

    func toISODate(
        options: ISO8601DateFormatter.Options = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime
        ],
        timeZone: TimeZone = .current
    ) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = options
        formatter.timeZone = timeZone
        return formatter.date(from: self) ?? .init()
    }

    func toDateCustomFormat(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? .init()
    }
}

public extension Date {
    func toISOString(
        options: ISO8601DateFormatter.Options = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime
        ]
    ) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = options
        return formatter.string(from: self)
    }

    func toStringCustomFormat(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
