// To parse the JSON, add this file to your project and do:
//
//   let sProject = try? newJSONDecoder().decode(SProject.self, from: jsonData)

import Foundation

struct SProject: Codable {
    let data: [SProjectsDatum]
    let paginate, msg: String
    let success: Bool
    let maxNumPages: Int
    let total: String
    
    enum CodingKeys: String, CodingKey {
        case data, paginate, msg, success
        case maxNumPages = "max_num_pages"
        case total
    }
}

struct SProjectsDatum: Codable {
    let postParent: Int
    let postTitle, postName, postContent, postExcerpt: String
    let postAuthor: String
    let postStatus: PostStatus
    let id: Int
    let postType: PostType
    let commentCount: String
    let guid: String
    let statusText: ProjectStatusView
    let postDate: String
    let taxInput: TaxInput
    let projectCategory: [Int]
    let projectType: [JSONAnySProjects]
    let country: [Int]
    let address, avatar, postCount, etFeatured: String
    let etExpiredDate, etBudget, deadline, totalBids: String
    let bidAverage: Double
    let accepted: String
    let projectDeadline: ProjectDeadline
    let etPaymentPackage, postViews: String
    let datumID: Int
    let permalink: String
    let unfilteredContent, thePostThumnail, featuredImage, thePostThumbnail: String
    let etAvatar: String
    let authorURL: String
    let authorName, budget: String
    let bidBudgetText: BidBudgetText
    let ratingScore: Int
    let projectComment, projectCommentTrim, postContentTrim: String
    let countWord: Int
    let projectStatusView: ProjectStatusView
    let textStatusJS: TextStatusJS
    let currentUserBid: Bool
    let postedBy: String
    let skill: [Skill]
    let listSkills, textTotalBid: String
    let textCountry: TextCountry
    let bidWonDate: String?
    
    enum CodingKeys: String, CodingKey {
        case postParent = "post_parent"
        case postTitle = "post_title"
        case postName = "post_name"
        case postContent = "post_content"
        case postExcerpt = "post_excerpt"
        case postAuthor = "post_author"
        case postStatus = "post_status"
        case id = "ID"
        case postType = "post_type"
        case commentCount = "comment_count"
        case guid
        case statusText = "status_text"
        case postDate = "post_date"
        case taxInput = "tax_input"
        case projectCategory = "project_category"
        case projectType = "project_type"
        case country, address, avatar
        case postCount = "post_count"
        case etFeatured = "et_featured"
        case etExpiredDate = "et_expired_date"
        case etBudget = "et_budget"
        case deadline
        case totalBids = "total_bids"
        case bidAverage = "bid_average"
        case accepted
        case projectDeadline = "project_deadline"
        case etPaymentPackage = "et_payment_package"
        case postViews = "post_views"
        case datumID = "id"
        case permalink
        case unfilteredContent = "unfiltered_content"
        case thePostThumnail = "the_post_thumnail"
        case featuredImage = "featured_image"
        case thePostThumbnail = "the_post_thumbnail"
        case etAvatar = "et_avatar"
        case authorURL = "author_url"
        case authorName = "author_name"
        case budget
        case bidBudgetText = "bid_budget_text"
        case ratingScore = "rating_score"
        case projectComment = "project_comment"
        case projectCommentTrim = "project_comment_trim"
        case postContentTrim = "post_content_trim"
        case countWord = "count_word"
        case projectStatusView = "project_status_view"
        case textStatusJS = "text_status_js"
        case currentUserBid = "current_user_bid"
        case postedBy = "posted_by"
        case skill
        case listSkills = "list_skills"
        case textTotalBid = "text_total_bid"
        case textCountry = "text_country"
        case bidWonDate = "bid_won_date"
    }
}

enum BidBudgetText: String, Codable {
    case the0تومان = "0تومان"
    case the10000تومان = "10,000تومان"
}

enum PostStatus: String, Codable {
    case publish = "publish"
}

enum PostType: String, Codable {
    case project = "project"
}

enum ProjectDeadline: String, Codable {
    case empty = ""
    case the20190528184721 = "2019-05-28 18:47:21"
}

enum ProjectStatusView: String, Codable {
    case فعال = "فعال"
}

struct Skill: Codable {
    let name: String
}

struct TaxInput: Codable {
    let skill, projectCategory: [Country]
    let projectType: [JSONAny]
    let country: [Country]
    
    enum CodingKeys: String, CodingKey {
        case skill
        case projectCategory = "project_category"
        case projectType = "project_type"
        case country
    }
}

struct Country: Codable {
    let termID: Int
    let name, slug: String
    let termGroup, termTaxonomyID: Int
    let taxonomy: TaxonomySProjects
    let description: String
    let parent, count: Int
    let filter: FilterSProjects
    
    enum CodingKeys: String, CodingKey {
        case termID = "term_id"
        case name, slug
        case termGroup = "term_group"
        case termTaxonomyID = "term_taxonomy_id"
        case taxonomy, description, parent, count, filter
    }
}

enum FilterSProjects: String, Codable {
    case raw = "raw"
}

enum TaxonomySProjects: String, Codable {
    case country = "country"
    case projectCategory = "project_category"
    case skill = "skill"
}

enum TextCountry: String, Codable {
    case empty = ""
    case آذربایجانغربی = "آذربایجان غربی"
    case تهران = "تهران"
}

enum TextStatusJS: String, Codable {
    case کارفعالاست = "کار فعال است"
}

// MARK: Encode/decode helpers

class JSONNullSProjects: Codable, Hashable {
    
    public static func == (lhs: JSONNullSProjects, rhs: JSONNullSProjects) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNullSProjects.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKeySProjects: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAnySProjects: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNullSProjects()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNullSProjects()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKeySProjects.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKeySProjects>, forKey key: JSONCodingKeySProjects) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNullSProjects()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKeySProjects.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKeySProjects>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNullSProjects {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNullSProjects {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNullSProjects {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
