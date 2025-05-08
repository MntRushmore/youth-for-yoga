import SwiftUI
import AVKit

struct YogaVideo: Identifiable, Codable {
    let id: UUID
    let title: String
    let thumbnailName: String
    let urlString: String
    
    var url: URL? {
        URL(string: urlString)
    }
    
    init(title: String, thumbnailName: String, urlString: String) {
        self.id = UUID()
        self.title = title
        self.thumbnailName = thumbnailName
        self.urlString = urlString
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailName
        case urlString
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.thumbnailName = try container.decode(String.self, forKey: .thumbnailName)
        self.urlString = try container.decode(String.self, forKey: .urlString)
        self.id = UUID()
    }
}

class VideoLibraryViewModel: ObservableObject {
    @Published var videos: [YogaVideo] = [
        YogaVideo(title: "Sample Flow", thumbnailName: "sample_thumb", urlString: "https://example.com/sample_flow.mp4")
    ]
    
    init() {
        loadVideos()
    }
    
    private func loadVideos() {
        guard let url = Bundle.main.url(forResource: "videos", withExtension: "json") else {
            print("Failed to locate videos.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedVideos = try JSONDecoder().decode([YogaVideo].self, from: data)
            DispatchQueue.main.async {
                self.videos = [
                    YogaVideo(title: "Sample Flow", thumbnailName: "sample_thumb", urlString: "https://example.com/sample_flow.mp4")
                ] + decodedVideos
            }
        } catch {
            print("Failed to decode videos.json: \(error)")
        }
    }
}

struct VideoLibraryView: View {
    @StateObject private var viewModel = VideoLibraryViewModel()

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.videos) { video in
                        NavigationLink(destination: VideoPlayerView(video: video)) {
                            VStack {
                                Image(video.thumbnailName)
                                    .resizable()
                                    .aspectRatio(16/9, contentMode: .fill)
                                    .frame(height: 120)
                                    .clipped()
                                    .cornerRadius(8)
                                Text(video.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Yoga Video Library")
        }
    }
}

struct VideoPlayerView: View {
    let video: YogaVideo
    @State private var player: AVPlayer
    
    init(video: YogaVideo) {
        self.video = video
        if let videoURL = video.url {
            self._player = State(initialValue: AVPlayer(url: videoURL))
        } else {
            self._player = State(initialValue: AVPlayer())
        }
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player.play()
            }
            .navigationTitle(video.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    VideoLibraryView()
}
