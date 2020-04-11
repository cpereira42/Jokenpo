//
//  ViewController.swift
//  Jokenpo
//
//  Created by Cezar Pereira on 07/04/20.
//  Copyright © 2020 Cezar Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var temporizador = 300
    var op = 0
    var timer = Timer()
    let opcoes = [#imageLiteral(resourceName: "8"),#imageLiteral(resourceName: "12"),#imageLiteral(resourceName: "11"),#imageLiteral(resourceName: "9"),#imageLiteral(resourceName: "10")]
    var op_maquina = 0
    var op_player : Int? = 0
    //var teste : Int? = 0
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var escolha_player: UIImageView!
    @IBOutlet weak var escolha_maquina: UIImageView!
    @IBOutlet weak var tente_novamente2: UIButton!
    @IBOutlet weak var resultado: UILabel!
    
    @IBAction func tente_novamente(_ sender: UIButton) {
        ativa_timer()
        sender.isHidden = true
    }
    
    @IBAction func opcoes(_ sender: UIButton) {
        escolha_player.image = sender.currentImage
        timer.invalidate()
        op_player = Int(sender.accessibilityLabel!)
        op_maquina = Int.random(in: 0...4)
        escolha_maquina.image = opcoes[op_maquina]
        analisa(op_maquina: op_maquina, op_player: op_player!)
    }
    @IBOutlet weak var choise: UIImageView!
    override func viewDidLoad() {
        ativa_timer()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func mudaimagem()
    {
        if (temporizador > 0)
        {
            if (op == 4)
            {
                op = 0
            }
            else
            {
                op += 1
            }
            escolha_maquina.image = opcoes[op]
            //temporizador -= 1
        }
    }
    @objc func ativa_timer()
    {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(mudaimagem), userInfo: nil ,repeats: true)
    }
    @objc func analisa(op_maquina : Int, op_player : Int)
    {
        //tente_novamente2.isHidden = false
        //print("player\(op_player) maq = \(op_maquina)")
        //ativa_timer()
        if (op_maquina == op_player)
        {
            resultado.text = ""
            status.text = "Empatou"
        }
        else
        {
              
            if (op_player == 0)
            {
                switch op_maquina {
                    case 1:
                        resultado.text = "Papel cobre pedra"
                        status.text = "Perdeu"
                    case 3:
                        resultado.text = "Spock vaporiza pedra"
                        status.text = "Perdeu"
                    case 2 :
                        resultado.text = "Pedra quebra tesoura"
                        status.text = "Ganhou"
                    case 4 :
                        resultado.text = "Pedra esmaga lagarto"
                        status.text = "Ganhou"
                default:
                    resultado.text = ""
                    status.text = "Empatou"
                }
            }

            if (op_player == 1)
            {
                switch op_maquina {
                    case 2:
                         resultado.text = "Tesoura corta papel"
                         status.text = "Perdeu"
                    case 4:
                        resultado.text = "Lagarto come papel"
                        status.text = "Perdeu"
                    case 0 :
                        resultado.text = "Papel cobre pedra"
                        status.text = "Ganhou"
                    case 3 :
                        resultado.text = "Papel refuta spock"
                        status.text = "Ganhou"
                default:
                    resultado.text = ""
                    status.text = "Empatou"
                }
            }
            if (op_player == 2)
            {
                switch op_maquina {
                    case 0:
                         resultado.text = "Pedra quebra tesoura"
                         status.text = "Perdeu"
                    case 3:
                        resultado.text = "Spock esmaga tesoura"
                        status.text = "Perdeu"
                    case 1 :
                        resultado.text = "Tesoura corta papel"
                        status.text = "Ganhou"
                    case 4 :
                        resultado.text = "Tesoura decapta lagarto"
                        status.text = "Ganhou"
                default:
                    resultado.text = ""
                    status.text = "Empatou"
                }
            }
            if (op_player == 3)
            {
                switch op_maquina {
                    case 4:
                         resultado.text = "Lagarto envenena spock"
                         status.text = "Perdeu"
                    case 1:
                        resultado.text = "Papel refuta spocku"
                        status.text = "Perdeu"
                    case 2 :
                        resultado.text = "Spock esmaga tesoura"
                        status.text = "Ganhou"
                    case 0 :
                        resultado.text = "Spock vaporiza pedra"
                        status.text = "Ganhou"
                default:
                    resultado.text = ""
                    status.text = "Empatou"
                }
            }
            if (op_player == 4)
            {
                switch op_maquina {
                    case 2:
                         resultado.text = "Tesoura decapta lagarto"
                         status.text = "Perdeu"
                    case 0:
                        resultado.text = "Pedra esmaga lagarto"
                        status.text = "Perdeu"
                    case 1 :
                        resultado.text = "Lagarto come papel"
                        status.text = "Ganhou"
                    case 3 :
                        resultado.text = "Lagarto envenena spock"
                        status.text = "Ganhou"
                default:
                    resultado.text = ""
                    status.text = "Empatou"
                    
                }
            }
        }
        
    }
    

}

