//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Dynara Rico Oliveira on 19/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {

    var error:NSError?
    
    func autorizaUsuario(completion:@escaping(_ autenticado:Bool) -> Void) {
        let contexto = LAContext()
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "é necessário autenticação para apagar um aluno", reply: { (resposta, erro) in
                completion(resposta)
            })
        }
        
    }
    
}
