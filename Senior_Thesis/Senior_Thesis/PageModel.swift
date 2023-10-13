//
//  PageModel.swift
//  Senior_Thesis
//
//  Created by Christopher Sandoval Terry on 10/13/23.
//

import Foundation


struct Page: Identifiable,Equatable
{
    let id = UUID()
    var title: String
    var body: String
    var Tag: Int

    static var samplePage = Page(title:"Title Example", body:"This is a sample\nThis is line two", Tag: 0)


    static var samplepages: [Page] = [
       Page(title: "Attedant", body: "Hello and welcome to our app\nThank you for giving us a try!\n\nAttedant is pretty simple, but we've made a quick guide anyways.\n\nSwipe right or tap \"next\" to go to the next slide.", Tag: 0),
       Page(title: "Sign Up", body:"\n\nPress \"Sign Up\" to create your account", Tag: 1),
       Page(title: "Registar your University", body: "Registar by clicking the search bar and typing in your unviversities name.\n\nFrom there, click student or professor\n\nAnd use your school email so we can verify you are antendee at the unviersity", Tag: 2)
    ]


}
