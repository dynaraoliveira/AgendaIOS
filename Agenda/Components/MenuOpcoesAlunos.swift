//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Dynara Rico Oliveira on 04/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class MenuOpcoesAlunos: NSObject {
    
    func configuraMenuDeOpcoesDoAluno(navigation:UINavigationController, alunoSelecionado:Aluno) -> UIAlertController {
        
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        guard let viewController = navigation.viewControllers.last else { return menu }
        
        let sms = UIAlertAction(title: "enviar SMS", style: .default) { (acao) in
            Mensagem().enviaSMS(alunoSelecionado, controller: viewController)
        }
        
        let ligacao = UIAlertAction(title: "ligar", style: .default) { (acao) in
            LigacaoTelefonica().fazLigacao(alunoSelecionado)
        }
        
        let waze = UIAlertAction(title: "localizar no waze", style: .default) { (acao) in
            Localizacao().localizaAlunoNoWaze(alunoSelecionado)
        }
        
        let mapa = UIAlertAction(title: "localizar no mapa", style: .default) { (acao) in
            let mapa = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapa") as! MapaViewController
            mapa.aluno = alunoSelecionado
            navigation.pushViewController(mapa, animated: true)
        }
        
        let abrirPaginaWeb = UIAlertAction(title: "abrir página", style: .default) { (acao) in
            Safari().abrePaginaWeb(alunoSelecionado, controller: viewController)
        }
        
        let cancel = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        
        menu.addAction(sms)
        menu.addAction(ligacao)
        menu.addAction(waze)
        menu.addAction(mapa)
        menu.addAction(abrirPaginaWeb)
        menu.addAction(cancel)

        return menu
    }
    
}
