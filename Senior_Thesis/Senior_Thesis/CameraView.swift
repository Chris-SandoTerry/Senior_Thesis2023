//  CameraView.swift
//  Software Project New Part
//

import SwiftUI
import CoreLocation

struct CameraViewDemo: View {
    @State private var image: UIImage?
    @State private var isPresentingImagePicker = false
    @State private var isShowingAlert = false
    @State private var locationMessage = ""
    @State private var photoTaken = false

    private let locationManager = LocationManager.shared

    var body: some View {
        NavigationView {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    Text("Tap the camera button to take a picture!")
                        .foregroundColor(.secondary)
                }

                if !locationMessage.isEmpty {
                    Text(locationMessage)
                        .foregroundColor(.secondary)
                }

                Spacer()

                HStack{
                                    Spacer()

                                    Button(action: {

                                    }, label: {
                                        ZStack{
                                            Capsule()
                                                .frame(width: 80, height: 40)
                                            Text("Save")
                                                .foregroundColor(Color.white)
                                                .font(.title3)
                                        }
                                    })
                                    .disabled(!photoTaken)

                                    Spacer()

                                    Button(action: {
                                        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
                                            isShowingAlert = true
                                        } else {
                                            isPresentingImagePicker.toggle()
                                            photoTaken = true
                                        }
                                    }, label: {
                                        Image(systemName: "camera")
                                            .font(.largeTitle)
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .clipShape(Circle())
                                    })

                                    Spacer()

                                    Button(action: {

                                    }, label: {
                                        ZStack{
                                            Capsule()
                                                .frame(width: 80, height: 40)
                                            Text("Post")
                                                .foregroundColor(Color.white)
                                                .font(.title3)
                                        }
                                    })
                                    .disabled(!photoTaken)

                                    Spacer()
                                }
            }
            .navigationTitle("Camera View")
            .sheet(isPresented: $isPresentingImagePicker, onDismiss: loadImage) {
                CameraView(image: $image, locationCallback: { location in
                    reverseGeocode(location: location)
                })
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Device has no camera."),
                    message: nil,
                    dismissButton: .default(Text("Alright"))
                )
            }
        }
    }

    func loadImage() {
        guard let selectedImage = image else { return }
        image = selectedImage
    }
    
    private func reverseGeocode(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemark found for the location.")
                return
            }
            
            let address = getAddress(from: placemark)
            locationMessage = "User took the photo at: \(address)"
        }
    }
    
    private func getAddress(from placemark: CLPlacemark) -> String {
        var addressComponents = [String]()
        
        if let state = placemark.administrativeArea {
            addressComponents.append(state)
        }
        
        if let county = placemark.subAdministrativeArea {
            addressComponents.append(county)
        }
        
        if let zipCode = placemark.postalCode {
            addressComponents.append(zipCode)
        }
        
        return addressComponents.joined(separator: ", ")
    }
}

struct CameraViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        CameraViewDemo()
    }
}
