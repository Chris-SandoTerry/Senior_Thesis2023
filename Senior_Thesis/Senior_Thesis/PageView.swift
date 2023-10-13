//
//  PageView.swift
//  Senior_Thesis
//
//  Created by Christopher Sandoval Terry on 10/13/23.
//

import SwiftUI

struct PageView: View
{
    var page: Page



    var body: some View
    {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: 350, height: 500)
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))

            VStack()
            {
                Spacer()
                    .frame(height: 40)
                Text(page.title)
                    .frame(width: 340)
                    .font(.largeTitle)

                Spacer()
                    .frame(height: 60)

                Text(page.body)
                    .font(.title2)
                    .frame(width:300)


            }
            .frame(width: 335, height: 540, alignment: .top)
            
            .multilineTextAlignment(.center)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page:Page.samplePage)
    }
}

