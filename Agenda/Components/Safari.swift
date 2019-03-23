//
//  Safari.swift
//  Agenda
//
//  Created by Dynara Rico Oliveira on 09/06/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import SafariServices

class Safari: NSObject {
    func abrePagina(_ endereco:String, controller:UIViewController) {
            guard let url = URL(string: endereco) else { return }
            let safariViewController = SFSafariViewController(url: url)
            controller.present(safariViewController, animated: true, completion: nil)
    }
}
