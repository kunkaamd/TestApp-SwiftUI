/* every screen should be start by:
NavigationView {
    ScrollView{
        
    }.navigationBarTitle("Title", displayMode: .inline)
}
*/

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.userData.showMenu = !self.userData.showMenu
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    LandmarkList(showMenu: self.$userData.showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.userData.showMenu ? geometry.size.width/2 : 0)
                    if self.userData.showMenu {
                        SideMenu()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
