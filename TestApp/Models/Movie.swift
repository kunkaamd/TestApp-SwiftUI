struct Movie : Codable ,Identifiable{
    let id: Int
    let posterPath: String?
    let backdrop: String?
    let title: String?
    let releaseDate: String?
    let rating: Double?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case backdrop = "backdrop_path"
        case title
        case releaseDate = "release_date"
        case rating = "vote_average"
        case overview
    }
}
