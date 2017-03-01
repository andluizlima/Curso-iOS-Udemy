//
//  ViewController.swift
//  Trabalhando Com Mapas
//
//  Created by Andre Luiz Rodrigues on 28/02/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

//Importar o MapKit
import MapKit
//Adicionar o CoreLocation.framework ao projeto

//Adicionar heranças
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

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
        
        //Aparência do mapa
        mapa.mapType = MKMapType.standard
        
        //Para sumir ou fazer algo aparecer no mapa, coloque mapa.shows... = true/false
        //Exemplo:
        mapa.showsScale = true
        
        
        /*
        //Para setar a região com o setRegion, tem que criar um MKCoordinateRegion com um MKCoordinateRegionMake que precisa de 2 parâmetros e decidir se a animação é true ou false
        //1. A localização (CLLocationCoordinate2DMake) que pede 2 parâmetros do tipo CLLocationDegrees, do qual o parâmetro necessário é a latitude ou longitude da localização
        let local = CLLocationCoordinate2DMake(CLLocationDegrees(35.816667), CLLocationDegrees(10.633333))
        
        //2. O Span - "zoom" - (MKCoordinateSpanMake) que pede também 2 CLLocationDegrees para criar o "delta" e, assim, formar o zoom
        let span = MKCoordinateSpanMake(CLLocationDegrees(0.01), CLLocationDegrees(0.01))
        
        //Ou seja, tem que criar a região e o zoom e cada um recebe 2 parâmetros que são os graus da longitude e latitude, apenas isso
        mapa.setRegion(MKCoordinateRegionMake(local, span), animated: true)
        
        //Criando um pino vazio
        let pino = MKPointAnnotation()
        
        //Definindo a localização do pino
        pino.coordinate = local
        
        //Colocando título e subtítulo no pino
        pino.title = "Sousse"
        pino.subtitle = "Tunísia"
        
        //Implementando o pino no mapa
        mapa.addAnnotation(pino)
         
         */
    }
    
    //Método chamado a cada segundo para conferir a localização e velocidade de locomoção do usuário
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Pega os últimos dados de localização do usuário
        let localizacao = locations.last!
        
        //Pega a latitude e longitude dessa localização
        let local = CLLocationCoordinate2DMake(localizacao.coordinate.latitude, localizacao.coordinate.longitude)
        
        let span = MKCoordinateSpanMake(CLLocationDegrees(0.01), CLLocationDegrees(0.01))
        
        mapa.setRegion(MKCoordinateRegionMake(local, span), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

