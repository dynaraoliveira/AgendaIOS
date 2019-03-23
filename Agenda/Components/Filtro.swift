//
//  Filtro.swift
//  Agenda
//
//  Created by Dynara Rico Oliveira on 09/06/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Filtro: NSObject {

    func filtraAlunos(_ listaDeAlunos:Array<Aluno>, texto:String) -> Array<Aluno> {
        let listaAlunosEncontrados = listaDeAlunos.filter { (aluno) -> Bool in
            if let nome = aluno.nome {
                return nome.contains(texto)
            }
            return false
        }
        return listaAlunosEncontrados
    }
    
}
