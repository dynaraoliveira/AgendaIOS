//
//  Mensagem.swift
//  Agenda
//
//  Created by Dynara Rico Oliveira on 04/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMessageComposeViewControllerDelegate {
    
    var delegate:MFMessageComposeViewControllerDelegate?
    
    func setaDelegate() -> MFMessageComposeViewControllerDelegate? {
        delegate = self
        return delegate
    }
    
    // MARK: - Metodos
    
    func enviaSMS(_ aluno:Aluno, controller:UIViewController) {
        
        if MFMessageComposeViewController.canSendText() {
            let compenenteMensagem = MFMessageComposeViewController()
            
            guard let numeroDoAluno = aluno.telefone else { return }
            compenenteMensagem.recipients = [numeroDoAluno]
            
            guard let delegate = setaDelegate() else { return }
            compenenteMensagem.messageComposeDelegate = delegate
            
            controller.present(compenenteMensagem, animated: true, completion: nil)
        }
    }
    
    // MARK: - MessageComposeDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
