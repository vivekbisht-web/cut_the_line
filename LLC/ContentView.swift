import SwiftUI
import SafariServices

struct ContentView: View {
var body: some View {
NavigationStack {
ScrollView {
VStack(spacing: 18) {

Image("CTL Logo")
.resizable()
.scaledToFit()
.frame(height: 200)

Text("Why Waste Time? Cut The Line!")
.font(.headline)
.multilineTextAlignment(.center)

Text("Select Your Location")
.font(.title2)
.fontWeight(.semibold)
.padding(.top)

InAppLocationButton(
name: "Alabama A&M University",
url: "https://order.toasttab.com/online/cut-the-line-2-alabamaam"
)

InAppLocationButton(
name: "Hewitt-Trussville",
url: "https://order.toasttab.com/online/cut-the-line-4-trussville"
)

NavigationLink {
HuntsvilleSideSelectionView()
} label: {
Text("Huntsville City Schools\nMilton Frank Stadium")
.font(.headline)
.multilineTextAlignment(.center)
.frame(maxWidth: .infinity)
.padding()
.background(Color.red)
.foregroundColor(.white)
.cornerRadius(12)
}

InAppLocationButton(
name: "Westminster Christian Academy",
url: "https://order.toasttab.com/online/cut-the-line-3-westminster"
)

InAppLocationButton(
name: "McAdory High School",
url: "https://order.toasttab.com/online/cut-the-line-5-mcadory"
)
}
.padding()
}
}
}
}

struct HuntsvilleSideSelectionView: View {
var body: some View {
VStack(spacing: 22) {

Image("CTL Logo")
.resizable()
.scaledToFit()
.frame(height: 140)

Text("Huntsville City Schools")
.font(.title2)
.fontWeight(.bold)
.multilineTextAlignment(.center)

Text("Milton Frank Stadium")
.font(.headline)
.multilineTextAlignment(.center)

Text("Which side are you sitting on?")
.font(.title3)
.fontWeight(.semibold)
.padding(.top)

Text("Your order will be prepared at the concession stand on the side you select.")
.font(.subheadline)
.multilineTextAlignment(.center)
.padding(.horizontal)

ConfirmInAppLocationButton(
name: "HOME SIDE",
sideName: "HOME SIDE",
url: "https://order.toasttab.com/order-and-pay/cut-the-line-milton-frank/Home"
)

ConfirmInAppLocationButton(
name: "VISITOR SIDE",
sideName: "VISITOR SIDE",
url: "https://order.toasttab.com/order-and-pay/cut-the-line-milton-frank/Visitor%27s"
)

Spacer()
}
.padding()
.navigationTitle("Milton Frank Stadium")
.navigationBarTitleDisplayMode(.inline)
}
}

struct InAppLocationButton: View {
let name: String
let url: String

@State private var showBrowser = false

var body: some View {
Button {
showBrowser = true
} label: {
Text(name)
.font(.headline)
.multilineTextAlignment(.center)
.frame(maxWidth: .infinity)
.padding()
.background(Color.red)
.foregroundColor(.white)
.cornerRadius(12)
}
.sheet(isPresented: $showBrowser) {
if let destination = URL(string: url) {
InAppSafariView(url: destination)
.ignoresSafeArea()
}
}
}
}

struct ConfirmInAppLocationButton: View {
let name: String
let sideName: String
let url: String

@State private var showConfirmation = false
@State private var showBrowser = false

var body: some View {
Button {
showConfirmation = true
} label: {
Text(name)
.font(.headline)
.multilineTextAlignment(.center)
.frame(maxWidth: .infinity)
.padding()
.background(Color.red)
.foregroundColor(.white)
.cornerRadius(12)
}
.alert("Confirm Your Side", isPresented: $showConfirmation) {
Button("Back", role: .cancel) {
}

Button("Yes, Continue") {
showBrowser = true
}
} message: {
Text("You selected the \(sideName). Is this the side where you are currently seated?")
}
.sheet(isPresented: $showBrowser) {
if let destination = URL(string: url) {
InAppSafariView(url: destination)
.ignoresSafeArea()
}
}
}
}

struct InAppSafariView: UIViewControllerRepresentable {
let url: URL

func makeUIViewController(context: Context) -> SFSafariViewController {
let safariViewController = SFSafariViewController(url: url)
safariViewController.dismissButtonStyle = .close
return safariViewController
}

func updateUIViewController(
_ uiViewController: SFSafariViewController,
context: Context
) {
}
}

#Preview {
ContentView()
}
