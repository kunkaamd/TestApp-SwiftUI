import SwiftUI

struct CircleImage: View {
    var width: Int
    var lardmark: Landmark;
    var body: some View {
        lardmark.image
            .resizable()
            .scaledToFit()
            .frame(width: CGFloat(width))
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(width:5,lardmark: landmarkData[0])
    }
}
