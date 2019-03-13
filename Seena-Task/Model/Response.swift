/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Response : Codable {
	let id : Int?
	let account_type : Int?
	let name : String?
	let image : String?
	let speciality : String?
	let min_fees : Int?
	let account_id : Int?
	let unique_id : String?
	let is_premium : Int?
	let title : String?
	let my_recommends_count : Int?
	let followers : Int?
	let is_recommended : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case account_type = "account_type"
		case name = "name"
		case image = "image"
		case speciality = "speciality"
		case min_fees = "min_fees"
		case account_id = "account_id"
		case unique_id = "unique_id"
		case is_premium = "is_premium"
		case title = "title"
		case my_recommends_count = "my_recommends_count"
		case followers = "followers"
		case is_recommended = "is_recommended"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		account_type = try values.decodeIfPresent(Int.self, forKey: .account_type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		speciality = try values.decodeIfPresent(String.self, forKey: .speciality)
		min_fees = try values.decodeIfPresent(Int.self, forKey: .min_fees)
		account_id = try values.decodeIfPresent(Int.self, forKey: .account_id)
		unique_id = try values.decodeIfPresent(String.self, forKey: .unique_id)
		is_premium = try values.decodeIfPresent(Int.self, forKey: .is_premium)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		my_recommends_count = try values.decodeIfPresent(Int.self, forKey: .my_recommends_count)
		followers = try values.decodeIfPresent(Int.self, forKey: .followers)
		is_recommended = try values.decodeIfPresent(Int.self, forKey: .is_recommended)
	}

}