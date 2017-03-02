//
//  ViewController.swift
//  Onde Estou
//
//  Created by Andre Luiz Rodrigues on 01/03/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var velocidadeTexto: UILabel!
    @IBOutlet var enderecoTexto: UILabel!
    @IBOutlet var longitudeTexto: UILabel!
    @IBOutlet var latitudeTexto: UILabel!
    @IBOutlet var mapa: MKMapView!
    
    //Cria o gerenciador de localização do usuário
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Diz que o gerenciador de localização será essa classe aqui
        gerenciadorLocal.delegate = self
        //Define a precisão de localização, podendo ser de kCLLocationAccuracyBest (com ou sem navegação em tempo real) até kCLLocationAccuracyThreeKilometers
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        //Solicita uma autorização para quando o app estiver em uso
        //Também há a opção de always ( requestAlwaysAuthorization() )
        //Mas para isso tem que ter tudo previamente solicitado no Info.plist
        //location-services, gps e Location when in use
        gerenciadorLocal.requestWhenInUseAuthorization()
        //Começa a atualizar a localização do usuário
        gerenciadorLocal.startUpdatingLocation()
        
        //Última coisa a ser feita é marcar a opção User Location no storyboard
        
        mapa.mapType = MKMapType.satellite
        
    }
    
    //Método chamado a cada segundo para conferir a localização e velocidade de locomoção do usuário
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Pega os últimos dados de localização do usuário
        let localizacao = locations.last!
        
        //Pega a latitude e longitude dessa localização
        let local = CLLocationCoordinate2DMake(localizacao.coordinate.latitude, localizacao.coordinate.longitude)
        
        let span = MKCoordinateSpanMake(CLLocationDegrees(0.01), CLLocationDegrees(0.01))
        
        mapa.setRegion(MKCoordinateRegionMake(local, span), animated: true)
        
        latitudeTexto.text = String(localizacao.coordinate.latitude)
        longitudeTexto.text = String(localizacao.coordinate.longitude)
        if localizacao.speed > 0{
            velocidadeTexto.text = String(Int(localizacao.speed * 3.6)) + "Km/h"
        } else {
            velocidadeTexto.text = "0Km/h"
        }
        
        //Função para pegar o endereço através da localização
        //Usa uma closure que pede uma variavel para ser tudo do endereço e outra pra ser o erro
        CLGeocoder().reverseGeocodeLocation(localizacao) { (enderecoResgatado, erro) in
            
            //Aqui verifica se não tem erro, para poder executar o resto do código
            if (erro == nil){
                var endereco = ""
                
                //Daqui para baixo ele só pega o nome dos locais
                //Name: nome do local ou número + rua
                //Thoroughfare: rua
                //SubThoroughfare: número
                //SubLocality: bairro
                if let lugar = enderecoResgatado?.first?.addressDictionary?["Name"] {
                    
                    if let rua = enderecoResgatado?.first?.addressDictionary?["Thoroughfare"] {
                        
                        if let numero = enderecoResgatado?.first?.addressDictionary?["SubThoroughfare"]{
                            
                            if lugar as! String != numero as! String + " " + (rua as! String){
                                endereco += lugar as! String + "\n"
                                endereco += (rua as! String) + ", " + (numero as! String) + "\n"
                            } else {
                                endereco += (rua as! String) + ", " + (numero as! String) + "\n"
                            }
                            
                        } else {
                            if lugar as! String != (rua as! String){
                                endereco += lugar as! String + "\n"
                                endereco += (rua as! String) + "\n"
                            } else {
                                endereco += (rua as! String) + "\n"
                            }
                        }
                    } else {
                        
                        endereco += lugar as! String + "\n"
                        
                    }
                }
                
                
                if let bairro = enderecoResgatado?.first?.addressDictionary?["SubLocality"] {
                    endereco += bairro as! String + "\n"
                }
                if let cidade = enderecoResgatado?.first?.addressDictionary?["City"] {
                    if let estado = enderecoResgatado?.first?.addressDictionary?["State"]{
                        endereco += (cidade as! String) + " - " + (estado as! String) + "\n"
                    } else {
                        endereco += cidade as! String + "\n"
                    }
                    
                }
                if let pais = enderecoResgatado?.first?.addressDictionary?["Country"] {
                    endereco += pais as! String
                }
                self.enderecoTexto.text = endereco
                self.enderecoTexto.sizeToFit()
            }
        }
    }
    
    //Trata a autorização de localização
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //O iOS trata automaticamente dos casos. Se não for autorizado, ele executa isso ai embaixo e só pega a localização para executar propriamente o app se o usuário autorizar
        if status != .authorizedWhenInUse {
            //Cria o alerta em si, definindo o título, mensagem e o estilo (.alert ou .actionSheet)
            let alertaController = UIAlertController(title: "Localização necessária", message: "Para o app funcionar, por favor, vá em Ajustes -> Onde Estou? -> Localização -> Quando em uso", preferredStyle: .alert )
            
            //Cria os botões com o título, estilo (.default, .cancel ou .destructive) e a ação que o botão fará
            //No caso, essa closure abre as configurações do app no Ajustes
            let configuracoes = UIAlertAction(title: "Abrir configurações", style: .default, handler: { (configuracoes) in
                let url = NSURL(string: UIApplicationOpenSettingsURLString)
                if url != nil {
                    UIApplication.shared.open(url as! URL)
                }
            })
            let cancelar = UIAlertAction(title: "Confirmar", style: .destructive , handler: nil)
            
            //Adiciona os botões ao alerta a partir de um método no próprio alerta
            alertaController.addAction(configuracoes)
            alertaController.addAction(cancelar)
            
            //Mostra o alerta tal, se será com animação e o que fazer assim que algo for clicado no alerta
            present(alertaController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

